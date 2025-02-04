import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guessing_repository/guessing_repository.dart';
import 'package:hpapi_data_provider/hpapi_data_provider.dart';

part 'guessing_event.dart';
part 'guessing_state.dart';

class GuessingBloc extends Bloc<GuessingEvent, GuessingState> {
  GuessingBloc({
    required GuessingRepository guessingRepository,
  }) : _guessingRepository = guessingRepository,
       super(GuessingState()) {
    on<GuessingQueryChanged>(_onQueryChanged);
    on<GuessingResetPressed>(_onResetPressed);
    on<GuessingSubscribed>(_onSubscribed);
    on<GuessingHouseClicked>(_onHouseClicked);
    on<GuessingCharacterSet>(_onCharacterSet);
  }

  final GuessingRepository _guessingRepository;

  void _onQueryChanged(GuessingQueryChanged event, Emitter<GuessingState> emit) {
    emit(
      state.copyWith(
        filterQuery: event.query,
      )
    );
  }

  Future<void> _onResetPressed(GuessingResetPressed event, Emitter<GuessingState> emit) async {
    _guessingRepository.resetGuesses();
    await _guessingRepository.loadCharacters();
  }

  Future<void> _onSubscribed(GuessingSubscribed event, Emitter<GuessingState> emit) {
    return emit.forEach<List<Guess>>(
      _guessingRepository.getGuesses(),
      onData: (guesses) => state.copyWith(
        guesses: guesses,
        total: guesses.fold<int>(0, (sum, guess) => sum + guess.attempts),
        success: guesses.where((guess) => guess.isGuessed).length,
        failed: guesses.where((guess) => !guess.isGuessed).length,
      ),
    );
  }

  void _onHouseClicked(GuessingHouseClicked event, Emitter<GuessingState> emit) {
    _guessingRepository.checkGuess(state.currentCharacter, event.house);
  }

  void _onCharacterSet(GuessingCharacterSet event, Emitter<GuessingState> emit) {
    Character character = event.character ?? _guessingRepository.getRandomCharacter();

    emit(
        state.copyWith(
          currentCharacter: character,
        )
    );
  }
}
