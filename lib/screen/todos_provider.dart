import 'package:flutter/material.dart';
import 'package:todo_list_app/servise/storege_servise.dart';
class TodosProvider extends ChangeNotifier{
  List todos = [];

  TodosProvider(){
    getAllTodos();
  }

  void getAllTodos() {
    todos = StoregeServise.get('todos');
    notifyListeners();
  }
  void removeTodo(int index){
    todos = StoregeServise.get('todos');
    todos.removeAt(index);
    StoregeServise.put('todos', todos);
    notifyListeners();
  }
}