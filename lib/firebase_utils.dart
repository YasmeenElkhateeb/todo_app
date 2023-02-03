import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task.dart';

CollectionReference<Task> getTaskCollection(){
  return FirebaseFirestore.instance.collection('task')
      .withConverter<Task>(
         fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
         toFirestore: (task, options) => task.toJson(),
      );
}

Future<void> addTaskToFireStore(Task task){
  var collection = getTaskCollection(); //get collection = task
  var docRef = collection.doc(); // get document
  task.id = docRef.id ; // Auto generate Id
  return docRef.set(task); // to add task
}

Future<void> deleteTaskFromFireStore(Task task){
  return getTaskCollection().doc(task.id).delete().timeout(Duration(milliseconds: 5),onTimeout: (){
    print('task was deleted');
  });
}

Future<void> editTaskIsDone(Task task){
  return getTaskCollection().doc(task.id).update({
    'isDone': !task.isDone,
  });
}

Future<void> editTaskToFireStore(Task task){
  return getTaskCollection().doc(task.id).update(task.toJson());
}