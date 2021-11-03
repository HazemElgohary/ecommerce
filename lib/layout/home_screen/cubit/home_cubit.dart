import 'dart:convert';

import 'package:bloc/bloc.dart';
import '/models/data_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Data>? data;
  Future<void> parseJson(String response)async {
    try{
      emit(HomeLoading());
      final dataParse = await json.decode(response.toString()).cast<Map<String, dynamic>>();
      data = dataParse.map<Data>((e) => Data.fromJson(e)).toList();
      emit(HomeLoaded(data!));
    }
    catch(e){
      emit(HomeCantLoad(e.toString()));
    }
  }
}
