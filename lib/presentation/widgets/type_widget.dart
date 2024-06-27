import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({
    super.key,
    required this.listTypePokemon,
    required this.typePokemon,
  });

  final List<String> listTypePokemon;
  final String typePokemon;

  @override
  Widget build(BuildContext context) {
    final addPadding = listTypePokemon.length > 1 && listTypePokemon[0] == typePokemon;

    return Padding(
      padding: addPadding ? const EdgeInsets.only(bottom: 4) : EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
        decoration:
            BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svg/Type=$typePokemon.svg',
              width: 15,
            ),
            const SizedBox(width: 4),
            Text(
              typePokemon,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
