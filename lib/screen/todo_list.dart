import 'package:flutter/material.dart';
import 'package:todo_list_app/screen/add_todo_page.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/servise/storege_servise.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List todos = [];

  void getAllTodos() {
    setState(() {
      todos = StoregeServise.get('todos');
      print(todos);
    },);}

  @override
  void initState() {
    getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            var todo = todos[index];
            return TodoList(
              index: index,
              title: "${todo['title']}",
              description: "${todo['description']}",
              onDelete: (){
                setState(() {
                  todo.removeAt(index);
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.to(() => AddTodoPaga());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final Function onDelete;

  const TodoList(
      {required this.index,
      required this.title,
      required this.description,
      required this.onDelete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: Text("${index + 1}"),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: IconButton(
          onPressed: () {
            onDelete();
          },
          icon: Icon(Icons.delete_rounded),
          color: Colors.red,
        ),
      ),
    );
  }
}
