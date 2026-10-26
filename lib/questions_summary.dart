import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        final isCorrectAnswer = data['correct_answer'] == data['user_answer'];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isCorrectAnswer ? Colors.green : Colors.red,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(6),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data['user_answer'] as String,
                      style: TextStyle(
                        color: isCorrectAnswer ? Colors.green : Colors.red,
                      ),
                    ),
                    if (!isCorrectAnswer)
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(color: Colors.white70),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
