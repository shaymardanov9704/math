part of 'quick_math_bloc.dart';

@freezed
abstract class QuickMathState with _$QuickMathState {
  factory QuickMathState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
    @Default(0)int numberA,
    @Default(0)int numberB,
    @Default(0)int result,
    @Default(0)int timer,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }
