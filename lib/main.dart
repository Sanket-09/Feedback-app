import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Center(
            child: Text(
              'The  Summer  Spring',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 25,
                letterSpacing: 2.5,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.red[300],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              'You\'ve reached the end of the feedback process. Thank you for your stay',
        ).show();
        quizBrain.reset();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  double currentSliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Slider(
            activeColor: Colors.black,
            value: currentSliderValue,
            min: 0,
            max: 100,
            divisions: 100,
            label: currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                currentSliderValue = value;
              });
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: FlatButton(
              color: Colors.red[900],
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                currentSliderValue = 50;
                checkAnswer(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
