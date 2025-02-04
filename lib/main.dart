import 'package:flutter/material.dart';
import 'package:guesses_data_provider/guesses_data_provider.dart';
import 'package:guessing_repository/guessing_repository.dart';
import 'package:hpapi_data_provider/hpapi_data_provider.dart';

import 'package:incode/app/app.dart';

Future<void> main() async {
  final guessesClient = GuessesClient();
  final hpApiClient = HPApiClient();
  final GuessingRepository guessingRepository = GuessingRepository(guessesClient: guessesClient, hpApiClient: hpApiClient);
  await guessingRepository.loadCharacters();
  runApp(App(guessingRepository: guessingRepository,));
}
