import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_bloc.dart';
import 'game_event.dart';
import 'game_screen.dart';

class PlayerNameScreen extends StatefulWidget {
  @override
  _PlayerNameScreenState createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(
        title: Text("Enter Player Names"),
        backgroundColor: Colors.brown[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(4, (index) {
              return TextField(
                controller: _controllers[index],
                decoration: InputDecoration(
                  labelText: "Player ${index + 1} Name",
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final playerNames = _controllers.map((c) => c.text.isNotEmpty ? c.text : "Player ${_controllers.indexOf(c) + 1}").toList();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<GameBloc>(), // Pass existing GameBloc
                      child: GameScreen(),
                    ),
                  ),
                );

                context.read<GameBloc>().add(SetPlayerNames(playerNames));
              },
              child: Text("Start Game"),
            ),
          ],
        ),
      ),
    );
  }
}
