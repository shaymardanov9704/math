part of 'game_bloc.dart';

@freezed
abstract class GameState with _$GameState {
  factory GameState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }
