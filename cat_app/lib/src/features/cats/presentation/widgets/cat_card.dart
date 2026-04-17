import 'package:cat_app/src/core/constants/constants.dart';
import 'package:cat_app/src/core/utils/functions.dart';
import 'package:cat_app/src/core/utils/style/colors.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';
import 'package:cat_app/src/features/cats/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_app/src/features/cats/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// ------------------------------------------------------------
/// Widget: CatCard
/// ------------------------------------------------------------
/// Descripcion:
/// Tarjeta que muestra la información de una raza de gato,
/// incluyendo imagen y nombre, ademas permite acceder a
/// informacion detallada del gato.
///
/// Responsabilidad:
/// - Renderizar datos del gato
/// - Permitir marcar/desmarcar favorito
///
/// Parametros:
/// - data: información del gato (BreedWithImage)
///
/// Retorna:
/// Widget visual tipo card
///
/// Dependencias:
/// - CatBloc
/// ------------------------------------------------------------
class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.data});

  final BreedWithImage data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatState>(
      builder: (context, state) {
        if (state is BreedsLoaded) {
          bool isFav = isFavourite(
            state.favourites,
            data.breed.referenceImageId ?? '',
          );
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: SizedBox(
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
                              GestureDetector(
                                onTap: () {
                                  final imageId =
                                      data.breed.referenceImageId ?? '';

                                  if (isFav) {
                                    final fav = state.favourites.firstWhere(
                                      (f) => f.imageId == imageId,
                                    );

                                    context.read<CatBloc>().add(
                                          RemoveFavouriteEvent(
                                              fav.id.toString()),
                                        );
                                  } else {
                                    context.read<CatBloc>().add(
                                          AddFavouriteEvent(imageId),
                                        );
                                  }
                                },
                                child: Icon(
                                  isFav
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  size: 35,
                                ),
                              )
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
        return const SizedBox();
      },
    );
  }
}
