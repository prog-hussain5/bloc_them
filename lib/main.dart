import 'package:bloc_them/pages/home_page.dart';
import 'package:bloc_them/them/bloc/them_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet/bloc/internet_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) =>InternetBloc(),
    ),
    BlocProvider(
      create: (context) => ThemBloc()..add(GetCurrentThemeEvent()),
    ),
  ],
  child: BlocBuilder<ThemBloc, ThemeState>(
    builder: (context, state) {
      if (state is LoadedThemeState) {
        return MaterialApp(
          theme: state.themeData,
          debugShowCheckedModeBanner: false,
          title: 'Theme App',
          home: const HomePage(),
        );
      }
      return Container();

    },
  ),
);
  }
}
