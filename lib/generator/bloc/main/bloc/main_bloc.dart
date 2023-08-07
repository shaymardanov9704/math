import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.dart';

part 'main_state.dart';

part 'main_bloc.freezed.dart';

class MainBloc
    extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.state()) {
    on<MainEvent>(
      (event, emit) async {
        if (event is _init) {
          await _emitInit(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _emitInit(
    _init event,
    Emitter<MainState> emit,
  ) async {}
}

