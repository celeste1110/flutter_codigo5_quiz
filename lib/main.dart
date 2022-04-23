import 'package:flutter/material.dart';

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
  List<String> questions = [
    "El hombre llegó a la luna?",
    "La tierra es plana?",
    "Desayunaron?",
  ];

  List<bool> answers = [
    true,
    false,
    false,
  ];

  int questionNumber = 0;

  List<Icon> scoreKeeper = [];

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
                questions[questionNumber],
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
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == true) {
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
                  questionNumber++;
                  setState(() {});
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
                  bool correctAnswer = answers[questionNumber];
                  if (correctAnswer == false) {
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
                  questionNumber++;
                  setState(() {});
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
