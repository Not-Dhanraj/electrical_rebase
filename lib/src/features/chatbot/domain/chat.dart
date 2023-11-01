class Chat {
  final String question;
  final String answer;
  final bool isFetching;
  final bool shouldWarn;

  Chat({
    required this.question,
    required this.answer,
    required this.isFetching,
    required this.shouldWarn,
  });
}
