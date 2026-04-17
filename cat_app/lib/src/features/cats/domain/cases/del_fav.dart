import 'package:cat_app/src/features/cats/data/cat_repo.dart';

/// ------------------------------------------------------------
/// UseCase: RemoveFavourite
/// ------------------------------------------------------------
/// Accion: Borrar favorito
/// Params: favouriteId (String)
/// Retorna: int
/// Dependencias: repository
/// ------------------------------------------------------------
class RemoveFavourite {
  final CatRepository repository;

  RemoveFavourite(this.repository);

  Future<int> call(String favouriteId) async {
    return await repository.removeFavourite(favouriteId);
  }
}
