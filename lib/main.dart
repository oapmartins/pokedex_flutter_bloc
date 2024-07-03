import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/features/home/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/usecases/fetch_pokemons_usecase.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:pokedex_flutter_bloc/features/home/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_flutter_bloc/features/home/presentation/pages/home_page.dart';

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
                FetchPokemonsUsecase(
                  PokemonRepositoryImpl(
                    PokemonRemoteDataSourceImpl(
                      Dio(),
                    ),
                  ),
                ),
              ),
              child: const HomePage(),
            ),
      },
    );
  }
}
