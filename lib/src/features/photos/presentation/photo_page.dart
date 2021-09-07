import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/src/features/photos/logic/photos_provider.dart';

import 'widgets.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos List'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const PhotoConsumer(),
            const Spacer(),
            FetchPhotoButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class FetchPhotoButton extends ConsumerWidget {
  const FetchPhotoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Stack(
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read(photosNotifierProvider.notifier).fetchPhotos();
          },
          child: Icon(Icons.get_app),
        )
      ],
    );
  }
}

class PhotoConsumer extends ConsumerWidget {
  const PhotoConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(photosNotifierProvider);
    return state.when(
      data: (photos) => ListViewPhotos(photos: photos),
      initial: () => Text('List Photos'),
      loading: () => LoadingIndicator(),
      error: (error) => Text(error.toString()),
    );
  }
}
