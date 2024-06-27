import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/bloc/home_bloc.dart';
import 'package:pokedex_flutter_bloc/data/dataproviders/home_api.dart';
import 'package:pokedex_flutter_bloc/data/repositories/home_repository.dart';
import 'package:pokedex_flutter_bloc/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/': (context) => BlocProvider(
              create: (_) => HomeBloc(
                homeRepository: HomeRepository(
                  dataProvider: HomeApi(),
                ),
              ),
              child: const HomePage(),
            ),
      },
    );
  }
}
