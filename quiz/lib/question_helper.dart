import 'package:quiz/questions.dart';

class QuestionHelper {

  int _question_number = 0;

  final List<Questions> _questionBank = [
    Questions(questionDetail: 'Some cats are actually allergic to humans',
        questionAnswer: true),
    Questions(
        questionDetail: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Questions(
        questionDetail: 'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Questions(
        questionDetail: 'A slug\'s blood is green.', questionAnswer: true),
    Questions(
        questionDetail: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        questionAnswer: true),
    Questions(questionDetail: 'It is illegal to pee in the Ocean in Portugal.',
        questionAnswer: true),
    Questions(
        questionDetail: 'No piece of square dry paper can be folded in half more than 7 times.',
        questionAnswer: false),
    Questions(
        questionDetail: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a '
            'state funeral, because the building is considered too sacred a place.',
        questionAnswer: false),
    Questions(
        questionDetail: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        questionAnswer: true),
    Questions(
        questionDetail: 'The total surface area of two human lungs is approximately 70 square metres.',
        questionAnswer: true),
    Questions(questionDetail: 'oogle was originally called \"Backrub\".',
        questionAnswer: true),
    Questions(
        questionDetail: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        questionAnswer: false),
    Questions(
        questionDetail: 'n West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        questionAnswer: true),

  ];

  bool nextQuestion(){ // not to overflow at runtime
    if(_question_number<_questionBank.length -1){
      _question_number++;
      return true;
    }
      return false;

  }

  String getQuestionText() {
    return _questionBank[_question_number].questionDetail;
}

  bool getQuestionAnswer(){
    return _questionBank[_question_number].questionAnswer;
  }

}