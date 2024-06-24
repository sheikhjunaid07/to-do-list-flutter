import 'package:flutter/material.dart';

class AddToDoButton extends StatelessWidget {
  TextEditingController textController = TextEditingController();

  AddToDoButton({super.key});

  void addNewTodo(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(controller: textController),
              actions: [
                //add new todo
                //save todo button
                ElevatedButton(onPressed: () {
                  
                //cleat text field
                textController.clear();

                //pop the alert box
                Navigator.pop(context);
                }, child: Text("Save To Do")),

              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        addNewTodo(context);
      },
      child: Container(
        width: 200,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular((20))),
        child: Text("Add New To Do",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
