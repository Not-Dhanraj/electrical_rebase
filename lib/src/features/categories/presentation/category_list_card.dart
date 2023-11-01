import 'package:cached_network_image/cached_network_image.dart';
import 'package:electrical_project/src/shared/bouncing_widget.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final String heroTag;
  final String name;
  final String descriptions;
  final String thumb;
  final Alignment alignment;

  const CategoryList({
    Key? key,
    required this.alignment,
    required this.heroTag,
    required this.name,
    required this.thumb,
    required this.descriptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 115),
      child: Hero(
        tag: heroTag,
        child: Material(
          type: MaterialType.transparency,
          child: BouncingWidget(
            onTap: () {
              //TODO
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
                        imageUrl: thumb,
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
                            Colors.black.withOpacity(0.3),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
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
                              left: 30, right: 17, bottom: 20, top: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              Text(
                                descriptions,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                ),
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
