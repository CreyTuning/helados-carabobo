import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key? key,
    required this.label
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon( Icons.list,
              size: 55,
              color: Colors.grey
            )
          ),
          Text(label, style: const TextStyle(
            fontSize: 16,
            color: Colors.grey
          ),)
        ],
      ),
    );
  }
}