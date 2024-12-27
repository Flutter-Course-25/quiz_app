import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  final numberOfQuestions = questions.length;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer) ;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //use as much as as you need
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment:
              MainAxisAlignment.center, // controls vertical column
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //map -> convert vlaues in a list(strings) to other values (widgets), { a completely new list, doesn't affect the current list}
            //this function is executed for all the answers automatically, and added as individual comma-separated answer buttons to this list here, which is set as a value for children.
            //shuffle() -> changes the original list
            ...currentQuestion.getShuffledAnswers().map((answer) {
              //answer -> string
              //spreading Values(...) -> take all the values in a list or an iterable and pull them out of the list,
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  print(answer);
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
