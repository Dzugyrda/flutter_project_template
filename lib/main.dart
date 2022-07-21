import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/presentation/screens/home/home_screen.dart';
import 'package:solid_test_task/presentation/screens/home/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Solid Test Task",
      home: BlocProvider.value(
        value: _homeCubit,
        child: HomeScreen(),
      ),
    );
  }
}
