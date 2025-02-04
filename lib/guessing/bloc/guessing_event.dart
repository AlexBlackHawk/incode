part of 'guessing_bloc.dart';

final class GuessingEvent extends Equatable {
  const GuessingEvent();

  @override
  List<Object?> get props => [];
}

final class GuessingQueryChanged extends GuessingEvent {
  const GuessingQueryChanged({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}

final class GuessingResetPressed extends GuessingEvent {
  const GuessingResetPressed();
}

final class GuessingSubscribed extends GuessingEvent {
  const GuessingSubscribed();
}

final class GuessingHouseClicked extends GuessingEvent {
  const GuessingHouseClicked({required this.house});

  final String house;

  @override
  List<Object> get props => [house];
}

final class GuessingCharacterSet extends GuessingEvent {
  const GuessingCharacterSet({required this.character});

  final Character? character;

  @override
  List<Object?> get props => [character];
}