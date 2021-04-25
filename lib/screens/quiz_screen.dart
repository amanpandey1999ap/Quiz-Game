import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/screens/difficulty_mode.dart';


class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuizState();
}

class QuizState extends State<Quiz> {
  var _buttonColor = Colors.white70;

  int _counter = 30;
  Timer _timer;

  void startTimer() {
    if (_timer != null) _timer.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          if (_counter == 0 && currentQuestion != quiz.questions.length - 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {

              return Summary(score: finalScore);
            }));
          }
        } else
          _timer.cancel();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
        backgroundColor: Color(0xffF1F5FB),
        appBar: AppBar(
          title: Text(
            "$_counter.0",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black26,
          leading: Icon(Icons.alarm),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Q ${questionNumber + 1} of ${quiz.questions.length}",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Score: $finalScore",
                      style: TextStyle(fontSize: 18)),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      color: Colors.deepPurpleAccent,
                      padding: EdgeInsets.all(5.0),
                      height: 250.0,
                      width: 350.0,
                      child: Center(
                        child: Text(
                          quiz.questions[questionNumber],
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ))),
            Container(
                padding: EdgeInsets.all(15.0),
                height: 80.0,
                width: 350.0,
                child: RaisedButton(
                    color: _buttonColor,
                    elevation: 15.0,
                    child: Text(quiz.choices[questionNumber][0]),
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        _buttonColor = Colors.lightGreenAccent;
                        finalScore++;
                      } else {
                        _buttonColor = Colors.redAccent;
                        debugPrint("Incorrect");
                      }

                      Timer(Duration(seconds: 2), () {
                        _buttonColor = Colors.white70;
                        updateQuestion();
                      });

                    })),
            Container(
                padding: EdgeInsets.all(15.0),
                height: 80.0,
                width: 350.0,
                child: RaisedButton(
                    elevation: 15.0,
                    child: Text(quiz.choices[questionNumber][1]),
                    onPressed: () {
                        if (quiz.choices[questionNumber][1] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          _buttonColor = Colors.lightGreenAccent;
                          finalScore++;
                        } else {
                          _buttonColor = Colors.redAccent;
                          debugPrint("Incorrect");
                        }

                        Timer(Duration(seconds: 2), () {
                          _buttonColor = Colors.white70;
                          updateQuestion();
                        });

                    })),
            Container(
                padding: EdgeInsets.all(15.0),
                height: 80.0,
                width: 350.0,
                child: RaisedButton(
                    elevation: 15.0,
                    child: Text(quiz.choices[questionNumber][2]),
                    onPressed: () {
                        if (quiz.choices[questionNumber][2] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          _buttonColor = Colors.lightGreenAccent;
                          finalScore++;
                        } else {
                          _buttonColor = Colors.redAccent;
                          debugPrint("Incorrect");
                        }

                        Timer(Duration(seconds: 2), () {
                          _buttonColor = Colors.white70;
                          updateQuestion();
                        });

                    })),
            Container(
                padding: EdgeInsets.all(15.0),
                height: 80.0,
                width: 350.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: RaisedButton(
                    elevation: 15.0,
                    child: Text(quiz.choices[questionNumber][3]),
                    onPressed: () {
                        if (quiz.choices[questionNumber][3] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          _buttonColor = Colors.lightGreenAccent;
                          finalScore++;
                        } else {
                          _buttonColor = Colors.redAccent;
                          debugPrint("Incorrect");
                        }

                        Timer(Duration(seconds: 2), () {
                          _buttonColor = Colors.white70;
                          updateQuestion();
                        });

                    })),
          ],
        )));
  }

  int currentQuestion = questionNumber;

  void updateQuestion() {


    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Summary(score: finalScore)));
      } else {
        questionNumber++;
      }
    });
  }
}

// ignore: must_be_immutable
class Summary extends StatelessWidget {
  final int score;

  Summary({Key key, @required this.score}) : super(key: key);

  String gk(){
    if(score == 1 || score == 0)
      return 'Poor';
    if(score == 2)
      return 'Bad';
    if(score == 2)
      return 'Good';
    if(score == 4)
      return 'Strong';
    if(score == 5)
      return 'Very Strong';
    else return 'Expected';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade200,
        body: Container(
          margin: EdgeInsets.only(top: 100.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30.0,right: 20.0, left: 20.0, bottom: 30.0),
                  child: Text('Your final Score is $score',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),),
                Padding(padding: EdgeInsets.only(top: 50.0,right: 20.0, left: 30.0, bottom: 30.0),
                  child: Text('Your General Knowledge is ${gk()}',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold)),),


                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  height: 80.0,
                  width: 100.0,
                  child: RaisedButton(
                    color: Colors.limeAccent.shade100,
                      child: Icon(Icons.home_outlined),
                      onPressed: (){
                        questionNumber = 0;
                        finalScore = 0;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DifficultyMode()));
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: Text("Home",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
