import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.arrow_back_ios, color: Color(0xff1C1B1F), size: 20),
              Text(pokemon.id.toString()),
              const Icon(Icons.heart_broken_outlined, color: Color(0xff1C1B1F), size: 20),
            ],
          ),
          CachedNetworkImage(imageUrl: pokemon.imageUrl),
          Text(pokemon.name ?? ''),
        ],
      ),
    );
  }
}
