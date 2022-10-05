import 'package:flutter/material.dart';
import 'package:todo/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context)
          .colorScheme
          .background
          .withBlue(70)
          .withGreen(50)
          .withRed(40),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Add a new Task'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //cancel
                MyButton(
                  text: 'Cancel',
                  isPrimary: false,
                  onPressed: onCancel,
                ),
                //save
                MyButton(
                  text: 'Save',
                  isPrimary: true,
                  onPressed: onSave,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
