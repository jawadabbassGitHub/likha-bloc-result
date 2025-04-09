import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddScore extends GameEvent {
  final int playerIndex;
  final int score;

  AddScore(this.playerIndex, this.score);

  @override
  List<Object> get props => [playerIndex, score];
}

class SetPlayerNames extends GameEvent {
  final List<String> playerNames;

  SetPlayerNames(this.playerNames);

  @override
  List<Object> get props => [playerNames];
}

// New Event: Reset Scores
class ResetScores extends GameEvent {}
