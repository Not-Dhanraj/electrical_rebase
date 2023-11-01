import 'package:electrical_project/src/constants/app_consts.dart';
import 'package:electrical_project/src/features/categories/presentation/category_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                // left: 20.0,
              ),
              child: Text(
                'Categories',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    // fontSize: 29,
                    // fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(),
        ),
        h4,
        SizedBox(
          height: MediaQuery.of(context).size.height - 110,
          child: const CategoryPageview(),
        )
      ],
    );
  }
}
