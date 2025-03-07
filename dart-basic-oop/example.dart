// 1. Deklarasi Variabel
// Dart mendukung var, final, dan const untuk mendeklarasikan variabel.
void main() {
  var name = "Budi"; // var dapat berubah nilainya
  final age = 20; // final tidak bisa diubah setelah dideklarasikan
  const pi = 3.14; // const adalah nilai konstan yang diketahui saat compile-time

  print("Nama: $name, Umur: $age, Pi: $pi");

  // 2. Tipe Data
  int angka = 10;
  double desimal = 5.5;
  bool isDartFun = true;
  String text = "Belajar Dart";
  List<int> numbers = [1, 2, 3, 4, 5];
  Map<String, int> nilai = {"Matematika": 90, "Dart": 95};

  print("Angka: $angka, Desimal: $desimal");
  print("Boolean: $isDartFun, Text: $text");
  print("List: $numbers");
  print("Map: $nilai");

  // 3. Operator
  int a = 10;
  int b = 3;
  print("Penjumlahan: ${a + b}");
  print("Pengurangan: ${a - b}");
  print("Perkalian: ${a * b}");
  print("Pembagian: ${a / b}");
  print("Modulus: ${a % b}");

  // 4. Kontrol Alur (if-else, switch, loop)
  int nilaiUjian = 85;
  if (nilaiUjian >= 90) {
    print("Grade: A");
  } else if (nilaiUjian >= 80) {
    print("Grade: B");
  } else {
    print("Grade: C");
  }

  // Switch Case
  String hari = "Senin";
  switch (hari) {
    case "Senin":
      print("Hari Senin");
      break;
    case "Selasa":
      print("Hari Selasa");
      break;
    default:
      print("Hari lain");
  }

  // Looping
  for (int i = 1; i <= 5; i++) {
    print("Perulangan ke-$i");
  }

  int count = 0;
  while (count < 3) {
    print("While loop ke-${count + 1}");
    count++;
  }

  // 5. Fungsi (Function)
  void sayHello(String nama) {
    print("Halo, $nama!");
  }

  sayHello("Andi");

  int tambah(int x, int y) {
    return x + y;
  }

  print("Hasil Tambah: ${tambah(5, 7)}");

  // 6. OOP pada Dart
  // Polymorphism & Encapsulation
  Animal animal = Animal("Kucing", 3);
  Dog dog = Dog("Buddy", 2, "Golden Retriever");

  animal.makeSound();
  dog.makeSound();

  print("Anjing: ${dog.name}, Breed: ${dog.breed}, Umur: ${dog.age} tahun");
}

// 7. OOP pada Dart
// Class dan Object
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void makeSound() {
    print("Hewan bersuara");
  }
}

// Inheritance (Pewarisan)
class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() {
    print("$name menggonggong: Woof woof!");
  }
}
