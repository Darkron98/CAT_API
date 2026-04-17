import 'package:cat_app/src/features/cats/data/cat_repo.dart';

class RemoveFavourite {
  final CatRepository repository;

  RemoveFavourite(this.repository);

  Future<int> call(String favouriteId) async {
    return await repository.removeFavourite(favouriteId);
  }
}
