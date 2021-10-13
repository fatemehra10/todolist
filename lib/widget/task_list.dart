import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widget/task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> task = [
    Task(title: "buy eggs"),
    Task(title: "buy tomato"),
    Task(title: "buy milk")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return TaskTile(text: task[index].title,
        isChecked: task[index].isDone,
        checkBoxCallBack
        :(checkboxState){
          task[index].toggleDone();
        },);
    },
      itemCount: task.length,);
  }
}
