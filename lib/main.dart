import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_bloc.dart';
import 'palyer_name_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),  // Make GameBloc available to all screens
      child: MaterialApp(
        title: 'Likha Card Game',
        theme: ThemeData.dark(),
        home: PlayerNameScreen(),
      ),
    );
  }
}
