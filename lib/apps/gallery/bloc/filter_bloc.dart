import 'package:bloc/bloc.dart';
import 'package:eye_of_rovers/helpers/nasa_helper.dart';
import 'package:eye_of_rovers/models/photo/photo.dart';
import 'package:eye_of_rovers/models/rover.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final Rover rover;
  FilterBloc({required this.rover}) : super(ResponseLoading()) {
    on<FilterEvent>((event, emit) async {
      if (event is AddFilter) {
        try {
          emit(ResponseLoading());
          var res = await NasaHelper.imagesBySol(
              rover: rover, sol: event.sol, camera: event.cameraName);
          emit(FilterResult(res.photos));
        } on Exception catch (e) {
          emit(FilterError(e.toString()));
        }
      }
      // emit(FilterError('No state'));
    });
  }
}
