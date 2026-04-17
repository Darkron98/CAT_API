import 'package:cat_app/src/features/cats/data/cat_repo.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

/// ------------------------------------------------------------
/// UseCase: GetInitData
/// ------------------------------------------------------------
/// Accion: Obtener listas de razas y favoritos iniciales
/// Retorna: BreedsData
/// Dependencias: repository
/// ------------------------------------------------------------
class GetInitData {
  final CatRepository repository;

  GetInitData(this.repository);

  Future<BreedsData> call() async {
    return await repository.getInitialData();
  }
}
