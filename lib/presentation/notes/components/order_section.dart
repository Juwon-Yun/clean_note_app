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
                })
          ],
        ),
        Row(
          children: [],
        ),
      ],
    );
  }
}
