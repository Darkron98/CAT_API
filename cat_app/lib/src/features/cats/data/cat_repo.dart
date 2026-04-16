import 'package:cat_app/src/core/constants/constants.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

import 'cat_api.dart';

class CatRepository {
  final CatApi api;

  CatRepository(this.api);

  Future<List<Cat>> getCats() async {
    return await api.getCats();
  }

  Future<String> _resolveImage(String? imageId) async {
    if (imageId == null || imageId.isEmpty) {
      return Constants.noImgPlaceHolder;
    }

    try {
      final image = await api.getImageById(imageId);
      return image.url;
    } catch (_) {
      return Constants.noImgPlaceHolder;
    }
  }

  Future<List<BreedWithImage>> _mapBreeds(List<Breed> breeds) async {
    final futures = breeds.map((breed) async {
      final imageUrl = await _resolveImage(breed.referenceImageId);

      return BreedWithImage(
        breed: breed,
        imageUrl: imageUrl,
      );
    });

    return await Future.wait(futures);
  }

  Future<List<BreedWithImage>> getBreedsWithImages() async {
    final breeds = await api.getBreeds();
    return _mapBreeds(breeds);
  }

  Future<List<BreedWithImage>> searchBreeds(String query) async {
    final breeds = await api.searchBreeds(query);
    return _mapBreeds(breeds);
  }
}
