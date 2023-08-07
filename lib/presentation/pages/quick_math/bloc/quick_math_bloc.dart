import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_math_event.dart';

part 'quick_math_state.dart';

part 'quick_math_bloc.freezed.dart';

class QuickMathBloc
    extends Bloc<QuickMathEvent, QuickMathState> {
  QuickMathBloc() : super(QuickMathState.state()) {
    on<QuickMathEvent>(
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
    Emitter<QuickMathState> emit,
  ) async {}
}

