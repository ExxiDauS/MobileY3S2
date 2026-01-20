import 'package:flutter/material.dart';
import '../widget/todo_list_card.dart';
import '../models/todo.dart';
import '../utils/database_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final dbHelper = DatabaseHelper.instance;
  List<Todo> todos = [];
  List<String> items = ['Todo', 'In Progress', 'Completed'];

  // Validate key
  final _formKey = GlobalKey<FormState>();

  // Field Controllers
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadTodos();
  }

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  _loadTodos() async {
    List<Todo> todoList = await dbHelper.getAllTodos();
    print(todoList);
    setState(() {
      todos = todoList;
    });
  }

  _addTask() async {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      return;
    }
    await dbHelper.insertTodo(
      Todo(
        id: int.parse(todos.length.toString()) + 1,
        title: titleController.text,
        description: descriptionController.text,
        status: 'Todo',
      ),
    );
    titleController.clear();
    descriptionController.clear();
    _loadTodos();
  }

  _updateTodoStatus(Todo todo, String newStatus) async {
    Todo updatedTodo = Todo(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      status: newStatus,
    );
    await dbHelper.updateTodo(updatedTodo);
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Website Development',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                // Action for info button
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Action for menu button
            },
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'New task'),
              Tab(text: 'Scheduled'),
              Tab(text: 'In progress'),
              Tab(text: 'Completed'),
            ],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.lightBlue,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Builder(
                builder: (context) {
                  return ListView.builder(
                    padding: EdgeInsets.all(12),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return TodoListCard(
                        todo: todos[index],
                        onRefresh: _loadTodos,
                        onStatusChange: _updateTodoStatus,
                      );
                    },
                  );
                },
              ),
            ),
            Center(child: Text('Services Page Content')),
            Center(child: Text('Contact Page Content')),
            Center(child: Text('About Page Content')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add New Task",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(labelText: 'Task Title'),
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Task Description',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add task logic
                            _addTask();
                            Navigator.of(context).pop();
                          },
                          child: Text('Add Task'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          splashColor: Colors.lightBlue,
          shape: CircleBorder(),
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_sharp),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_add_rounded),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
