part of 'them_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
  
  @override
  List<Object> get props => [];
}

final class ThemInitial extends ThemeState {}

class LoadedThemeState extends ThemeState {
  final ThemeData themeData;
 const LoadedThemeState({
    required this.themeData,
  });

  @override
  List<Object> get props => [themeData];
}