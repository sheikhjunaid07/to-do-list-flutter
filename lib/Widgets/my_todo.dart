import 'package:flutter/material.dart';

class MyToDo extends StatefulWidget{
  final String text;
const MyToDo({super.key, required this.text});

  @override
  State<MyToDo> createState() => _MyToDoState();
}

class _MyToDoState extends State<MyToDo> {
  TextEditingController textController = TextEditingController();

  Widget build(BuildContext context){
    return Container(
      width: 220,
      height: 50,
      child: TextField(
        style: TextStyle(fontSize: 18),
        controller: textController,
       decoration: InputDecoration(
         hintText: widget.text,
         border: InputBorder.none,

       ),
      ),
    );
  }
}