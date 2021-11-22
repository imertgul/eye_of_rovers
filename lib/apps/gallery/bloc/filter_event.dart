part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}

class AddFilter extends FilterEvent{
  final Camera camera;
  final int sol;

  AddFilter(this.camera, this.sol);
}
