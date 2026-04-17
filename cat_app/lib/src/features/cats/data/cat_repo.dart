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

  Future<int> addFavourite(String imageId) async {
    return await api.createFavourite(
      imageId: imageId,
      subId: 'my-user-1234',
    );
  }

  Future<int> removeFavourite(String favouriteId) async {
    return await api.deleteFavourite(favouriteId) ?? 400;
  }

  Future<List<Favourite>> getFavourites() async {
    return await api.getFavourites();
  }

  Future<BreedsData> getInitialData() async {
    try {
      final results = await Future.wait([
        getBreedsWithImages(),
        api.getFavourites(),
      ]);

      final breeds = results[0] as List<BreedWithImage>;
      final favourites = results[1] as List<Favourite>;

      return BreedsData(
        breeds: breeds,
        favourites: favourites,
      );
    } catch (e) {
      throw Exception('Error loading initial data');
    }
  }
}

class BreedsLoaded {}
