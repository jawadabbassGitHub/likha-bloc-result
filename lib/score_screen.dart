import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_bloc.dart';
import 'game_state.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Score", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  Divider(color: Colors.white),
                  ...List.generate(state.scores.length, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(state.playerNames[index], style: TextStyle(fontSize: 20, color: Colors.white)),
                        Text(state.scores[index].toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: state.scores[index] >= 101 ? Colors.red : Colors.green)),
                      ],
                    );
                  }),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back to Game"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
