import 'question.dart';


class BrainQuiz {
  int _questionNumber =0;
  List<Question> _questionBank = [
    Question('Kigali ifite uturere dutatu (3)', true),
    Question('Kibungo ni akarere k\' i iburengerazuba.', false),
    Question('Ngororero ni akarere k\' amajyepfo.', true),
    Question('Nyagatare niko karere kanini mu Rwanda', true),
    Question('Gicumbi ni akarere k\' amajyaruguru".', true),
    Question('Karongi iri mu abajyarugu.', true),
    Question('Gisagara ni akarere k\' amajyarugu',false),
    Question('Gasabo ni akarere ka Kigali',true),
    Question('amajyepfo afite uturere 7',false),
    Question('Karongi ni akarere ka Amajyarugu',false),
    Question('Ngoma ni akarere k\' i burasirazuna".', true),
    Question('Rusizi iri uburengerazuba',true),
    Question('Intara\' amajyaruguru ifite uturere 6',true),

    Question('i darapu ry\'u Rwanda rifite amabara 3',true),
    Question('Twabonye ubwigenge muri 1960',false),
    Question('Ikiyaga cya Kivu s\'icyu\'u Rwanda gusa',true),
    Question('Nitwa Sababu',true),

  ];

  String getQuestionText(){
    
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswerBool (){
    return _questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestion(){
    if (_questionNumber < _questionBank.length -1){
        _questionNumber ++;
    }
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
