import 'package:cat_app/src/features/cats/data/cat_repo.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

class GetInitData {
  final CatRepository repository;

  GetInitData(this.repository);

  Future<BreedsData> call() async {
    return await repository.getInitialData();
  }
}
