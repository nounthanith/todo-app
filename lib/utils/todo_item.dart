import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget {
  final bool isChecked;
  final String todoText;
  final Function(bool?)? onChange;
  final Function(BuildContext)? onpress;

  TodoItem({
    super.key,
    required this.isChecked,
    required this.onChange,
    required this.todoText,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18, right: 18),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onpress,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(0),

            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: Colors.black, // Shadow color
                blurRadius: 0,         // How blurry the shadow is
                offset: Offset(5, 5),  // Position of the shadow
              ),
            ]
          ),
          child: Row(
            children: [
              Checkbox(
                onChanged: onChange,
                value: isChecked,
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.all(Colors.grey[700]),
              ),
              Text(
                todoText,
                style: TextStyle(
                  decoration:
                      isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
