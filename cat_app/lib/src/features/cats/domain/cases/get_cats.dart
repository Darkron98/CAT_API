import '../../data/cat_repo.dart';
import '../entities/cat.dart';

class GetCats {
  final CatRepository repository;

  GetCats(this.repository);

  Future<List<Cat>> call() async {
    return await repository.getCats();
  }
}
