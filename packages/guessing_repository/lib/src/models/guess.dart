import 'package:equatable/equatable.dart';
import 'package:hpapi_data_provider/hpapi_data_provider.dart';

class Guess extends Equatable {
  const Guess({
    required this.character,
    required this.attempts,
    required this.isGuessed,
  });

  final Character character;
  final int attempts;
  final bool isGuessed;

  Guess copyWith({
    Character? character,
    int? attempts,
    bool? isGuessed,
  }) {
    return Guess(
      character: character ?? this.character,
      attempts: attempts ?? this.attempts,
      isGuessed: isGuessed ?? this.isGuessed,
    );
  }

  @override
  List<Object> get props => [
    character,
    attempts,
    isGuessed,
  ];
}