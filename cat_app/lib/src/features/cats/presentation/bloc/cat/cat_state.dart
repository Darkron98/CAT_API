part of 'cat_bloc.dart';

abstract class CatState {}

class CatInitial extends CatState {}

class CatLoading extends CatState {}

class CatLoaded extends CatState {
  final List<Cat> cats;
  CatLoaded({
    this.cats = const [],
  });
}

class BreedsLoaded extends CatState {
  final List<BreedWithImage> breeds;
  final List<Favourite> favourites;

  BreedsLoaded({
    this.breeds = const [],
    this.favourites = const [],
  });

  BreedsLoaded copyWith({
    List<BreedWithImage>? breeds,
    List<Favourite>? favourites,
  }) {
    return BreedsLoaded(
      breeds: breeds ?? this.breeds,
      favourites: favourites ?? this.favourites,
    );
  }
}

class CatError extends CatState {}
