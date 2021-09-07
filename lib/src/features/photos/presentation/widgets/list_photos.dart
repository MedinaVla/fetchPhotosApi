import 'package:flutter/material.dart';
import 'package:photos/photos.dart';

class ListViewPhotos extends StatelessWidget {
  const ListViewPhotos({
    Key? key,
    required this.photos,
  }) : super(key: key);
  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) =>
                Image.network(photos[index].thumbnailUrl)),
      ),
    );
  }
}
