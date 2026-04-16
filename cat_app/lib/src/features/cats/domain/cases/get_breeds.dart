import 'package:cat_app/src/features/cats/data/cat_repo.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

class GetBreeds {
  final CatRepository repository;

  GetBreeds(this.repository);

  Future<List<BreedWithImage>> call() async {
    return await repository.getBreedsWithImages();
  }
}
