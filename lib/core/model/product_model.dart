import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Product {
  final String image, title, teacher;
  final int id, courses;
  final Color color;
  Product({
    required this.image,
    required this.title,
    required this.courses,
    required this.teacher,
    required this.color,
    required this.id,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Matematika",
      image: "assets/images/graphics.png",
      color: Color(0xFF71b8ff),
      courses: 16,
      teacher: "Yayah, S.Pd.I"),
  Product(
      id: 2,
      title: "Produktif",
      image: "assets/images/programming.png",
      color: Color(0xFFff6374),
      courses: 22,
      teacher: "Yayah, S.Pd.I"),
  Product(
      id: 3,
      title: "Pendidikan Kewarganegaraan",
      image: "assets/images/finance.png",
      color: Color(0xFFffaa5b),
      courses: 15,
      teacher: "Yayah, S.Pd.I"),
  Product(
      id: 4,
      title: "UI/Ux design",
      image: "assets/images/ux.png",
      color: Color(0xFF9ba0fc),
      courses: 18,
      teacher: "Yayah, S.Pd.I"),
];
