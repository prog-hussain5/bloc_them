import 'package:bloc_them/them/app_them.dart';
import 'package:bloc_them/them/them_cash.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'them_event.dart';
part 'them_state.dart';

class ThemBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemBloc() : super(ThemInitial()) {
    on<ThemeEvent>((event, emit)async {
      if (event is GetCurrentThemeEvent) {
        final themeIndex = await ThemeCacheHelper().getCachedThemeIndex();
        final theme = AppTheme.values
            .firstWhere((appTheme) => appTheme.index == themeIndex);
        emit(LoadedThemeState(themeData: appThemeData[theme]!));
      } else if (event is ThemeChangedEvent) {
        final themeIndex = event.theme.index;
        await ThemeCacheHelper().cacheThemeIndex(themeIndex);
        emit(LoadedThemeState(themeData: appThemeData[event.theme]!));
      }
    });
  }
}
