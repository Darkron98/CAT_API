import 'package:cat_app/src/features/cats/data/cat_repo.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

class SearchBreeds {
  final CatRepository repository;

  SearchBreeds(this.repository);

  Future<List<BreedWithImage>> call(String query) async {
    return await repository.searchBreeds(query);
  }
}
