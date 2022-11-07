import 'package:clean_note/ui/colors.dart';
import 'package:flutter/material.dart';

class AddEditNoteScreen extends StatelessWidget {
  const AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.save,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.grey,
        child: Column(
          children: [
            Row(),
            TextField(
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
}
