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
          Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 4.5 / 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned.fill(
                            child: AnimatedOpacity(
                              duration: Duration.zero,
                              opacity: 0.5,
                              child: Container(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child:
                                          Image.asset('assets/icon/icon.png'))),
                              const Flexible(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "ZapApp",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                    child: Text(
                        'Welcome to my Electrical Project!! \nThis is cross-platform application built using Flutter and Dart!'),
                  ),
                ],
              ),
            ),
          ),
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 5),
          //   child: Text(
          //     'Group Members',
          //     style: Theme.of(context).textTheme.titleLarge,
          //   ),
          // ),
          // h4,
          // const AboutTile(
          //     top: Radius.circular(25),
          //     bottom: Radius.circular(5),
          //     imgUrl:
          //         'https://pbs.twimg.com/profile_images/1616528643957878784/q9uhNCWn_400x400.jpg',
          //     title: 'Dhanraj Priyadarshi',
          //     description:
          //         'I am a student and I love programming and building things! :)',
          //     twitter: 'https://twitter.com/BerserkDhanraj',
          //     linkedin:
          //         'https://in.linkedin.com/in/dhanraj-priyadarshi-7739a8286',
          //     github: 'https://github.com/Not-Dhanraj'),
          // const AboutTile(
          //     top: Radius.circular(5),
          //     bottom: Radius.circular(5),
          //     imgUrl:
          //         'https://pbs.twimg.com/profile_images/1616528643957878784/q9uhNCWn_400x400.jpg',
          //     title: 'Dhanraj Priyadarshi',
          //     description:
          //         'I am a student and I love programming and building things! :)',
          //     twitter: 'https://twitter.com/BerserkDhanraj',
          //     linkedin:
          //         'https://in.linkedin.com/in/dhanraj-priyadarshi-7739a8286',
          //     github: 'https://github.com/Not-Dhanraj'),
          // const AboutTile(
          //     top: Radius.circular(5),
          //     bottom: Radius.circular(25),
          //     imgUrl:
          //         'https://pbs.twimg.com/profile_images/1616528643957878784/q9uhNCWn_400x400.jpg',
          //     title: 'Dhanraj Priyadarshi',
          //     description:
          //         'I am a student and I love programming and building things! :)',
          //     twitter: 'https://twitter.com/BerserkDhanraj',
          //     linkedin:
          //         'https://in.linkedin.com/in/dhanraj-priyadarshi-7739a8286',
          //     github: 'https://github.com/Not-Dhanraj'),
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
                applicationIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: MediaQuery.of(context).size.width * 0.18,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset('assets/icon/icon.png')),
                ),
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
            'Made with ❤️ by Dhanraj with Flutter!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
