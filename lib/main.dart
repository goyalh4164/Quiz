import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreKeeper = [];
  int cq = 10;

  int cs = 0;
  // List<String> questions = [];
  // List<bool> answers = [false, false, true, false];
  //This is how you can create questiona and answer club together
  // Question q1 = Question(
  //     q: 'The Big Apple is a nickname given to Washington D.C in 1971.',
  //    a: false);
  // Question q2 = Question(
  //     q: 'Muddy York is a nickname for New York in the Winter.', a: false);
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      cs;
      cq--;
      quizBrain.nextQuestion();
    });

    if (correctAnswer == userPickedAnswer) {
      cs++;
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Text("Quiz"),
            ),
          ),
          body: Container(
            color: Colors.black87,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Questions Left: " + "${cq}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Current Score: " + "${cs}/10",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          quizBrain.getQuestionText(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: MaterialButton(
                      onPressed: () {
                        checkAnswer(true);
                      },
                      color: Colors.green,
                      height: 70,
                      child: Center(
                        child: Text(
                          "True",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: MaterialButton(
                      onPressed: () {
                        checkAnswer(false);
                      },
                      color: Colors.red,
                      height: 70,
                      child: Center(
                        child: Text(
                          "False",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: scoreKeeper,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
