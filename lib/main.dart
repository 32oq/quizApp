import 'package:flutter/material.dart';
import 'quizBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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
  @override

  List<Icon> scoreKeeper=[];

QuestionBank quiz=QuestionBank();

void stateCheck( bool answer){
  setState(() {
if(answer==true){
    scoreKeeper.add(
      Icon(
          Icons.check,
          color:Colors.green)
    );
}
else{
  scoreKeeper.add(
      Icon(
          Icons.close,
          color:Colors.red));
}
    quiz.updateQuestion();
    if(quiz.finished()==true){
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
      ).show();
      quiz.reset();
      scoreKeeper=[];
    }

  });



  //The user picked false.

}


  int i=0;
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
                quiz.getQuestion(),
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
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctanswer=quiz.getAnswer();
                stateCheck(correctanswer);
                // if(correctanswer==true){
                //
                // }
                //
                // setState(() {
                //   scoreKeeper.add(
                //     Icon(
                //         Icons.check,
                //         color:Colors.green),
                //   );
                //   quiz.updateQuestion();
                //   });

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctanswer=quiz.getAnswer();
                stateCheck(correctanswer);

                // setState(() {
                //
                //   scoreKeeper.add(
                //     Icon(
                //         Icons.close,
                //         color:Colors.red),
                //   );
                //   quiz.updateQuestion();
                //   if(quiz.finished()==true){
                //     Alert(
                //       context: context,
                //       title: 'Finished!',
                //       desc: 'You\'ve reached the end of the quiz.',
                //     ).show();
                //     quiz.reset();
                //     scoreKeeper=[];
                //   }
                //
                //   });



                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
