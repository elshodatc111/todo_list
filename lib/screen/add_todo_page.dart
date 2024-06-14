import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/servise/storege_servise.dart';

class AddTodoPaga extends StatefulWidget {
  const AddTodoPaga({super.key});

  @override
  State<AddTodoPaga> createState() => _AddTodoPagaState();
}

class _AddTodoPagaState extends State<AddTodoPaga> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  _addNewTodo() {
    var title = titleController.text;
    var desc = descriptionController.text;
    if (title.isEmpty || desc.isEmpty) {
      print('Malumotlar yetarli emas');
      return;
    }
    List todos = StoregeServise.get('todos')??[];
    todos.add(
      {
        'title': title,
        'description': desc
      },
    );

    StoregeServise.put('todos', todos);
    titleController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Todo"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12.0,
          ),
          Container(
            color: Colors.white,
            width: Get.width,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            alignment: Alignment.center,
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Todo title",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            color: Colors.white,
            width: Get.width,
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            alignment: Alignment.center,
            child: TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Todo description",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(Get.width, 60),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                )),
            onPressed: () {
              _addNewTodo();
            },
            child: Text("Add list"),
          )
        ],
      ),
    );
  }
}
