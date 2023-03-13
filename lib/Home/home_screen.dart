import 'package:flutter/material.dart';
import 'package:flutter_multi_select_feature/Models/subjects_model.dart';
import 'package:flutter_multi_select_feature/Widgets/custom_card.dart';

class MultiSelectFeature extends StatefulWidget {
  const MultiSelectFeature({super.key});

  @override
  State<MultiSelectFeature> createState() => _MultiSelectFeatureState();
}

class _MultiSelectFeatureState extends State<MultiSelectFeature> {
  exitsTrash(SubjectsModel subjectsModel) => trashBox.contains(subjectsModel);
  List<SubjectsModel> trashBox = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: trashBox.isEmpty
          ? AppBar(
              title: const Text('Multi-Delete'),
              centerTitle: true,
            )
          : AppBar(
              leading: IconButton(
                icon: const Icon(Icons.clear_outlined),
                onPressed: () {
                  setState(() {
                    trashBox.clear();
                  });
                },
              ),
              title: Text(trashBox.length.toString()),
              actions: [
                ///Delete Button
                IconButton(
                    onPressed: () {
                      subjectsModel
                          .removeWhere((item) => trashBox.contains(item));
                      trashBox.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete_outline))
              ],
            ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subjectsModel.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                ///Varibale
                final v = subjectsModel[index];

                ///Custom Card
                return CustomCard(
                  leadingTitle: v.id,
                  title: v.subjectName,
                  isSelected: exitsTrash(v),
                  trashBox: trashBox,

                  ///On Tap Message
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Single Tap!'),
                      duration: Duration(seconds: 1),
                    ));
                  },

                  ///On Delete
                  onDelete: () {
                    if (trashBox.contains(v)) {
                      trashBox.remove(v);
                      setState(() {});
                    } else {
                      trashBox.add(v);
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
