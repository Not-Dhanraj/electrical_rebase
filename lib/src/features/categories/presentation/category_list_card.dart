import 'package:cached_network_image/cached_network_image.dart';
import 'package:electrical_project/src/features/categories/data/card_data.dart';
import 'package:electrical_project/src/features/chatbot/data/word_lists.dart';
import 'package:electrical_project/src/features/chatbot/presentation/chat_page.dart';
import 'package:electrical_project/src/shared/bouncing_widget.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final int index;
  final Alignment alignment;

  const CategoryList({
    Key? key,
    required this.alignment,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 115),
      child: Hero(
        tag: cardsToDisplay.elementAt(index),
        child: Material(
          type: MaterialType.transparency,
          child: BouncingWidget(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (cxt) {
                return ChatScreen(
                  title: electricalKeywords.elementAt(index),
                );
              }));

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
                            Colors.black.withOpacity(0.3),
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
