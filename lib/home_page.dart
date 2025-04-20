import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final _Controller = TextEditingController();
  List TodoList = [];
  void checkBoxChange(bool? value, int index){
    setState(() {
      TodoList[index][1] = !TodoList[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      TodoList.add([_Controller.text , false]);
      _Controller.clear();
      Navigator.of(context).pop();

    });
  }
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
          onCancel: Navigator.of(context).pop ,
          onSave: saveNewTask,
          Controller: _Controller);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text("TODO",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        backgroundColor: Colors.deepPurple[400],
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple[400],
          onPressed: createNewTask,
          child: Icon(Icons.add, color: Colors.white,),
      ),
      body: ListView.builder(
          itemCount: TodoList.length,
          itemBuilder: (context, index){
            return TodoItem(
                isChecked: TodoList[index][1],
                onChange: (value) => checkBoxChange(value, index),
                todoText: TodoList[index][0]
            );
          }
      )
    );
  }
}
