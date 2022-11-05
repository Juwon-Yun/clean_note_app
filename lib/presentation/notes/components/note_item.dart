import 'package:clean_note/domain/model/note.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final VoidCallback onDeleteTap;

  const NoteItem({
    Key? key,
    required this.note,
    required this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(note.color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  note.content,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                onDeleteTap.call();
              },
              child: const Icon(
                Icons.delete,
                color: Color(0xFF424242),
              ),
            ),
          )
        ],
      ),
    );
  }
}
