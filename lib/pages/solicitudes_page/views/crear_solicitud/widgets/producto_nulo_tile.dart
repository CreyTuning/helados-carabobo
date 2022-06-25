import 'package:flutter/material.dart';

class ProductoNuloTile extends StatelessWidget {
  const ProductoNuloTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.info_outline_rounded,
        color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)
      ),
      title: Text('No hay producto seleccionado',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5)
        ),
      ),
    );
  }
}