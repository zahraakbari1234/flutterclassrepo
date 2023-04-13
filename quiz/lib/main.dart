import 'package:flutter/material.dart';
import 'package:quiz/question_helper.dart';


void main() {
  runApp(const Quiz());
}

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SafeArea(
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Widget> scoreKeeper = [];
  bool permitCheckAnswer = true ;//not to overflow check and cancel icons
  QuestionHelper helper = QuestionHelper();//create obj

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = helper.getQuestionAnswer();
    setState(() {
      if(permitCheckAnswer == true ){
        if (correctAnswer == userPickedAnswer) {
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
        }
        else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red,));
        }
      }
       permitCheckAnswer = helper.nextQuestion();
    });
  }

    @override
    Widget build(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  helper.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    checkAnswer(true);
                  });
                },
                child: const Text(
                  'True',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    checkAnswer(false);
                  });
                },
                child: const Text(
                  'False',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      );
    }
  }

