import 'entities.dart';

class Cat {
  final String id;
  final String url;
  final int width;
  final int height;
  final List<Breed> breeds;

  Cat({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.breeds,
  });
}
