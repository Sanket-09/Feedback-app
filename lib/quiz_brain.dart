import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('How much did you liked the room service ?'),
    Question('How did you rate the hotel in terms of sanitization?'),
    Question('On a scale how much will you recommend this place to your friends?.'),
    Question('How was the internet connectivity?'),
    Question('How appreciable was the dining service?'),
    Question('Was there 24/7 availability of water ? '),
    Question('How was your experience in the common swimming pool area ?'),
    Question('On a scale how much did you enjoyed your stay at the Hotel ?'),


  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {


      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
