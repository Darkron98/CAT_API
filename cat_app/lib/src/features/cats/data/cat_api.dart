import 'package:cat_app/src/features/cats/data/model/model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/constants/api_constants.dart';

class CatApi {
  final ApiClient client;

  CatApi(this.client);

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

  Future<List<BreedModel>> getBreeds() async {
    final response = await client.get(ApiConstants.getBreeds);

    return (response.data as List).map((e) => BreedModel.fromJson(e)).toList();
  }

  Future<CatModel> getImageById(String id) async {
    final response = await client.get('${ApiConstants.getCat}$id');
    return CatModel.fromJson(response.data);
  }

  Future<List<BreedModel>> searchBreeds(String query) async {
    final response = await client.get(
      'v1/breeds/search',
      queryParams: {
        'q': query,
        'attach_image': 1,
      },
    );

    return (response.data as List).map((e) => BreedModel.fromJson(e)).toList();
  }

  Future<int> createFavourite({
    required String imageId,
    required String subId,
  }) async {
    Response response = await client.post(
      'v1/favourites',
      body: {
        "image_id": imageId,
        "sub_id": subId,
      },
    );
    return response.data['id'];
  }

  Future<int?> deleteFavourite(String favouriteId) async {
    Response resp = await client.del('v1/favourites/$favouriteId');
    return resp.statusCode;
  }

  Future<List<FavouriteModel>> getFavourites() async {
    final response = await client.get('v1/favourites');

    return (response.data as List)
        .map((e) => FavouriteModel.fromJson(e))
        .toList();
  }
}
