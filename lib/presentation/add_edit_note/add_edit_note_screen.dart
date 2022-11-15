import 'package:clean_note/domain/model/note.dart';
import 'package:clean_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:clean_note/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;
  const AddEditNoteScreen({
    Key? key,
    this.note,
  }) : super(key: key);

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
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();

      viewModel.eventStream.listen((event) {
        event.when(saveNote: () {
          if (Navigator.canPop(context)) {
            // 저장해서 뒤로간건지 back press를 누른건지 식별해야함. 그래서 true 넣어줌
            Navigator.pop(context, true);
          }
        });
      });
    });
  }

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
        onPressed: () {
          if (_titleController.text.isEmpty) {
            SnackBar snackBar = const SnackBar(
              content: Text('제목이 비어있습니다.'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            return;
          } else if (_contentController.text.isEmpty) {
            SnackBar snackBar = const SnackBar(
              content: Text('내용이 비어있습니다.'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            return;
          }
          // 이벤트 발생시키기
          viewModel.onEvent(
            AddEditNoteEvent.saveNote(
              widget.note == null ? null : widget.note!.id,
              _titleController.text,
              _contentController.text,
            ),
          );
        },
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
