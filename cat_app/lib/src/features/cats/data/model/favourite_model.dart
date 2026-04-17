import 'package:cat_app/src/features/cats/domain/entities/favourite.dart';

class FavouriteModel extends Favourite {
  FavouriteModel({
    required super.id,
    required super.imageId,
    required super.imageUrl,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      imageId: json['image_id'] ?? '',
      imageUrl: json['image']?['url'] ?? '',
    );
  }
}
