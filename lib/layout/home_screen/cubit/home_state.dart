part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<Data> data;

  HomeLoaded(this.data);
}
class HomeCantLoad extends HomeState {
  final String msg;

  HomeCantLoad(this.msg);
}
