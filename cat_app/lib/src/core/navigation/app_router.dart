import 'package:cat_app/injection_container.dart';
import 'package:cat_app/src/core/navigation/app_routes.dart';
import 'package:cat_app/src/features/cats/presentation/pages/home.dart';
import 'package:cat_app/src/features/cats/presentation/pages/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cats/presentation/bloc/cat/cat_bloc.dart';

Map<String, WidgetBuilder> appRouter() => <String, WidgetBuilder>{
      AppRoutes.title: (context) => const TitleView(),
      AppRoutes.home: (context) => BlocProvider(
            create: (context) => sl<CatBloc>()..add(LoadInitialData()),
            child: const Home(),
          ),
    };
