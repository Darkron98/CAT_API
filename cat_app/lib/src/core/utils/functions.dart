import '../../features/cats/domain/entities/entities.dart';

String fixImageUrl(String url) {
  return url.replaceFirst('cdn2.thecatapi.com', 'cdn.thecatapi.com');
}

bool isFavourite(List<Favourite> favs, String imageId) {
  return favs.any((f) => f.imageId == imageId);
}

BreedWithImage? getBreedByImageId(
  List<BreedWithImage> breeds,
  String imageId,
) {
  try {
    return breeds.firstWhere(
      (b) => b.breed.referenceImageId == imageId,
    );
  } catch (_) {
    return null;
  }
}
