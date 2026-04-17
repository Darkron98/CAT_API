import 'package:cat_app/src/features/cats/data/cat_repo.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

/// ------------------------------------------------------------
/// UseCase: GetFavourites
/// ------------------------------------------------------------
/// Accion: Obtener lista de favoritos
/// Retorna: List<Favourite>
/// Dependencias: repository
/// ------------------------------------------------------------
class GetFavourites {
  final CatRepository repository;

  GetFavourites(this.repository);

  Future<List<Favourite>> call() async {
    return await repository.getFavourites();
  }
}
