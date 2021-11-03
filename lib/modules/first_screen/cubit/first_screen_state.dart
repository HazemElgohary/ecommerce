part of 'first_screen_cubit.dart';

@immutable
abstract class FirstScreenState {}

class FirstScreenInitial extends FirstScreenState {}
class FirstScreenLoaded extends FirstScreenState {
  final double average;
  final int returns;

  FirstScreenLoaded(this.average, this.returns);
}
