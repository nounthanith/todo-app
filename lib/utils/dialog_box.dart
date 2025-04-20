import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {

  final Controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({super.key, required this.onCancel, required this.onSave, required this.Controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[400],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: Controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task",
                hintStyle: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: onCancel, child: Text("Cancel",style: TextStyle(color: Colors.white),)),
                SizedBox(
                  width: 8,
                ),
                TextButton(onPressed: onSave, child: Text("Add",style: TextStyle(color: Colors.white),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
