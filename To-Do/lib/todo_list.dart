import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  var addText = TextEditingController();

  final List<String> _tasks = [];

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
    addText.clear();
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _tasksComplete(int index) {
    setState(() {
      _tasks[index] = "✅ ${_tasks[index]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("To-Do-App",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: TextFormField(
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              controller: addText,
              decoration: const InputDecoration(
                hintText: "Add new task",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(width: 3, color: Colors.amber),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(width: 3, color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(width: 3, color: Colors.grey),
                ),
                suffixIcon: Icon(
                  Icons.add_comment_rounded,
                  color: Colors.green,
                  size: 35,
                ),
              ),
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  _addTask(value);
                }
              },
            ),
          ),
          Container(
            child: Expanded(
                child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("⚫"),
                  title: Text(_tasks[index]),
                  // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Colors.amberAccent, width: 3),
                      borderRadius: BorderRadius.circular(30)),
                  tileColor: Colors.yellow[50],
                  textColor: Colors.black,
                  trailing: IconButton(
                    onPressed: () {
                      _deleteTask(index);
                    },
                    icon: const Icon(Icons.delete),
                    color: Colors.red,
                    iconSize: 35,
                  ),
                );
              },
            )),
          )
        ],
      ),
    );
  }
}
