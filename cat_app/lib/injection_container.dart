import 'package:cat_app/src/features/cats/domain/cases/get_breeds.dart';
import 'package:cat_app/src/features/cats/domain/cases/search_breed.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'src/core/network/api_client.dart';
import 'src/features/cats/data/cat_api.dart';
import 'src/features/cats/data/cat_repo.dart';
import 'src/features/cats/domain/cases/get_cats.dart';
import 'src/features/cats/presentation/bloc/cat/cat_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => Dio());
  // Core
  sl.registerLazySingleton(() => ApiClient(sl()));
  // Data
  sl.registerLazySingleton(() => CatApi(sl()));
  sl.registerLazySingleton(() => CatRepository(sl()));
  // Domain
  sl.registerLazySingleton(() => GetCats(sl()));
  sl.registerLazySingleton(() => GetBreeds(sl()));
  sl.registerLazySingleton(() => SearchBreeds(sl()));
  // Bloc
  sl.registerFactory(() => CatBloc(sl(), sl(), sl()));
}
