part of 'graph_cubit.dart';

@immutable
abstract class GraphState {}

class GraphInitial extends GraphState {}
class GraphLoading extends GraphState {}
class GraphParsedSuccess extends GraphState {
  final List<String> formatedDate;

  GraphParsedSuccess(this.formatedDate);
}
class GraphParsedFailed extends GraphState {
  final String msg;

  GraphParsedFailed(this.msg);
}


class GraphGetCountSuccess extends GraphState {
  final int count;

  GraphGetCountSuccess(this.count);
}
class GraphGetCountFailed extends GraphState {
  final String msg;

  GraphGetCountFailed(this.msg);

}