import 'package:cat_app/src/features/cats/presentation/bloc/cat/cat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';
import 'features/cats/presentation/pages/pages.dart';

class CatApp extends StatelessWidget {
  const CatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAWdex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => sl<CatBloc>()..add(LoadBreeds()),
        child: const Home(),
      ),
    );
  }
}
