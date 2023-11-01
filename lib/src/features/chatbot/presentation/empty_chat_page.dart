import 'package:flutter/material.dart';

class EmptyChatPage extends StatelessWidget {
  const EmptyChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          child: Image.asset(
            'assets/bot.png',
            fit: BoxFit.cover,
            frameBuilder: (ctx, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;

              return Stack(children: <Widget>[
                AnimatedOpacity(
                  opacity: frame == null ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: frame == null
                      ? Image.asset(
                          'assets/bot.png',
                        )
                      : null,
                ),
                AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    child: frame != null ? child : null),
              ]);
            },
          ),
        ),
        Text(
          'Ask Anything Regarding Electrical :)',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!,
        ),
      ],
    );
  }
}
