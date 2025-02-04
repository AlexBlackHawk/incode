part of 'guessing_bloc.dart';

final class GuessingState extends Equatable {
  const GuessingState({
    this.success = 0,
    this.currentCharacter = Character.empty,
    this.failed = 0,
    this.filterQuery = "",
    this.guesses = const <Guess>[],
    this.total = 0,
  });

  final int total;
  final int success;
  final int failed;
  final List<Guess> guesses;
  final Character currentCharacter;
  final String filterQuery;

  List<Guess> get filteredGuesses => guesses.where((guess) => guess.character.name.toLowerCase().contains(filterQuery.toLowerCase())).toList();

  GuessingState copyWith({
    int? total,
    int? success,
    int? failed,
    List<Guess>? guesses,
    Character? currentCharacter,
    String? filterQuery,
  }) {
    return GuessingState(
    total: total ?? this.total,
    success: success ?? this.success,
    failed: failed ?? this.failed,
    guesses: guesses ?? this.guesses,
    currentCharacter: currentCharacter ?? this.currentCharacter,
    filterQuery: filterQuery ?? this.filterQuery,
    );
  }

  @override
  List<Object> get props => [
    total,
    success,
    failed,
    guesses,
    currentCharacter,
    filterQuery,
  ];
}

