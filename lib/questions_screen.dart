import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "What is your name?",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "Sara",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "Yasser",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "Niva",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
