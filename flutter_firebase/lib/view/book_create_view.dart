import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/book_model.dart';
import 'package:flutter_firebase/services/book_service.dart';

class BookCreateView extends StatefulWidget {
  const BookCreateView({super.key});

  @override
  State<BookCreateView> createState() => _BookCreateViewState();
}

class _BookCreateViewState extends State<BookCreateView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final BookService _bookService = BookService();

  Future<void> saveBook() async {
    final book = BookModel(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
    );
    await _bookService.addBook(book);
    Navigator.pop(context); // kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Buku')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: saveBook,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
