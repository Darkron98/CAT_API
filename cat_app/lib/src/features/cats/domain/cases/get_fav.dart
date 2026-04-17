import 'package:cat_app/src/features/cats/data/cat_repo.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';

class GetFavourites {
  final CatRepository repository;

  GetFavourites(this.repository);

  Future<List<Favourite>> call() async {
    return await repository.getFavourites();
  }
}
