import 'package:cat_app/src/features/cats/data/cat_repo.dart';

/// ------------------------------------------------------------
/// UseCase: AddFavourite
/// ------------------------------------------------------------
/// Accion: Agregar favorito
/// Params: imageId (String)
/// Retorna: int
/// Dependencias: repository
/// ------------------------------------------------------------
class AddFavourite {
  final CatRepository repository;

  AddFavourite(this.repository);

  Future<int> call(String imageId) async {
    return await repository.addFavourite(imageId);
  }
}
