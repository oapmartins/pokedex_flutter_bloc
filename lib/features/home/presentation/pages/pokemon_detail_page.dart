import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex_flutter_bloc/core/utils/constants/color_constants.dart';
import 'package:pokedex_flutter_bloc/features/home/domain/entities/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: ColorConstants.colorsTypePokemons[pokemon.types?.first] ?? Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff1C1B1F),
                    size: 24,
                  ),
                ),
                Text(
                  '#${pokemon.id.toString().padLeft(3, '0')}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.gray500,
                  ),
                ),
                const Icon(FontAwesomeIcons.heart, color: Color(0xff1C1B1F), size: 24),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: 435,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConstants.colorsTypePokemons[pokemon.types?.first] ?? Colors.white,
              ColorConstants.colorsTypePokemons[pokemon.types?.first] ?? Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Hero(
              tag: pokemon.name ?? '',
              child: CachedNetworkImage(
                imageUrl: pokemon.imageUrl,
                width: 260,
              ),
            ),
            Text(
              pokemon.name ?? '',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: ColorConstants.gray500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
