part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterResult extends FilterState {
  final List<Photo> photos;

  FilterResult(this.photos);
}
