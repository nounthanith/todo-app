import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {

  final bool isChecked;
  final String todoText;
  final Function(bool?)? onChange;


  TodoItem({super.key, required this.isChecked, required this.onChange, required this.todoText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.deepPurple[500],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Checkbox(onChanged: onChange, value: isChecked, checkColor: Colors.white,),
            Text(todoText,
              style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
