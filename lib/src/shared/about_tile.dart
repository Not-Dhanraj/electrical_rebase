import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;
  final String twitter;
  final Radius top;
  final Radius bottom;
  final String linkedin;
  final String github;
  const AboutTile({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.twitter,
    required this.linkedin,
    required this.github,
    required this.top,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: top, bottom: bottom)),
        leading: SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(imageUrl: imgUrl),
          ),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      _launchUrl(Uri.parse(twitter));
                    },
                    icon: const Icon(UniconsLine.twitter)),
                IconButton(
                    onPressed: () {
                      _launchUrl(Uri.parse(linkedin));
                    },
                    icon: const Icon(UniconsLine.linkedin)),
                IconButton(
                    onPressed: () {
                      _launchUrl(Uri.parse(github));
                    },
                    icon: const Icon(UniconsLine.github)),
              ],
            )
          ],
        ),
        tileColor: Theme.of(context).cardColor,
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
