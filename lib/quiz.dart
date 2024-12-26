import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
} 
 
class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  //Executed by Flutter when the StatefulWidget's State object is initialized
  void initState() {
    //called after the object was created
    //add all initialization methods, will never excute thereafter again
    super.initState();
    activeScreen = StartScreen(switchScreen); //
  }

  void switchScreen() {
    setState(() { //takes function as a value
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 54, 20, 68),
                Color.fromARGB(255, 94, 33, 119),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
