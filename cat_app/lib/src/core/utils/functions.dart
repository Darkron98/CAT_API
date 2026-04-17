import '../../features/cats/domain/entities/entities.dart';

/// ------------------------------------------------------------
/// Metodo: isFavourite
/// ------------------------------------------------------------
/// Accion: Validar si un imageId es favorito
/// Params: favs (List<Favourite>), imageId (String)
/// Retorna: bool
/// Dependencias: standalone
/// ------------------------------------------------------------
bool isFavourite(List<Favourite> favs, String imageId) {
  return favs.any((f) => f.imageId == imageId);
}

/// ------------------------------------------------------------
/// Metodo: getBreedByImageId
/// ------------------------------------------------------------
/// Accion: Obtener una raza de la lista de razas por id imagen
/// Params: breeds (List<BreedWithImage>), imageId (String)
/// Retorna: BreedWithImage
/// Dependencias: standalone
/// ------------------------------------------------------------
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
