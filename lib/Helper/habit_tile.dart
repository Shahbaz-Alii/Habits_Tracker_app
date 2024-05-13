import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatefulWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext) manage;
  final Function(BuildContext) remove;


  const HabitTile({
    super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChanged,
    required this.manage,
    required this.remove,
  });


  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: widget.manage,
                icon: Icons.settings,
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.circular(12),

              ),
              SlidableAction(
                onPressed: widget.remove,
                icon: Icons.delete,
                backgroundColor: Colors.white10,
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ],

          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              // color: Colors.grey[100],
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: [
                Transform.scale( scale: 1.4,
                  child: Checkbox(
                    value: widget.habitCompleted,
                    onChanged: widget.onChanged,
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    shape: CircleBorder(),
                  ),
                ),
                Text(
                  widget.habitName,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),),
      );
  }
}
