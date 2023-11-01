import 'package:cached_network_image/cached_network_image.dart';
import 'package:electrical_project/src/features/categories/data/card_data.dart';
import 'package:electrical_project/src/features/chatbot/data/chat_provider.dart';
import 'package:electrical_project/src/features/delta_star/data/delta_to_star_provider.dart';
import 'package:electrical_project/src/features/parallel/data/parallel_rest_data.dart';
import 'package:electrical_project/src/features/series/data/series_rest_data.dart';
import 'package:electrical_project/src/features/star_delta/data/star_to_delta_provider.dart';
import 'package:electrical_project/src/routing/app_router.dart';
import 'package:electrical_project/src/shared/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoryList extends ConsumerWidget {
  final int index;
  final Alignment alignment;
  const CategoryList({
    Key? key,
    required this.index,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 115),
      child: Hero(
        tag: cardsToDisplay.elementAt(index),
        child: Material(
          type: MaterialType.transparency,
          child: BouncingWidget(
            onTap: () {
              ref.invalidate(parallelRestDataProvider);
              ref.invalidate(seriesRestDataProvider);
              ref.invalidate(chatDataProvider);
              ref.invalidate(starToDeltaProvider);
              ref.invalidate(deltaToStarProvider);
              index == 0
                  ? context.pushNamed(AppRoute.parallel.name)
                  : index == 1
                      ? context.pushNamed(AppRoute.series.name)
                      : index == 2
                          ? context.pushNamed(AppRoute.chathelpbot.name)
                          : index == 3
                              ? context.pushNamed(AppRoute.deltaStar.name)
                              : context.pushNamed(AppRoute.starDelta.name);
            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: CachedNetworkImage(
                        memCacheHeight: 480,
                        imageUrl:
                            cardsToDisplay.elementAt(index).backdropAssetPath,
                        fit: BoxFit.cover,
                        alignment: alignment,
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.ac_unit);
                        },
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          transform: const GradientRotation(-90),
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: 0,
                    child: AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 17, bottom: 18, top: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                cardsToDisplay.elementAt(index).address,
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                              const Divider(),
                              Text(
                                cardsToDisplay.elementAt(index).description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 13.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
