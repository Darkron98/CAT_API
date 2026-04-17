import 'package:cat_app/src/features/cats/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class Breed {
  final Weight weight;

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final String lifeSpan;

  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int intelligence;

  final String? wikipediaUrl;

  final String? referenceImageId;

  final bool? favourite;

  Breed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.intelligence,
    required this.weight,
    this.wikipediaUrl,
    this.referenceImageId,
    this.favourite,
  });
}

class BreedWithImage {
  final Breed breed;
  final String imageUrl;

  BreedWithImage({
    required this.breed,
    required this.imageUrl,
  });
}

class BreedsData {
  final List<BreedWithImage> breeds;
  final List<Favourite> favourites;

  BreedsData({
    required this.breeds,
    required this.favourites,
  });
}
