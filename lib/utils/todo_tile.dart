import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isComplete;
  Function(bool?)? onchanged;
  Function(BuildContext)? deleteTask;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isComplete,
    required this.onchanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 18),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(5),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isComplete
                ? Theme.of(context).colorScheme.tertiaryContainer
                : Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isComplete,
                onChanged: onchanged,
                checkColor: Theme.of(context).colorScheme.onPrimaryContainer,
                activeColor: Theme.of(context).colorScheme.background,
              ),
              Text(
                taskName,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: isComplete
                          ? Theme.of(context).colorScheme.onTertiaryContainer
                          : Theme.of(context).colorScheme.onPrimaryContainer,
                      decoration: isComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
