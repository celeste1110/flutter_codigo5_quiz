import 'package:flutter/material.dart';
import 'package:flutter_codigo5_quiz/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List<String> questions = [
  //   "El hombre llegó a la luna?",
  //   "La tierra es plana?",
  //   "Desayunaron?",
  // ];
  //
  // List<bool> answers = [
  //   true,
  //   false,
  //   false,
  // ];

  QuizBrain matasquita=QuizBrain();


  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer){

    if(matasquita.isFinished()){
      Alert(
        context: context,
        type: AlertType.success,
        title: "FIN DEL QUIZ",
        desc: "El juego terminó.",
        buttons: [
          DialogButton(
            child: Text(
              "REINICIAR",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {

              Navigator.pop(context);


            },
            width: 120,
          )
        ],
      ).show();
      matasquita.restart();
      scoreKeeper.clear();
      setState(() {});

    }else{
      bool correctAnswer = matasquita.getQuestionAnswer();
      if (correctAnswer == userAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Color(0xff00E1B7),
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Color(0xfff84073),
          ),
        );
      }

      matasquita.nextQuestion();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff272C2F),
      appBar: AppBar(
        backgroundColor: Color(0xff272C2F),
        title: Text("QuizApp"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                matasquita.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: const Color(0xff00E1B7),
                child: const Text("Verdadero"),
                onPressed: () {
                checkAnswer(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: const Color(0xfff84073),
                child: const Text("False"),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
