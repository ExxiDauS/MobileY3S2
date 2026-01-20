import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Dev',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RegisterUser(),
    );
  }
}

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mobile Dev')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hoverColor: Colors.green,
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  controller: usernameController,
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  obscuringCharacter: '*',
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.drafts),
                    labelText: 'Username Output',
                    border: OutlineInputBorder(),
                  ),
                  controller: usernameController,
                ),
                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                }, child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Hello, ${usernameController.text}!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'This is register form with email: ${emailController.text}',
                    ),
                    Text('and phone number: ${phoneController.text}'),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
