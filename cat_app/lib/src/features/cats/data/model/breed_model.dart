import 'package:cat_app/src/features/cats/domain/entities/breed.dart';

import 'weight_model.dart';

class BreedModel extends Breed {
  BreedModel(
      {required super.weight,
      required super.id,
      required super.name,
      required super.temperament,
      required super.origin,
      required super.description,
      required super.lifeSpan,
      required super.adaptability,
      required super.affectionLevel,
      required super.childFriendly,
      required super.dogFriendly,
      required super.energyLevel,
      required super.intelligence,
      super.wikipediaUrl,
      super.referenceImageId});

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
      weight: WeightModel.fromJson(json['weight'] ?? {}),
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      description: json['description'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      adaptability: json['adaptability'] ?? 0,
      affectionLevel: json['affection_level'] ?? 0,
      childFriendly: json['child_friendly'] ?? 0,
      dogFriendly: json['dog_friendly'] ?? 0,
      energyLevel: json['energy_level'] ?? 0,
      intelligence: json['intelligence'] ?? 0,
      wikipediaUrl: json['wikipedia_url'],
      referenceImageId: json['reference_image_id'],
    );
  }
}

class BreedWithImageModel extends BreedWithImage {
  BreedWithImageModel({
    required super.breed,
    required super.imageUrl,
  });
}
