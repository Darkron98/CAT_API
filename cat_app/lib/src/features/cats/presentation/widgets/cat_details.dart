import 'package:cat_app/src/features/cats/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class CatDetails extends StatelessWidget {
  const CatDetails({
    super.key,
    required ScrollController controller,
    required this.data,
  }) : _controller = controller;

  final BreedWithImage data;
  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: _controller,
        thickness: 6,
        radius: const Radius.circular(5),
        thumbVisibility: true,
        child: GridView(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3,
          ),
          children: [
            _item(Icons.map, 'Origin', data.breed.origin),
            _item(Icons.favorite, 'Affection', '${data.breed.affectionLevel}'),
            _item(Icons.flash_on, 'Energy', '${data.breed.energyLevel}'),
            _item(
                Icons.psychology, 'Intelligence', '${data.breed.intelligence}'),
            _item(Icons.child_friendly, 'Child Friendly',
                '${data.breed.childFriendly}'),
            _item(Icons.pets, 'Dog friendly', '${data.breed.dogFriendly}'),
            _item(Icons.health_and_safety, 'Life span', data.breed.lifeSpan),
            _item(
                Icons.landscape, 'Adaptability', '${data.breed.adaptability}'),
          ],
        ));
  }
}

Widget _item(IconData icon, String title, String value) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    ),
  );
}
