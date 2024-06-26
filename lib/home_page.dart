import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter_bloc/bloc/home_bloc.dart';
import 'package:pokedex_flutter_bloc/bloc/home_event.dart';
import 'package:pokedex_flutter_bloc/bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(GetPokemonsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Testando o bloc'),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is HomeLoadedState) {
              print(state);
              return SizedBox();
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
