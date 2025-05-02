import 'package:flutter_firebase/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookService {
  final CollectionReference booksRef =
      FirebaseFirestore.instance.collection('books');

  Future<void> addBook(BookModel book) async {
    final docRef = booksRef.doc();
    book.id = docRef.id;// Set ID dari Firestore
    await docRef.set(book.toJson());
  }

  Future<List<BookModel>> getBooks() async {
    final snapshot = await booksRef.get();
    return snapshot.docs.map((doc) {
      return BookModel.fromFirestore(doc);
    }).toList();
  }

  Future<BookModel?> getBookById(String id) async {
    final doc = await booksRef.doc(id).get();
    if (doc.exists) {
      return BookModel.fromFirestore(doc);
    }
    return null;
  }

  Future<void> updateBook(BookModel book) async {
    if (book.id == null) return;
    await booksRef.doc(book.id).update(book.toJson());
  }

  Future<void> deleteBook(String id) async {
    await booksRef.doc(id).delete();
  }
}
