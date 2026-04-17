import 'package:cat_app/src/features/cats/data/cat_repo.dart';

class AddFavourite {
  final CatRepository repository;

  AddFavourite(this.repository);

  Future<int> call(String imageId) async {
    return await repository.addFavourite(imageId);
  }
}
