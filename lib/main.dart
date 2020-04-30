import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'brainQ.dart';


BrainQuiz newQ = BrainQuiz();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
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

  int green= 0 ;
  int red = 0;
  void checkAnswer(bool buru){
     bool correctAnswer = newQ.getAnswerBool();
     setState(() {

                if(newQ.isFinished()){
                  Alert(context: context, title: "IBISUBIZO", desc: "wakoze:$green, \n Wishe: $red").show();
                  newQ.reset();
                  scoreKeeper = [];
                  green= 0;
                  red = 0;
                }else {
                if (correctAnswer == buru){
                  scoreKeeper.add(Icon(Icons.star_border, color:Colors.green));
                  green +=1;
                }
                else{
                  scoreKeeper.add(Icon(Icons.close, color:Colors.red));
                  red +=1;
                }
                }
                  newQ.nextQuestion();
                });
  }
  
  List <Icon> scoreKeeper = [];
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            
            padding: EdgeInsets.all(35.0),
            child: Text(
              "Subiza ibi bibazo na YEGO cg OYA",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Papyrus',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex:3,
          child: Padding(
            padding: EdgeInsets.all(7.0),
            child: Center(
              child: Text(
                newQ.getQuestionText(),
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
            padding: EdgeInsets.all(5.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.yellowAccent,
              child: Text(
                'YEGO',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'OYA',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
               checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

