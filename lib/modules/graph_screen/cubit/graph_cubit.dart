import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/data_model.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'graph_state.dart';

class GraphCubit extends Cubit<GraphState> {
  final List<Data> data;
  GraphCubit(this.data,) : super(GraphInitial()) {
    getAndParseDate(data);
  }

  final format = DateFormat.yM();
  final List<String> formatedDate = <String>[];
  int ordersCount = 0;

  void getAndParseDate(List<Data> data){
    try{
      for (final i in data) {
        final formatDate = format.format(DateTime.parse(i.registered));
        formatedDate.add(formatDate);
      }
      log(formatedDate.first);
      emit(GraphParsedSuccess(formatedDate));
    }
    catch(e){
      log(e.toString());
      emit(GraphParsedFailed(e.toString()));
    }
  }
  double getOrdersCountInDate(List<Data> data,String date){
    try{

        for(final e in data){
          final formatDate = format.format(DateTime.parse(e.registered));
          if(date == formatDate){
            ordersCount++;
          }

      }
      emit(GraphGetCountSuccess(ordersCount));
    }catch(e){
      log(e.toString());
      emit(GraphGetCountFailed(e.toString()));
    }
    return ordersCount.toDouble();
  }
}
