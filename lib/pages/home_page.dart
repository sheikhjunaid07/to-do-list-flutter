import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/services/firebase_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firestore use to perform operations in direct firebase
  final FireStoreServices fireStoreServices = FireStoreServices();

  //text controller
  final TextEditingController textController = TextEditingController();

  //open dialog box when user click add button
  void openTodoBox({String? docId}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                //button to save
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () {
                      //add a new note
                      if (docId == null) {
                        fireStoreServices.addTodo(textController.text);
                      } else {
                        fireStoreServices.updateTodo(
                            docId, textController.text);
                      }

                      //clear the text controller for the new note
                      textController.clear();

                      //close the  box
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Add Todo",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "T O D O S",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            openTodoBox();
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreServices.getTodoStream(),
        builder: (context, snapshot) {
          //if we have data, get all the notes
          if (snapshot.hasData) {
            List todosList = snapshot.data!.docs;

            //display as a list
            return ListView.builder(
              itemCount: todosList.length,
              itemBuilder: (context, index) {
                //get each individual docs
                DocumentSnapshot document = todosList[index];
                String docId = document.id;

                //get note from each docs
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['todo'];

                //display a list tile
                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () => openTodoBox(docId: docId),
                          icon: const Icon(Icons.settings)),
                      IconButton(
                          onPressed: () {
                            fireStoreServices.deleteTodo(docId);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text("No Todos!!!!!");
          }
        },
      ),
    );
  }
}
