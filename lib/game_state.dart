import 'package:equatable/equatable.dart';

class GameState extends Equatable {
  final List<int> scores;
  final List<String> playerNames;
  final bool continueGame;
  final String? loserMessage;
  final int roundCount; // Added roundCount

  GameState({
    required this.scores,
    required this.playerNames,
    required this.continueGame,
    this.loserMessage,
    required this.roundCount, // Initialize in constructor
  });

  GameState copyWith({
    List<int>? scores,
    List<String>? playerNames,
    bool? continueGame,
    String? loserMessage,
    int? roundCount, // Allow roundCount updates
  }) {
    return GameState(
      scores: scores ?? this.scores,
      playerNames: playerNames ?? this.playerNames,
      continueGame: continueGame ?? this.continueGame,
      loserMessage: loserMessage,
      roundCount: roundCount ?? this.roundCount, // Update roundCount
    );
  }

  @override
  List<Object> get props => [scores, playerNames, continueGame, roundCount, loserMessage ?? ''];
}
