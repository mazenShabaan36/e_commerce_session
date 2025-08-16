import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session/presentation/features/home/controller/categories_cubit.dart';
import 'package:session/presentation/features/home/controller/categories_state.dart';

import 'package:session/presentation/features/home/widgets/category_card.dart';

import 'category_list_loading.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return SizedBox(height: 32, child: CategoryListLoading());
          } else if (state is CategoriesLoaded) {
            return SizedBox(
              height: 32,
              child: ListView.builder(
                itemCount: state.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    //
                    child: GestureDetector(
                      onTap: () {},
                      //
                      child: CategoryCard(categories: state.categories, index: index, isSelected: false),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
