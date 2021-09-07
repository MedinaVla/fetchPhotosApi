import 'package:flutter/material.dart';

import 'features/photos/presentation/photo_page.dart';

class PhotosApp extends StatelessWidget {
  const PhotosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photos App Clean Code Riverpod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PhotoPage(),
    );
  }
}
