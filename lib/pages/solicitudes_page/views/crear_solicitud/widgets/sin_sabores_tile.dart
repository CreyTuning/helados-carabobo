import 'package:flutter/material.dart';

class SinSaboresTile extends StatelessWidget {
  const SinSaboresTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.info_outline_rounded,
        color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)
      ),
      title: Text('No se agregaron sabores',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)
        ),
      ),
    );
  }
}