part of 'cat_bloc.dart';

abstract class CatEvent {}

class LoadCats extends CatEvent {}

class LoadBreeds extends CatEvent {}

class SearchBreedsEvent extends CatEvent {
  final String query;

  SearchBreedsEvent(this.query);
}

class AddFavouriteEvent extends CatEvent {
  final String imageId;

  AddFavouriteEvent(this.imageId);
}

class RemoveFavouriteEvent extends CatEvent {
  final String favouriteId;

  RemoveFavouriteEvent(this.favouriteId);
}

class LoadInitialData extends CatEvent {}
