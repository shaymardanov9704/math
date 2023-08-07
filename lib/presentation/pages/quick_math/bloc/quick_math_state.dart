part of 'quick_math_bloc.dart';

@freezed
abstract class QuickMathState with _$QuickMathState {
  factory QuickMathState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }
