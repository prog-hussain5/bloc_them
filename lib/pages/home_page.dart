// ignore_for_file: use_super_parameters

import 'package:bloc_them/internet/bloc/internet_bloc.dart';
import 'package:bloc_them/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ));
            },
          )
        ],
      ),
      body:  BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is NotConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ConnectedState) {
            return _buildTextWidget(state.message);
          } else if (state is NotConnectedState) {
            return _buildTextWidget(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }
   Widget _buildTextWidget(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}