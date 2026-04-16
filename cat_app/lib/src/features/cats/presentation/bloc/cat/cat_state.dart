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
  BreedsLoaded({
    this.breeds = const [],
  });
}

class CatError extends CatState {}
