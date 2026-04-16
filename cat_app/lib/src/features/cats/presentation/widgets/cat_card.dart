import 'package:cat_app/src/core/constants/constants.dart';
import 'package:cat_app/src/core/utils/style/colors.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';
import 'package:cat_app/src/features/cats/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.data});

  final BreedWithImage data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () => dinamicModal(
          context,
          tittle: data.breed.name,
          body: CatDesc(data: data),
        ),
        child: Container(
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                height: 275,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.breed.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        const Text(
                          '',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
