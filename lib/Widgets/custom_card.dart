import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  ///Vars
  final String title;
  final bool isSelected;
  final void Function()? onDelete;
  final void Function()? onTap;
  final List trashBox;
  final String? leadingTitle;

  const CustomCard({
    Key? key,
    required this.title,
    required this.isSelected,
    this.onDelete,
    this.onTap,
    required this.trashBox,
    this.leadingTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Text(
            "${leadingTitle!}.",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          dense: true,
          selected: isSelected,
          selectedColor: Colors.white,
          selectedTileColor: Colors.teal,
          onTap: trashBox.isNotEmpty ? onDelete : onTap,
          onLongPress: onDelete,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
