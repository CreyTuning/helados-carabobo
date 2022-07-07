import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.selected
  }) : super(key: key);

  final String label;
  final Function onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: (){onTap();},
        child: AnimatedContainer(
          padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: (selected == true) ? Colors.blue : Colors.grey[700],
          ),
      
          duration: const Duration(milliseconds: 200),
          child: Center(child: Text(label)),
        ),
      ),
    );
  }
}