import 'package:cat_app/src/core/constants/constants.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

import 'cat_api.dart';

class CatRepository {
  final CatApi api;

  CatRepository(this.api);

  /// ------------------------------------------------------------
  /// Metodo: getCats
  /// ------------------------------------------------------------
  /// Accion: Obtener lista de imagenes de gatos
  /// Retorna: List<Cat>
  /// Dependencias: api
  /// ------------------------------------------------------------
  Future<List<Cat>> getCats() async {
    return await api.getCats();
  }

  /// ------------------------------------------------------------
  /// Metodo: _resolveImage
  /// ------------------------------------------------------------
  /// Accion: Obtener imagen de gato por id
  /// Params: imageId (String)
  /// Retorna: String
  /// Dependencias: api
  /// ------------------------------------------------------------
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

  /// ------------------------------------------------------------
  /// Metodo: _mapBreeds
  /// ------------------------------------------------------------
  /// Accion: Mapear lista de razas y obtener imagen por raza
  /// Params: breeds (List<Breed>)
  /// Retorna: List<BreedWithImage>
  /// Dependencias: api
  /// ------------------------------------------------------------
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

  /// ------------------------------------------------------------
  /// Metodo: getBreedsWithImages
  /// ------------------------------------------------------------
  /// Accion: Obtener razas con imagen
  /// Params: breeds (List<Breed>)
  /// Retorna: List<BreedWithImage>
  /// Dependencias: api
  /// ------------------------------------------------------------
  Future<List<BreedWithImage>> getBreedsWithImages() async {
    final breeds = await api.getBreeds();
    return _mapBreeds(breeds);
  }

  /// ------------------------------------------------------------
  /// Metodo: searchBreeds
  /// ------------------------------------------------------------
  /// Accion: Obtener razas con imagen segun query ingresada
  /// Params: query (String)
  /// Retorna: List<BreedWithImage>
  /// Dependencias: api
  /// ------------------------------------------------------------
  Future<List<BreedWithImage>> searchBreeds(String query) async {
    final breeds = await api.searchBreeds(query);
    return _mapBreeds(breeds);
  }

  /// ------------------------------------------------------------
  /// Metodo: addFavourite
  /// ------------------------------------------------------------
  /// Accion: Agregar favorito
  /// Params: imageId (String)
  /// Retorna: int
  /// Dependencias: api
  /// ------------------------------------------------------------
  Future<int> addFavourite(String imageId) async {
    return await api.createFavourite(
      imageId: imageId,
      subId: 'my-user-1234',
    );
  }

  /// ------------------------------------------------------------
  /// Metodo: removeFavourite
  /// ------------------------------------------------------------
  /// Accion: Borrar favorito
  /// Params: favouriteId (String)
  /// Retorna: int
  /// Dependencias: api
  /// ------------------------------------------------------------
  Future<int> removeFavourite(String favouriteId) async {
    return await api.deleteFavourite(favouriteId) ?? 400;
  }

  /// ------------------------------------------------------------
  /// Metodo: getFavourites
  /// ------------------------------------------------------------
  /// Accion: Obtener lista de favoritos
  /// Retorna: List<Favourite>
  /// Dependencias: api
  /// ------------------------------------------------------------
  Future<List<Favourite>> getFavourites() async {
    return await api.getFavourites();
  }

  /// ------------------------------------------------------------
  /// Metodo: getInitialData
  /// ------------------------------------------------------------
  /// Accion: Obtener paralelamente razas y favoritos
  /// Retorna: BreedsData
  /// Dependencias: api
  /// ------------------------------------------------------------
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
