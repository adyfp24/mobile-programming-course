import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/book_model.dart';
import 'package:flutter_firebase/services/book_service.dart';
import 'package:flutter_firebase/view/book_edit_page.dart';
import 'book_create_view.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  final BookService _bookService = BookService();
  List<BookModel> books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    books = await _bookService.getBooks();
    setState(() {});
  }

  Future<void> deleteBook(String id) async {
    await _bookService.deleteBook(id);
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Buku')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            title: Text(book.title ?? ''),
            subtitle: Text(book.description ?? ''),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookEditView(book: book),
                      ),
                    );
                    fetchBooks(); 
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteBook(book.id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const BookCreateView()),
          );
          fetchBooks(); 
        },
      ),
    );
  }
}
