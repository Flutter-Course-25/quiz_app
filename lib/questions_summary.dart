import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          child: Column(
            children: summaryData.map((data) {
              return Row(
                children: [
                  //access map by key, convert to string
                  Text(((data['question_index'] as int) + 1).toString()),
                  Expanded(
                    //the widget that is passed as a child to expanded, can't take more than the width of that row.
                    child: Column(
                      children: [
                        Text(data['question'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'] as String),
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
