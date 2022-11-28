import 'package:clean_note/domain/util/note_order.dart';
import 'package:flutter/material.dart';

typedef OnOrderChange = Function(NoteOrder noteOrder);

class OrderSection extends StatelessWidget {
  final NoteOrder noteOrder;
  final OnOrderChange onOrderChange;
  const OrderSection({
    Key? key,
    required this.onOrderChange,
    required this.noteOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              value: NoteOrder.title(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChange(
                  NoteOrder.title(noteOrder.orderType),
                );
              },
            ),
            const Text(
              'title',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Radio<NoteOrder>(
              value: NoteOrder.date(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChange(
                  NoteOrder.date(noteOrder.orderType),
                );
              },
            ),
            const Text(
              'date',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Radio<NoteOrder>(
              value: NoteOrder.color(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChange(
                  NoteOrder.color(noteOrder.orderType),
                );
              },
            ),
            const Text(
              'color',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [],
        ),
      ],
    );
  }
}
