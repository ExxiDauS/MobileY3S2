import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items;
  const CustomDropdownButton({super.key, required this.items});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 4,
      icon: Icon(Icons.arrow_downward_rounded),
      iconSize: 16,
      style: TextStyle(color: Colors.black, fontSize: 14),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}