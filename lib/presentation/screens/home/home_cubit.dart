import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_task/manager/color_manager.dart';
import 'package:solid_test_task/presentation/screens/home/home_state.dart';
import 'package:solid_test_task/model/rgb_color.dart';

class HomeCubit extends Cubit<HomeState> {
  final ColorManager _colorManager = ColorManager();

  HomeCubit() : super(HomeState(backgroundColor: RGBColor(R: 0, G: 0, B: 0)));

  /// function for generate random color with ColorManager and display on home screen
  void changeColor() {
    final color = _colorManager.generateRandomColor();
    emit(HomeState(backgroundColor: color));
  }

  /// function for select color on history screen and replacement on home screen
  void selectColor(RGBColor color) {
    emit(HomeState(backgroundColor: color));
  }
}
