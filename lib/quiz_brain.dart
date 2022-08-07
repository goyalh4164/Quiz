import 'question.dart';

class QuizBrain {
  int questionNumber = 0;
  List<Question> _questionBank = [
    // Add the Question to the list of questions

    // skipping one step and just creating the quiz item inside the append function

    Question(
        q: "Approximately one quarter of human bones are in the feet.",
        a: true),

    Question(
        q: "The total surface area of two human lungs is approximately 70 square metres.",
        a: true),

    Question(
        q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
        a: true),

    Question(
        q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral.",
        a: false),

    Question(q: "It is illegal to pee in the Ocean in Portugal.", a: true),

    Question(q: "You can lead a cow down stairs but not up stairs.", a: false),

    Question(q: "Google was originally called \"Backrub\".", a: true),

    Question(q: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", a: true),

    Question(
        q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
        a: false),

    Question(
        q: "No piece of square dry paper can be folded in half more than 7 times.",
        a: false),

    Question(
        q: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.",
        a: true),
  ];
  //Here we have done Encapsulation so that other classes can not change it and providing a secure method
  void nextQuestion() {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[questionNumber].questionAnswer;
  }
}
