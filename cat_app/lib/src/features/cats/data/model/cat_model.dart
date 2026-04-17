import '../../domain/entities/cat.dart';
import 'breed_model.dart';

class CatModel extends Cat {
  CatModel({
    required super.id,
    required super.url,
    required super.width,
    required super.height,
    required super.breeds,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      breeds: (json['breeds'] as List? ?? [])
          .map((e) => BreedModel.fromJson(e))
          .toList(),
    );
  }
}
