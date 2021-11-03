import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/data_model.dart';
import 'package:meta/meta.dart';

part 'first_screen_state.dart';

class FirstScreenCubit extends Cubit<FirstScreenState> {
  final List<Data> data;
  FirstScreenCubit(this.data) : super(FirstScreenInitial()) {
    getAveragePrice(data);
    getNumOfReturns(data);
  }

  double? average;
  int returns = 0;



  void getAveragePrice (List<Data> data){
    double sum = 0;
    for (final i in data){
      sum += double.parse(i.price);
    }

      average = sum / data.length;
    emit(FirstScreenLoaded(average!, returns));
  }

  void getNumOfReturns(List<Data> data) {
    int sum = 0;
    for (final i in data){
      if(i.status == 'RETURNED'){
        sum++;
      }
    }
      returns = sum;
    emit(FirstScreenLoaded(average!, returns));
  }
}
