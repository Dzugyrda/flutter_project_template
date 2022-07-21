import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/color_manager.dart';
import 'package:solid_test_task/presentation/screens/history/history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final ColorManager _colorManager = ColorManager();

  HistoryCubit() : super(HistoryState(colorsHistory: []));

  void loadColorsHistory() {
    var colorsHistory = _colorManager.getColorsHistory();
    emit(HistoryState(colorsHistory: colorsHistory));
  }
}
