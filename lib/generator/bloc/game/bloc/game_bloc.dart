import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.dart';

part 'game_state.dart';

part 'game_bloc.freezed.dart';

class GameBloc
    extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameState.state()) {
    on<GameEvent>(
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
    Emitter<GameState> emit,
  ) async {}
}

