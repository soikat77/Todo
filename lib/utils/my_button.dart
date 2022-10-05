import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  bool isPrimary;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: MaterialButton(
        onPressed: onPressed,
        color: isPrimary
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.error,
        child: Text(
          text,
          style: isPrimary
              ? Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                  )
              : Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
        ),
      ),
    );
  }
}
