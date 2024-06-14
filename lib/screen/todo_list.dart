import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/screen/add_todo_page.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/screen/todos_provider.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TodosProvider(),
      builder: (context, child){
        return Scaffold(
          appBar: AppBar(
            title: const Text("ToDo App"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<TodosProvider>().getAllTodos();
              },
              child: ListView.builder(
                itemCount: context.watch<TodosProvider>().todos.length,
                itemBuilder: (context, index) {
                  var todo = context.watch<TodosProvider>().todos[index];
                  return TodoList(
                    index: index,
                    title: "${todo['title']}",
                    description: "${todo['description']}",
                    onDelete: () {
                      context.read<TodosProvider>().removeTodo(index);
                    },
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () async{
              await Get.to(() => AddTodoPaga());
              context.read<TodosProvider>().getAllTodos();
            },
            child: Icon(Icons.add),
          ),
        );
      },
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
