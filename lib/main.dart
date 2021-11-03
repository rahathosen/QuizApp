import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  int questionIndex = 0;
  int totalScore = 0;
  var questions = [
    {
      'question': 'What\'s Dart? \';}',
      'answers': [
        {
          'text': 'It\'s is an application Programming Language it used to build server and mobile application.',
          'score': 0
        },
        {
          'text': 'It\'s an open Source application.',
          'score': 0
        },
        {
          'text': 'Async function are normal functions with some sugar on top.The function variable tyupe just needs to specify that it returns a future.',
          'score': 1
        }
      ]
    },
    {
      'question': 'What\'s the idea behind an "enum"?',
      'answers': [
        {
          'text': 'An enum is a value where you can choose from multiple possible choices. You choose by selecting a human-readable label, behind the scenes, the labels are mapped to integers (0, 1, ... ).',
          'score': 1
        },
        {
          'text': 'An enum is basically a number that has a human readable label.',
          'score': 0
        },
        {
          'text': 'An enum is a value where you can choose from multiple possible choices. You choose by selecting a human-readable label, this label is then used as a string value in your code.',
          'score': 0
        }
      ]
    },
    {
      'question': 'What can EdgeInsets.all(..) be used for?',
      'answers': [
        {
          'text': 'Create an object with a special configuration / special default property values.',
          'score': 1
        },
        {
          'text': 'Create a function with a special configuration / special argument values.',
          'score': 0
        }
      ]
    },
    {
      'question': 'What\'s the difference between a List([]) and a Map ({}) in Dart / Flutter?',
      'answers': [
        {
          'text': 'There is no difference.',
          'score': 0
        },
        {
          'text': 'Lists give you an ordered list of single values, identified by an index. Maps use key-value pairs where each pair has its own index.',
          'score': 0
        },
        {
          'text': 'Lists give you an ordered list of single values, identified by an index. Maps use key-value pairs where you identify values by their key.',
          'score': 1
        }
      ]
    },
    {
      'question': 'What does the following code snippet produce? \n final names = [\'Max\',\'Manu\',\'Julie\'] \n final result = names.map((name) => Text(name).toList',
      'answers': [
        {
          'text': 'result is a list of  Text()   widgets where each widget holds a different  name   from  names. ',
          'score': 1
        },
        {
          'text': 'names is a list of  Text()   widgets where each widget holds a different  name   from  names. ',
          'score': 0
        },
        {
          'text': 'This will throw an error.',
          'score': 0
        }
      ]
    },
    {
      'question': 'What\' true about final?',
      'answers': [
        {
          'text': ' Properties or variables marked as <code>final</code> can\'t change at compile-time.',
          'score': 0
        },
        {
          'text': ' Properties or variables marked as <code>final</code> can\'t change at runtime.',
          'score': 1
        },
        {
          'text': 'Properties or variables marked as <code>final</code> can\'t change at all.',
          'score': 0
        }
      ]
    },
    //
  ];

  void resetScore() {
    setState(() {
      totalScore = 0;
      questionIndex = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex += 1;
    });
    print(totalScore);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove debug icon
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Quiz App'),
        ),
        body: questionIndex < questions.length ? Quiz(questions, answerQuestion, questionIndex) : Result(totalScore, resetScore),
      ),
    );
  }
}
