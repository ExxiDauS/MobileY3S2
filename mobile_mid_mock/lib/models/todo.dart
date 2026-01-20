class Todo {
  final int id;
  final String title;
  final String description;
  final String status;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'],
    );
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, status: $status}';
  }
}
