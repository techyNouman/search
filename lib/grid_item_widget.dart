import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  final String name;
  final String imageUrl;

  GridItemWidget({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(name),
        ],
      ),
    );
  }
}