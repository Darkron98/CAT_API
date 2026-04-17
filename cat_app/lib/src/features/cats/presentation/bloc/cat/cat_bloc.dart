import 'package:cat_app/src/core/utils/debounce.dart';
import 'package:cat_app/src/features/cats/domain/cases/cases.dart';
import 'package:cat_app/src/features/cats/domain/entities/entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final GetCats getCats;
  final GetBreeds getBreeds;
  final SearchBreeds searchBreed;
  final AddFavourite addFavourite;
  final RemoveFavourite removeFavourite;
  final GetFavourites getFavourites;
  final GetInitData getInitData;

  CatBloc(
    this.getCats,
    this.getBreeds,
    this.searchBreed,
    this.addFavourite,
    this.removeFavourite,
    this.getFavourites,
    this.getInitData,
  ) : super(CatInitial()) {
    on<LoadCats>((event, emit) async {
      emit(CatLoading());

      try {
        final cats = await getCats();
        emit(CatLoaded(cats: cats));
      } catch (e) {
        emit(CatError());
      }
    });

    on<LoadBreeds>((event, emit) async {
      emit(CatLoading());

      try {
        final data = await getBreeds();
        emit(BreedsLoaded(breeds: data));
      } catch (_) {
        emit(CatError());
      }
    });

    on<SearchBreedsEvent>(
      (event, emit) async {
        emit(CatLoading());

        late List<BreedWithImage> result;

        if (event.query.isNotEmpty) {
          result = await searchBreed(event.query);
        } else {
          result = await getBreeds();
        }

        emit(BreedsLoaded(breeds: result));
      },
      transformer: debounce(const Duration(milliseconds: 400)),
    );

    on<AddFavouriteEvent>((event, emit) async {
      if (state is! BreedsLoaded) return;

      final currentState = state as BreedsLoaded;

      try {
        final favId = await addFavourite(event.imageId);

        final newFav = Favourite(
          id: favId,
          imageId: event.imageId,
          imageUrl: '', // opcional
        );

        final updatedFavs = List<Favourite>.from(currentState.favourites)
          ..add(newFav);

        emit(currentState.copyWith(favourites: updatedFavs));
      } catch (_) {
        emit(CatError());
      }
    });

    on<RemoveFavouriteEvent>((event, emit) async {
      if (state is! BreedsLoaded) return;

      final currentState = state as BreedsLoaded;

      try {
        int resp = await removeFavourite(event.favouriteId);
        if (resp == 200) {
          final updatedFavs = currentState.favourites
              .where((f) => f.id.toString() != event.favouriteId)
              .toList();
          emit(currentState.copyWith(favourites: updatedFavs));
        }
      } catch (_) {
        emit(CatError());
      }
    });

    on<LoadInitialData>((event, emit) async {
      emit(CatLoading());

      try {
        final data = await getInitData();
        emit(BreedsLoaded(breeds: data.breeds, favourites: data.favourites));
      } catch (_) {
        emit(CatError());
      }
    });
  }
}
