import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/presentation/screens/history/history_cubit.dart';
import 'package:solid_test_task/presentation/screens/home/home_cubit.dart';
import 'package:solid_test_task/presentation/screens/history/history_screen.dart';
import 'package:solid_test_task/rgb_color.dart';

import 'home_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit;

  Future<void> _navigateToHistoryScreen() async {
    final RGBColor result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: HistoryCubit(),
          child: HistoryScreen(),
        ),
      ),
    );
    context.read<HomeCubit>().selectColor(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solid test task"),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        final color = state.backgroundColor;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: context.read<HomeCubit>().changeColor,
          child: Container(
            color: Color.fromRGBO(color.R, color.G, color.B, 0.5),
            child: Center(
                child: TextButton(
              onPressed: _navigateToHistoryScreen,
              child: Text(
                "Hey There",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    backgroundColor: Colors.black),
              ),
            )),
          ),
        );
      }),
    );
  }
}
