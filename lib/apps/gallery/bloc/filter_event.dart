part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}

class AddFilter extends FilterEvent{
  final String cameraName;
  final int sol;

  AddFilter(this.cameraName, this.sol);
}
