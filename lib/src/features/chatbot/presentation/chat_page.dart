import 'package:electrical_project/src/constants/app_consts.dart';
import 'package:electrical_project/src/features/chatbot/data/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String title;
  const ChatScreen({
    required this.title,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  TextEditingController questionController = TextEditingController();

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    var chatData = ref.watch(chatDataProvider);
    var chatDataModify = ref.watch(chatDataProvider.notifier);
    Color answerBackground = chatData.shouldWarn
        ? Colors.redAccent[400]!.withOpacity(0.5)
        : Colors.deepPurpleAccent[400]!.withOpacity(0.4);
    Color questionBackground = chatData.shouldWarn
        ? Colors.deepPurpleAccent[400]!.withOpacity(0.4)
        : Colors.blueGrey.withOpacity(0.5);
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          flightShuttleBuilder: _flightShuttleBuilder,
          tag: widget.title,
          child: Text(widget.title),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: chatData.question.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: questionBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: (chatData.question.isNotEmpty)
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child:
                                                Image.asset('assets/user.png')),
                                      ),
                                      Expanded(
                                        child: Markdown(
                                          data: chatData.question,
                                          shrinkWrap: true,
                                          selectable: true,
                                          styleSheet: MarkdownStyleSheet
                                                  .fromTheme(Theme.of(context))
                                              .copyWith(textScaleFactor: 1.3),
                                          physics: const ScrollPhysics(),
                                        ),
                                      ),
                                    ],
                                  )
                                : null,
                          ),
                          const SizedBox(height: 16),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: (chatData.isFetching)
                                ? const CircularProgressIndicator()
                                : null,
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: chatData.answer.isNotEmpty
                                ? Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: answerBackground,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          child: SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: Image.asset(
                                                  'assets/bot.png')),
                                        ),
                                        Expanded(
                                          child: Markdown(
                                            data: chatData.answer,
                                            shrinkWrap: true,
                                            selectable: true,
                                            styleSheet:
                                                MarkdownStyleSheet.fromTheme(
                                                        Theme.of(context))
                                                    .copyWith(
                                                        textScaleFactor: 1.1),
                                            physics: const ScrollPhysics(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(
                            height: 95,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 400,
                          child: Image.asset(
                            'assets/bot.png',
                            fit: BoxFit.cover,
                            frameBuilder:
                                (ctx, child, frame, wasSynchronouslyLoaded) {
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
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 23,
                vertical: 10,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                // color: Colors.red,
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 107,
                    child: TextField(
                      maxLines: 3,
                      minLines: 1,
                      textAlignVertical:
                          TextAlignVertical.center, // Align vertically
                      controller: questionController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(14),
                        hintText: "Ask your question...",
                      ),
                    ),
                  ),
                  w4,
                  IconButton(
                      onPressed: () {
                        chatDataModify.askQuestion(questionController.text);
                        questionController.text = '';
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
