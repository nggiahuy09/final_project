import 'package:final_project/consts/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class KbDetailsItem extends StatefulWidget {
  const KbDetailsItem({super.key});

  @override
  State<KbDetailsItem> createState() => _KbDetailsItemState();
}

class _KbDetailsItemState extends State<KbDetailsItem> {
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // todo: add key later to make each KBDetailsItem separate
      // key: ValueKey(),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8.0),
              child: SlidableAction(
                onPressed: (context) {},
                borderRadius: BorderRadius.circular(12),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => setState(() {
          enable = !enable;
        }),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.secondaryColor.withOpacity(0.7),
          ),
          child: ListTile(
            leading: const Icon(Icons.file_copy_outlined),
            contentPadding: const EdgeInsets.only(left: 8.0, right: 4.0),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'KB Detail Item',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Source'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Size'),
                    Text('Latest Update'),
                  ],
                ),
              ],
            ),
            trailing: Transform.scale(
              scale: 0.9,
              child: Switch(
                value: enable,
                onChanged: (value) {
                  setState(() {
                    enable = value;
                  });
                },
                activeColor: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
