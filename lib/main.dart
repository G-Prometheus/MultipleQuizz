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
  Color getButtonColor(int index) {
    if (selectedButtonColors == index) {
      return brain_quiz.checkAnswer(brain_quiz.getAnswert()[index]);
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
        brain_quiz.nextQuestion(context);
      });
    });
  }

  Expanded button(int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
            onPressed: () {
              updateUI(index);
            },
            style: TextButton.styleFrom(backgroundColor: getButtonColor(index)),
            child: Text(
              brain_quiz.getAnswert()[index],
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            )),
      ),
    );
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
              'Score: ${brain_quiz.totalScore}',
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
        button(0),
        button(1),
        button(2)
      ],
    );
  }
}
