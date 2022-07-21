import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/color_manager.dart';
import 'package:solid_test_task/presentation/screens/home/home_state.dart';
import 'package:solid_test_task/rgb_color.dart';

class HomeCubit extends Cubit<HomeState> {
  final ColorManager _colorManager = ColorManager();

  HomeCubit() : super(HomeState(backgroundColor: RGBColor(R: 0, G: 0, B: 0)));

  void changeColor() {
    var color = _colorManager.generateRandomColor();
    emit(HomeState(backgroundColor: color));
  }

  void selectColor(RGBColor color) {
    emit(HomeState(backgroundColor: color));
  }
}
