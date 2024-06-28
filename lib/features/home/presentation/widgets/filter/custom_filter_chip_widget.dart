import 'package:flutter/material.dart';
import 'package:pokedex_flutter_bloc/constants/color_constants.dart';

class CustomFilterChipWidget extends StatelessWidget {
  const CustomFilterChipWidget({
    super.key,
    required this.nameFilter,
  });

  final String nameFilter;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor: Colors.white,
      side: const BorderSide(
        color: ColorConstants.gray200,
        width: 1,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      label: Text(
        nameFilter,
        style: const TextStyle(
          color: ColorConstants.gray500,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      onSelected: (val) {},
    );
  }
}
