import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/presentation/screens/history/history_cubit.dart';
import 'package:solid_test_task/presentation/screens/history/history_state.dart';
import 'package:solid_test_task/rgb_color.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("History"),
          backgroundColor: Colors.black,
        ),
        body: ColorsList());
  }
}

class ColorsList extends StatefulWidget {
  const ColorsList({Key? key}) : super(key: key);

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryCubit>().loadColorsHistory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(builder: (context, state) {
      final rgbColors = state.colorsHistory;
      return ListView.builder(
          itemExtent: 50,
          itemCount: rgbColors.length,
          itemBuilder: (BuildContext context, int index) {
            final color = rgbColors[index];
            final red = color.R;
            final green = color.G;
            final blue = color.B;
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, color);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      color: Color.fromRGBO(red, green, blue, 0.5),
                    ),
                    Expanded(
                        child: Center(
                      child: Text("$red, $green, $blue"),
                    ))
                  ],
                ),
              ),
            );
          });
    });
  }
}
