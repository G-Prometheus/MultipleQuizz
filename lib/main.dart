import 'package:flutter/material.dart';
import 'package:quizzler/brain_quiz.dart';
import 'dart:async';

void main() => runApp(Quizzler());
BrainQuiz brain_quiz = BrainQuiz();

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int selectedButtonColors = -1;
  int x = 0;
  Color getButtonColor(int index) {
    if (selectedButtonColors == index) {
      return brain_quiz.checkAnswer(brain_quiz.getAnswert()[index])
          ? Colors.green
          : Colors.red;
    }
    return Colors.blue;
  }

  void updateUI(int number) {
    setState(() {
      selectedButtonColors = number;
    });

    // Đợi 200ms sau đó reset màu nút và chuyển sang câu hỏi tiếp theo
    Timer(Duration(milliseconds: 200), () {
      setState(() {
        selectedButtonColors = -1;
        x = brain_quiz.totalScore;
        brain_quiz.nextQuestion();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Score: $x',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain_quiz.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                onPressed: () {
                  updateUI(0);
                },
                style: TextButton.styleFrom(backgroundColor: getButtonColor(0)),
                child: Text(
                  brain_quiz.getAnswert()[0],
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                updateUI(1);
              },
              style: TextButton.styleFrom(backgroundColor: getButtonColor(1)),
              child: Text(
                brain_quiz.getAnswert()[1],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                updateUI(2);
              },
              style: TextButton.styleFrom(backgroundColor: getButtonColor(2)),
              child: Text(
                brain_quiz.getAnswert()[2],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
