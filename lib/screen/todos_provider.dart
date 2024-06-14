import 'package:flutter/material.dart';
class TodosProvider extends ChangeNotifier{
  List todos = [];

  void getAllTodos() {
    setState(() {
      todos = StoregeServise.get('todos');
    },
    );
  }
  void removeTodo(int index){
    todos = StoregeServise.get('todos');
    todos.removeAt(index);
    StoregeServise.put('todos', todos);
    setState(() {

    });
  }
}