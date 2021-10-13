import 'package:flutter/material.dart';

import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int countTask = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) =>const AddTaskScreen());
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Todoey",
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "$countTask Tasks",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 30 , right: 30),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: ListView(
              children: [
                TaskTile(),
                TaskTile(),
                TaskTile()

              ],
            ),
          ))
        ],
      ),
    );
  }
}

class TaskTile extends StatefulWidget {

  TaskTile({Key? key}) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("this is a task.",style: TextStyle(decoration:isChecked ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked, onChanged: (value) { setState(() {
        isChecked = value!;
          });}),
    );
  }
}

