import 'package:flutter/material.dart';

class ProductoSinSaborTile extends StatelessWidget {
  const ProductoSinSaborTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.done_rounded,
        color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)
      ),
      title: Text('Producto sin sabores',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)
        ),
      ),
    );
  }
}