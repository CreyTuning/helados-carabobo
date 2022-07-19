import 'package:flutter/material.dart';

class SinSaboresTile extends StatelessWidget {
  const SinSaboresTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline_rounded, color:Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5), size: 50),
          
          const SizedBox(height: 5),
          
          Text(
            'No se agregaron sabores',
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
