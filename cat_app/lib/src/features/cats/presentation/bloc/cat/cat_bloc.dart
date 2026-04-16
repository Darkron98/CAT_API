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

  CatBloc(this.getCats, this.getBreeds, this.searchBreed)
      : super(CatInitial()) {
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
  }
}
