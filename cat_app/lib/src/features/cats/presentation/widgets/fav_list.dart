import 'package:cat_app/src/core/utils/functions.dart';
import 'package:cat_app/src/core/utils/style/colors.dart';
import 'package:cat_app/src/features/cats/domain/entities/breed.dart';
import 'package:cat_app/src/features/cats/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_app/src/features/cats/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// ------------------------------------------------------------
/// Widget: FavList
/// ------------------------------------------------------------
/// Descripcion:
/// Vista de lista de favoritos
///
/// Responsabilidad:
/// - Renderizar la lista de favoritos
/// - Gestionar favoritos de forma rapida
/// - Mostrar detalles de favorito
///
/// Retorna:
/// Widget visual tipo Lista (ListView)
///
/// Dependencias:
/// - CatBloc
/// ------------------------------------------------------------
class FavList extends StatelessWidget {
  const FavList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is CatInitial) ...[
              const Expanded(
                child: Icon(
                  Icons.pets,
                  size: 100,
                  color: ColorPalette.textColor,
                ),
              )
            ],
            if (state is CatLoading) ...[
              const Expanded(child: PawgressIndicator()),
            ],
            if (state is BreedsLoaded) ...[
              state.favourites.isNotEmpty
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ListView.separated(
                          cacheExtent: 1000,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.favourites.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 15),
                          itemBuilder: (context, i) {
                            BreedWithImage breed = getBreedByImageId(
                                    state.breeds,
                                    state.favourites[i].imageId) ??
                                BreedWithImage(
                                    breed: state.breeds[0].breed,
                                    imageUrl: state.breeds[0].imageUrl);
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: GestureDetector(
                                onTap: () => dinamicModal(
                                  context,
                                  tittle: breed.breed.name,
                                  body: CatDesc(data: breed),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade50,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                        offset: const Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                            width: 80,
                                            height: 90,
                                            child: Image.network(
                                              breed.imageUrl,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Text(
                                        breed.breed.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context.read<CatBloc>().add(
                                                RemoveFavouriteEvent(state
                                                    .favourites[i].id
                                                    .toString()),
                                              );
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Icon(
                                            Icons.bookmark_remove_rounded,
                                            size: 40,
                                            color: Colors.red.shade400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Column(
                            children: const [
                              Icon(
                                Icons.question_mark_rounded,
                                size: 50,
                                color: Colors.grey,
                              ),
                              Text(
                                'No favorites',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
            ],
          ],
        );
      },
    );
  }
}
