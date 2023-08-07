part of 'main_bloc.dart';

@freezed
abstract class MainState with _$MainState {
  factory MainState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }
