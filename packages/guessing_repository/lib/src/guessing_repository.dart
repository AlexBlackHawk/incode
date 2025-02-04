import "package:guesses_data_provider/guesses_data_provider.dart";
import 'package:hpapi_data_provider/hpapi_data_provider.dart';
import 'package:guessing_repository/guessing_repository.dart';
import "dart:math";

class GuessingRepository {
  GuessingRepository({
    required GuessesClient guessesClient,
    required HPApiClient hpApiClient,
  }) : _guessesClient = guessesClient,
       _hpApiClient = hpApiClient;

  final GuessesClient _guessesClient;
  final HPApiClient _hpApiClient;

  late List<Character> characters;

  Future<void> loadCharacters() async {
    characters = await _hpApiClient.getCharacters();
  }

  Character getRandomCharacter() {
    final random = Random();
    var index = random.nextInt(characters.length);
    Character character = characters[index];
    characters.removeAt(index);
    return character;
  }

  void resetGuesses() => _guessesClient.resetGuesses();

  void checkGuess(Character character, String option) {
    Guess newGuess;
    bool isAnswerCorrect = option == character.house;
    Guess? currentGuess = _guessesClient.getGuess(character.id);
    if (currentGuess == null) {
      newGuess = Guess(
        character: character,
        attempts: 1,
        isGuessed: isAnswerCorrect,
      );
    }
    else {
      int newAttemptsNumber = currentGuess.attempts + 1;
      newGuess = currentGuess.copyWith(
        attempts: newAttemptsNumber,
        isGuessed: isAnswerCorrect,
      );
    }
    _guessesClient.saveGuess(newGuess);
  }

  Stream<List<Guess>> getGuesses() => _guessesClient.getGuesses();

  void close() => _guessesClient.close();
}