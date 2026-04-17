import 'package:cat_app/src/core/utils/style/colors.dart';
import 'package:cat_app/src/features/cats/presentation/bloc/cat/cat_bloc.dart';
import 'package:cat_app/src/features/cats/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatList extends StatelessWidget {
  const CatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomFormField(
                context,
                onChanged: (value) =>
                    context.read<CatBloc>().add(SearchBreedsEvent(value)),
                size: MediaQuery.of(context).size,
                label: 'Search',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            if (state is CatInitial) ...[
              const Expanded(
                child: Icon(
                  Icons.pets,
                  size: 100,
                  color: ColorPalette.textColor,
                ),
              )
            ],
            if (state is CatLoading) ...[
              const Expanded(child: PawgressIndicator()),
            ],
            if (state is CatError) ...[
              const Expanded(child: Text('Error loading cats')),
            ],
            if (state is BreedsLoaded) ...[
              Expanded(
                child: ListView.separated(
                  cacheExtent: 1000,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.breeds.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 15),
                  itemBuilder: (context, i) => CatCard(
                    data: state.breeds[i],
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
