import 'package:cat_app/src/features/cats/data/model/model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/constants/api_constants.dart';

class CatApi {
  final ApiClient client;

  CatApi(this.client);

  /// ------------------------------------------------------------
  /// API: GET v1/images/search
  /// ------------------------------------------------------------
  /// Descripcion: Cosumir API y obtener lista de fotos de gatos
  ///
  /// Headers:
  /// - x-api-key: requerido
  ///
  /// Query Params:
  /// - size, mime_types, format, has_breeds, order, page, limit
  ///
  /// Response:
  /// List<CatModel>
  /// ------------------------------------------------------------
  Future<List<CatModel>> getCats() async {
    final response = await client.get(
      ApiConstants.getCats,
      queryParams: {
        'size': 'med',
        'mime_types': 'jpg',
        'format': 'json',
        'has_breeds': true,
        'order': 'RANDOM',
        'page': 0,
        'limit': 10,
      },
    );

    return (response.data as List)
        .map((json) => CatModel.fromJson(json))
        .toList();
  }

  /// ------------------------------------------------------------
  /// API: GET v1/breeds
  /// ------------------------------------------------------------
  /// Descripcion: Cosumir API y obtener lista de razas de gatos
  ///
  /// Headers:
  /// - x-api-key: requerido
  ///
  /// Response:
  /// List<BreedModel>
  /// ------------------------------------------------------------
  Future<List<BreedModel>> getBreeds() async {
    final response = await client.get(ApiConstants.getBreeds);

    return (response.data as List).map((e) => BreedModel.fromJson(e)).toList();
  }

  /// ------------------------------------------------------------
  /// API: GET v1/images/search/:id
  /// ------------------------------------------------------------
  /// Descripcion: Cosumir API y obtener foto de gato por id
  ///
  /// Headers:
  /// - x-api-key: requerido
  ///
  /// Response:
  /// CatModel
  /// ------------------------------------------------------------
  Future<CatModel> getImageById(String id) async {
    final response = await client.get('${ApiConstants.getCat}$id');
    return CatModel.fromJson(response.data);
  }

  /// ------------------------------------------------------------
  /// API: GET v1/breeds/search
  /// ------------------------------------------------------------
  /// Descripcion: Cosumir API y obtener lista filtrada de razas
  /// por query
  ///
  /// Headers:
  /// - x-api-key: requerido
  ///
  /// Query Params:
  /// - q, attach_image
  ///
  /// Response:
  /// List<BreedModel>
  /// ------------------------------------------------------------
  Future<List<BreedModel>> searchBreeds(String query) async {
    final response = await client.get(
      '${ApiConstants.getBreeds}/search',
      queryParams: {
        'q': query,
        'attach_image': 1,
      },
    );

    return (response.data as List).map((e) => BreedModel.fromJson(e)).toList();
  }

  /// ------------------------------------------------------------
  /// API: POST /v1/favourites
  /// ------------------------------------------------------------
  /// Descripcion: Consumir api para agregar un favorito
  ///
  /// Headers:
  /// - x-api-key: requerido
  ///
  /// Body:
  /// {
  ///   "image_id": string,
  ///   "sub_id": string
  /// }
  ///
  /// Response:
  /// int
  /// ------------------------------------------------------------
  Future<int> createFavourite({
    required String imageId,
    required String subId,
  }) async {
    Response response = await client.post(
      ApiConstants.getFavourites,
      body: {
        "image_id": imageId,
        "sub_id": subId,
      },
    );
    return response.data['id'];
  }

  /// ------------------------------------------------------------
  /// API: DELETE /v1/favourites/:id
  /// ------------------------------------------------------------
  /// Descripcion: Consumir api para agregar un favoritos
  ///
  /// Headers:
  /// - x-api-key: requerido
  ///
  /// Response:
  /// int
  /// ------------------------------------------------------------
  Future<int?> deleteFavourite(String favouriteId) async {
    Response resp =
        await client.del('${ApiConstants.getFavourites}/$favouriteId');
    return resp.statusCode;
  }

  /// ------------------------------------------------------------
  /// API: GET v1/favourites
  /// ------------------------------------------------------------
  /// Descripcion: Cosumir API y obtener lista de favoritos
  ///
  /// Headers:
  /// - x-api-key: requerido
  ///
  /// Response:
  /// List<FavouriteModel>
  /// ------------------------------------------------------------
  Future<List<FavouriteModel>> getFavourites() async {
    final response = await client.get(ApiConstants.getFavourites);

    return (response.data as List)
        .map((e) => FavouriteModel.fromJson(e))
        .toList();
  }
}
