import 'package:flutter/material.dart';
import 'package:myfluttertodo/utils/todo_list.dart';


class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List myToDoList = [
    ['Learn Flutter', false],
    ['Dream Coffee', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      myToDoList[index][1] = !myToDoList[index][1];
      _controller.clear();
    });
  }

  void saveNewTask() {
    setState(() {
      myToDoList.add([_controller.text, false]);
    });
  }

  void deleteTask(int index) {
    setState(() {
      myToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: const Text(
          "Arda's Todo App",
          ),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: myToDoList.length, 
        itemBuilder: (BuildContext context, index){
        return TodoList(
          taskName: myToDoList[index][0],
          taskCompleted: myToDoList[index][1],
          onChanged:  (value) => checkBoxChanged(index),
          deleteItem: (context) => deleteTask(index),
        );
      }),
      floatingActionButton: Row(children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Add new item',
              filled: true,
              fillColor: Colors.deepPurple.shade200,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
                focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),),
        FloatingActionButton(
          onPressed: saveNewTask,
          child: const Icon(Icons.add),
          ),
      ],)
    );
  }
}