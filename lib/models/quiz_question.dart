class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); //copy exisitng list to a new one
    shuffledList.shuffle();
    return shuffledList;
  }
}
