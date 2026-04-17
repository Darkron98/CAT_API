part of 'cat_bloc.dart';

abstract class CatState {}

/// Estado: inicial
class CatInitial extends CatState {}

/// Estado: espera/carga
class CatLoading extends CatState {}

/// Estado: imagenes cargadas
class CatLoaded extends CatState {
  final List<Cat> cats;
  CatLoaded({
    this.cats = const [],
  });
}

/// Estado: razas cargadas (principal)
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

/// Estado: Error
class CatError extends CatState {}
