import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc()
      : super(GameState(
    scores: List.generate(4, (_) => 0),
    playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"],
    continueGame: true,
    roundCount: 0, // Initialize round count in GameState
  )) {
    on<SetPlayerNames>((event, emit) {
      emit(state.copyWith(playerNames: event.playerNames));
    });

    on<AddScore>((event, emit) {
      final newScores = List<int>.from(state.scores);
      newScores[event.playerIndex] += event.score; // Add the entered score

      // Check if all players have entered scores to increase the round count
      bool allPlayersScored = newScores.every((score) => score > 0);
      int updatedRoundCount = allPlayersScored ? state.roundCount + 1 : state.roundCount;

      final continueGame = newScores.where((s) => s >= 101).length != 1;

      String? loserMessage;
      if (!continueGame) {
        List<String> losers = [];
        for (int i = 0; i < newScores.length; i++) {
          if (newScores[i] >= 101) losers.add(state.playerNames[i]);
        }
        if (losers.isNotEmpty) {
          loserMessage = "${losers.join(' & ')} خسرا";
        }
      }

      emit(state.copyWith(
        scores: newScores,
        continueGame: continueGame,
        loserMessage: loserMessage,
        roundCount: updatedRoundCount, // Correct way to update round count
      ));
    });

    // Reset Scores Implementation
    on<ResetScores>((event, emit) {
      emit(GameState(
        scores: List.generate(4, (_) => 0),
        playerNames: state.playerNames,
        continueGame: true,
        roundCount: 0, // Reset round count properly
      ));
    });
  }
}
