part of 'game_bloc.dart';

@freezed
abstract class GameEvent with _$GameEvent {
  factory GameEvent.init() = _init;
}
