part of 'main_bloc.dart';

@freezed
abstract class MainEvent with _$MainEvent {
  factory MainEvent.init() = _init;
}
