import 'package:electrical_project/src/features/categories/presentation/categories_page.dart';
import 'package:electrical_project/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Electrical Proj.',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              context.pushNamed(AppRoute.aboutUs.name);
            },
          ),
        ],
      ),
      body: const CategoriesPage(),
    );
  }
}
