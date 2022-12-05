import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:placeholders/provider/photos_provider.dart';
import 'package:placeholders/widgets/widgets.dart';

class PhotoHomePage extends StatelessWidget {
  const PhotoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getPhotoProvider = Provider.of<PhotosProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text("App Photos"),
          elevation: 12,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            PhotoSwiper(photos: getPhotoProvider.photosResult),
            PhotoSlider(
              photos: getPhotoProvider.photosResult,
              title: 'Photos',
            ),
          ],
        )));
  }
}
