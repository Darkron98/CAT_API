import 'package:cat_app/src/core/utils/style/colors.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';
import 'package:cat_app/src/features/cats/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class CatDesc extends StatelessWidget {
  CatDesc({
    super.key,
    required this.data,
  });

  final BreedWithImage data;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.network(
              data.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(
                  child: Icon(
                    Icons.pets,
                    size: 100,
                    color: ColorPalette.textColor,
                  ),
                );
              },
              errorBuilder: (_, __, ___) {
                return Image.network(
                  Constants.noImgPlaceHolder,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          data.breed.description,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 228, 228, 228),
              ),
              child: CatDetails(
                controller: _controller,
                data: data,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
