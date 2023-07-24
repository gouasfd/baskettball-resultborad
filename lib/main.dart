import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resultboard/bloc/cubit_conter.dart';
import 'board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cubitconter(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "result board",
          theme: ThemeData(
            primaryColor: Colors.red,
            brightness: Brightness.dark,
          ),
          home: Resultboard(),
        
      ),
    );
  }
}
