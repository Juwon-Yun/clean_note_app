import 'package:clean_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:clean_note/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final List<Color> noteColor = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  // Color _color = roseBud;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.save,
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(16),
        color: Color(viewModel.color),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: noteColor
                  .map(
                    (Color color) => InkWell(
                      onTap: () {
                        viewModel.onEvent(
                          AddEditNoteEvent.changeColor(color.value),
                        );
                        // setState(() {
                        //   _color = color;
                        // });
                      },
                      child:
                          renderColor(color, Color(viewModel.color) == color),
                    ),
                  )
                  .toList(),
            ),
            TextField(
              controller: _titleController,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: darkGray),
              decoration: const InputDecoration(
                hintText: '제목을 입력하세요.',
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: _contentController,
              maxLines: null,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: darkGray),
              decoration: const InputDecoration(
                hintText: '내용을 입력하세요.',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderColor(Color color, bool selected) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: selected
            ? Border.all(
                color: Colors.black87,
                width: 3.0,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 2.0,
            spreadRadius: 0.3,
          )
        ],
      ),
      width: 48,
      height: 48,
    );
  }
}
