import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:guessing_repository/guessing_repository.dart';

class GuessesClient {
  final _guessesStreamController = BehaviorSubject<List<Guess>>.seeded(const [],);

  Stream<List<Guess>> getGuesses() => _guessesStreamController.asBroadcastStream();

  void close() => _guessesStreamController.close();

  void resetGuesses() {
    _guessesStreamController.add(const [],);
  }

  void saveGuess(Guess newGuess) {
    final guesses = [..._guessesStreamController.value];
    final guessIndex = guesses.indexWhere((guess) => guess.character.id == newGuess.character.id);
    if (guessIndex >= 0) {
      guesses[guessIndex] = newGuess;
    } else {
      guesses.add(newGuess);
    }

    _guessesStreamController.add(guesses);
  }

  Guess? getGuess(String id) {
    return _guessesStreamController.value.where((guess) => guess.character.id == id).firstOrNull;
  }
}