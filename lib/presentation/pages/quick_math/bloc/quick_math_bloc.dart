import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_math_event.dart';

part 'quick_math_state.dart';

part 'quick_math_bloc.freezed.dart';

class QuickMathBloc extends Bloc<QuickMathEvent, QuickMathState> {
  QuickMathBloc() : super(QuickMathState.state()) {
    on<QuickMathEvent>(
      (event, emit) async {
        if (event is _init) {
          await _emitInit(event, emit);
        } else if (event is _enter) {
          await _emitEnter(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _emitInit(
    _init event,
    Emitter<QuickMathState> emit,
  ) async {
    for (int i = 1; i <= 300; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        emit(state.copyWith(timer: i));
      });
    }
  }

  Future<void> _emitEnter(
    _enter event,
    Emitter<QuickMathState> emit,
  ) async {
    emit(state.copyWith(result: 100));
  }
}
