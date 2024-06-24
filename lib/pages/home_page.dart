import "package:flutter/material.dart";
import "package:to_do_list/Widgets/add_todo_button.dart";
import "package:to_do_list/Widgets/my_todo.dart";

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Todos', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (p0) {}),
                const SizedBox(width: 10),
                MyToDo(text: "Some data"),
                Icon(Icons.delete)
              ],
            ),
            AddToDoButton()
          ],
        ),
      ),
    );
  }
}
