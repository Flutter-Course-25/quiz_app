import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/start_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int i = 0;
  final numberOfQuestions = questions.length;
  var currentQuestion = questions[0];

  void displayQuestions() {
    setState(() {
      i < numberOfQuestions ? currentQuestion = questions[++i] : const Quiz();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //map -> convert vlaues in a list(strings) to other values (widgets), { a completely new list, doesn't affect the current list}
            //this function is executed for all the answers automatically, and added as individual comma-separated answer buttons to this list here, which is set as a value for children.
            ...currentQuestion.answers.map((answer) {
              //answer -> string
              //spreading Values(...) -> take all the values in a list or an iterable and pull them out of the list,
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  displayQuestions();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
