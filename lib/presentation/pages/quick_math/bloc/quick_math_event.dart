part of 'quick_math_bloc.dart';

@freezed
abstract class QuickMathEvent with _$QuickMathEvent {
  factory QuickMathEvent.init() = _init;
  factory QuickMathEvent.enter() = _enter;
}
