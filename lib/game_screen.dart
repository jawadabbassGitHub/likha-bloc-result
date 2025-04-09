import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';
import 'score_screen.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(
        title: Text('Likha Card Game'),
        backgroundColor: Colors.brown[900],
        actions: [
          IconButton(
            icon: Icon(Icons.score),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreScreen()));
            },
          ),
        ],
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Column(
            children: [
              ...List.generate(4, (index) {
                return Card(
                  color: Colors.grey[850],
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(state.playerNames[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Score: ${state.scores[index]}', style: TextStyle(fontSize: 18, color: state.scores[index] >= 101 ? Colors.red : Colors.green)),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(38, (i) {
                              return TextButton(
                                onPressed: () {
                                  context.read<GameBloc>().add(AddScore(index, i));
                                },
                                child: Text('$i', style: TextStyle(color: Colors.white)),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              if (!state.continueGame && state.loserMessage != null)
                Text(state.loserMessage!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Reset Scores Button
                  ElevatedButton(
                    onPressed: () {
                      context.read<GameBloc>().add(ResetScores());
                    },
                    child: Text("Reset Scores"),
                  ),

                  // Show Result Button
                  ElevatedButton(
                    onPressed: () {
                      if (state.roundCount == 3) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Result"),
                              content: Text("3melnelak jam3a lal scorat tekram !"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text("Show Result"),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
