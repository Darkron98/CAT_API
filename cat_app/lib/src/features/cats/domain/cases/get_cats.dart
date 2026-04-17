import '../../data/cat_repo.dart';
import '../entities/cat.dart';

/// ------------------------------------------------------------
/// UseCase: GetCats
/// ------------------------------------------------------------
/// Accion: Obtiene lista de imagenes de gatos
/// Retorna: List<Cat>
/// Dependencias: repository
/// ------------------------------------------------------------
class GetCats {
  final CatRepository repository;

  GetCats(this.repository);

  Future<List<Cat>> call() async {
    return await repository.getCats();
  }
}
