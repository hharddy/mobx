import 'package:flutter/material.dart';
import 'package:flutter_book/quiz.dart';
import 'package:flutter_book/quiz_item.dart';
import 'package:flutter_book/result.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

 class MyApp extends StatefulWidget {

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var quiz =[];

 static ResultStore resultStore = ResultStore();
  @override
  void initState() {
    var capital =[
      'Tehran',
      'Tabriz',
      'Shiraz',
      'Karaj'
    ]; // question: Where is the capital of Iran?


    var age = [
      '10-18',
      '19 - 30',
      '31 - 50',
      '+50'
    ];

    var country = [
      'Russia',
      'China',
      'Canada',
      'Spain'
    ];

    quiz.add(Quiz('Capital of Iran?', capital));
    quiz.add(Quiz('How old are you?', age));
    quiz.add(Quiz('What is the largest country ?', country));
  }

  void ShowResult(var con){
    showDialog(context: con,
        builder: (BuildContext context){
          return Dialog(
            backgroundColor: Colors.white,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
              width:150.0,
              height:150.0,
              child: ListView.builder(
                itemCount: resultStore.result.length,
                itemBuilder: (context,index){
                  var question = resultStore.result.keys.elementAt(index);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child:  Wrap(
                        children: [
                          Text('${question.toString()} ->'),
                          SizedBox(width: 3.0,),
                          Text(resultStore.result[question].toString()),

                        ],

                    )
                  );
                }

              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
         body: SafeArea(
           child: Container(
            color: Color(0xfff5f5fa),

            child: Column(
              children: [
                SizedBox(height: 10.0,),
                Observer(
                    builder: (e){
                      return Text("${resultStore.result.length} of ${quiz.length}",
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),);
                    }
                ),
                SizedBox(height: 10.0,),
                Expanded(child: QuizList(quiz)),


               SizedBox(height: 5.0,),
                ElevatedButton(

                    onPressed: (){
                      ShowResult(context);
                    },
                    child: Text("Submit", style: TextStyle(fontSize: 17.0))
                ),
                SizedBox(height: 5.0,),
              ],
            )
           ),
         ),

     );
  }

}

class QuizList extends StatelessWidget {
  var quiz =[];

  QuizList(this.quiz);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quiz.length,
      itemBuilder: (context,index){
        return QuizItem(quiz[index]);
      },
    );
  }
}

