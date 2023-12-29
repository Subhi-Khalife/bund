import 'package:bund/core/config/color/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../color/light_mode.dart';
import '../../color/main_colors.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: LightModeTheme())) {
    on<ChangeThemeToLightMode>(_mapChangeThemeToLightMode);
    on<InitApp>(_mapInitApp);
  }

  _mapInitApp(InitApp event, Emitter<ThemeState> emit) async {
    add(ChangeThemeToLightMode());
  }

  _mapChangeThemeToLightMode(ChangeThemeToLightMode event, Emitter<ThemeState> emit) {
    ColorsApp.copyWith(mainColors: LightModeTheme());
    emit(state.copyWith(themeData: LightModeTheme()));
  }
}
