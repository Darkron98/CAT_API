import 'package:cat_app/src/features/cats/data/cat_repo.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

/// ------------------------------------------------------------
/// UseCase: GetBreeds
/// ------------------------------------------------------------
/// Accion: Obtiene lista de razas
/// Retorna: List<BreedWithImage>
/// Dependencias: repository
/// ------------------------------------------------------------
class GetBreeds {
  final CatRepository repository;

  GetBreeds(this.repository);

  Future<List<BreedWithImage>> call() async {
    return await repository.getBreedsWithImages();
  }
}
