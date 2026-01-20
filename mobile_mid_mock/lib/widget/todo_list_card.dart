import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../screen/edit_todo.dart';

class TodoListCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onRefresh;
  final Function(Todo, String)? onStatusChange;

  const TodoListCard({
    super.key,
    required this.todo,
    this.onRefresh,
    this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDone = todo.status == 'Done';

    return InkWell(
      onTap: () async {
        final result = await Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => EditTodo(todo: todo)));
        if (result == true && onRefresh != null) {
          onRefresh!();
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isDone,
                    onChanged: (bool? value) {
                      if (onStatusChange != null) {
                        final newStatus = value == true ? 'Done' : 'Todo';
                        onStatusChange!(todo, newStatus);
                      }
                    },
                  ),
                  SizedBox(width: 12),
                  Container(
                    height: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.title,
                          style: TextStyle(
                            fontSize: 16,
                            decoration: isDone
                                ? TextDecoration.lineThrough
                                : null,
                            color: isDone ? Colors.grey : null,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          todo.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDone ? Colors.grey : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
