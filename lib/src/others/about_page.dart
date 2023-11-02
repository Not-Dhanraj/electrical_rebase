import 'package:electrical_project/src/constants/app_consts.dart';
import 'package:electrical_project/src/shared/about_tile.dart';
import 'package:electrical_project/src/shared/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          h4,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Developer',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: AboutTile(
                top: Radius.circular(25),
                bottom: Radius.circular(25),
                imgUrl:
                    'https://pbs.twimg.com/profile_images/1616528643957878784/q9uhNCWn_400x400.jpg',
                title: 'Dhanraj Priyadarshi',
                description:
                    'I am a student and I love programming and building things! :)',
                twitter: 'https://twitter.com/BerserkDhanraj',
                linkedin:
                    'https://in.linkedin.com/in/dhanraj-priyadarshi-7739a8286',
                github: 'https://github.com/Not-Dhanraj'),
          ),
          h4,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Group Members',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          h4,
          const AboutTile(
              top: Radius.circular(25),
              bottom: Radius.circular(5),
              imgUrl:
                  'https://pbs.twimg.com/profile_images/1616528643957878784/q9uhNCWn_400x400.jpg',
              title: 'Dhanraj Priyadarshi',
              description:
                  'I am a student and I love programming and building things! :)',
              twitter: 'https://twitter.com/BerserkDhanraj',
              linkedin:
                  'https://in.linkedin.com/in/dhanraj-priyadarshi-7739a8286',
              github: 'https://github.com/Not-Dhanraj'),
          const AboutTile(
              top: Radius.circular(5),
              bottom: Radius.circular(5),
              imgUrl:
                  'https://pbs.twimg.com/profile_images/1616528643957878784/q9uhNCWn_400x400.jpg',
              title: 'Dhanraj Priyadarshi',
              description:
                  'I am a student and I love programming and building things! :)',
              twitter: 'https://twitter.com/BerserkDhanraj',
              linkedin:
                  'https://in.linkedin.com/in/dhanraj-priyadarshi-7739a8286',
              github: 'https://github.com/Not-Dhanraj'),
          const AboutTile(
              top: Radius.circular(5),
              bottom: Radius.circular(25),
              imgUrl:
                  'https://pbs.twimg.com/profile_images/1616528643957878784/q9uhNCWn_400x400.jpg',
              title: 'Dhanraj Priyadarshi',
              description:
                  'I am a student and I love programming and building things! :)',
              twitter: 'https://twitter.com/BerserkDhanraj',
              linkedin:
                  'https://in.linkedin.com/in/dhanraj-priyadarshi-7739a8286',
              github: 'https://github.com/Not-Dhanraj'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              'Legal',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          BouncingWidget(
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: 'Electrical Project',
                applicationVersion: '1.0.22',
                applicationLegalese: '© 2023 Dhanraj Priyadarshi',
              );
            },
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              leading: const Icon(UniconsSolid.align_alt),
              tileColor: Theme.of(context).cardColor,
              title: const Text('Licenses'),
              subtitle: const Text('View Open Source Licenses'),
            ),
          ),
          h10,
          Text(
            'Made with ❤️ by G4 with Flutter!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
