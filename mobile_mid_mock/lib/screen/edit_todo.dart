import 'package:flutter/material.dart';
import 'package:mobile_mid_mock/models/todo.dart';
import '../utils/database_helper.dart';

class EditTodo extends StatefulWidget {
  final Todo todo;
  const EditTodo({super.key, required this.todo});
  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final dbHelper = DatabaseHelper.instance;
  final titleController = TextEditingController();
  List<Todo> todos = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    super.dispose();
  }

  _updateTodo(Todo todo) async {
    Todo updatedTodo = Todo(
      id: todo.id,
      title: titleController.text,
      description: todo.description,
      status: todo.status,
    );
    await dbHelper.updateTodo(updatedTodo);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Todo')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 12,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Edit Todo title'),
                ),
                Text('Current Todo: ${widget.todo.title}, ${widget.todo.id}'),
                ElevatedButton(
                  onPressed: () {
                    _updateTodo(widget.todo);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
