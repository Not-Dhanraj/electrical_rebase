import 'package:electrical_project/src/features/categories/application/category_pageview_service.dart';
import 'package:electrical_project/src/features/categories/presentation/category_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPageview extends ConsumerStatefulWidget {
  const CategoryPageview({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryPageviewState();
}

class _CategoryPageviewState extends ConsumerState<CategoryPageview> {
  late PageController pageController;
  double viewportFraction = 0.82;
  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 2, viewportFraction: viewportFraction)
          ..addListener(() {
            var pageOffset = ref.read(pageOffsetProvider.notifier);
            pageOffset.changePageOffset(pageController.page);
          });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var pageOffset = ref.watch(pageOffsetProvider);

        if (index == pageOffset!.floor() + 1 ||
            index == pageOffset.floor() + 2) {
          /// Right
          return Transform.translate(
            offset: Offset(0.0, 100 * (index - pageOffset)),
            child: CategoryList(
              index: index,
              alignment: Alignment((pageOffset - index).abs() * 0.5, 0),
            ),
          );
        } else if (index == pageOffset.floor() ||
            index == pageOffset.floor() - 1) {
          /// Left
          return Transform.translate(
            offset: Offset(0.0, 100 * (pageOffset - index)),
            child: CategoryList(
              index: index,
              alignment: Alignment((pageOffset - index).abs() * 0.5, 0),
            ),
          );
        } else {
          /// Middle
          return CategoryList(
            index: index,
            alignment: Alignment((pageOffset - index).abs() * 0.5, 0),
          );
        }
      },
    );
  }
}
