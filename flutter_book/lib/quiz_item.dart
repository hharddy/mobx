import 'package:flutter/material.dart';
import 'package:flutter_book/quiz.dart';

import 'main.dart';
class QuizItem extends StatefulWidget {
  Quiz _quiz;

  QuizItem(this._quiz);

  @override
  _QuizItemState createState() => _QuizItemState(_quiz);
}

class _QuizItemState extends State<QuizItem> {
  var id  ;
  Quiz? _quiz;

  _QuizItemState(this._quiz);

  @override
  void initState() {
    // TODO: implement initState
     id  = '';
  }
  @override
  Widget build(BuildContext context) {


    return Container(

      margin: EdgeInsets.symmetric(vertical: 6.0,horizontal: 15.0),
      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget._quiz.title,style: TextStyle(fontSize: 18.0),),
          SizedBox(height: 10.0,),
          Column(
            children: _quiz!.options.map((e) => RadioListTile<String>(
              title: Container(child: Text(e),margin: EdgeInsets.all(0.0),),
              value: e,
              //selected: false,
              groupValue:id ,
             onChanged: (val){
                setState(() {
                  id = val;
                  print("id: ${id}");
                  MyAppState.resultStore.add(id, _quiz!.title);

                });
             },
            )

            ).toList(),
          )

        ],
      ),
    );
  }
}
