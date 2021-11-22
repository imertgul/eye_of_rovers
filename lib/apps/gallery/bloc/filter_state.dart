part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}


class ResponseLoading extends FilterState {}

class FilterError extends FilterState {
  final String message;

  FilterError(this.message);
}

class FilterResult extends FilterState {
  final Iterable<Photo> photos;

  FilterResult(this.photos);
}
