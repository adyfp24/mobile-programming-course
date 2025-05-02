import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/book_model.dart';
import 'package:flutter_firebase/services/book_service.dart';

class BookEditView extends StatefulWidget {
  final BookModel book;

  const BookEditView({super.key, required this.book});

  @override
  State<BookEditView> createState() => _BookEditViewState();
}

class _BookEditViewState extends State<BookEditView> {
  final _bookService = BookService();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book.title);
    _descriptionController =
        TextEditingController(text: widget.book.description);
  }

  Future<void> updateBook() async {
    final updatedBook = BookModel(
      id: widget.book.id,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    await _bookService.updateBook(updatedBook);
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Buku')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: updateBook,
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
