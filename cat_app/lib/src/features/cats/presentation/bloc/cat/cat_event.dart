part of 'cat_bloc.dart';

abstract class CatEvent {}

class LoadCats extends CatEvent {}

class LoadBreeds extends CatEvent {}

class SearchBreedsEvent extends CatEvent {
  final String query;

  SearchBreedsEvent(this.query);
}
