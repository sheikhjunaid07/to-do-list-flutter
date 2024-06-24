import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  //get the notes
  final CollectionReference todos = FirebaseFirestore.instance.collection('todos');

  //CREATE: create to do
  Future<void> addTodo(String todo){
    return todos.add({
      'todo': todo,
      'timestamp': Timestamp.now()
    });
  }

  //READ: get to do list
Stream<QuerySnapshot> getTodoStream(){
    final todoStream = todos.orderBy('timestamp', descending: true).snapshots();
    return todoStream;
}

 //UPDATE: update to do by id
 Future<void> updateTodo(String newTodo, String docId){
    return todos.doc(docId).update({
      'todo': newTodo,
      'timestamp': Timestamp.now()
    });
 }

 //DELETE to do by id
Future<void> deleteTodo(String docId){
    return todos.doc(docId).delete();
  }
}
