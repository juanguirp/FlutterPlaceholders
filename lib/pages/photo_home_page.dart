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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                      image: AssetImage('assets/team.jpg'), fit: BoxFit.cover),
                ),
                child: Text('App Users - User list 🧐',
                    style: TextStyle(fontSize: 25)),
              ),
              ListTile(
                title: const Text(
                  '😎 Ver el listado de usuarios 😎',
                ),
                onTap: () {
                  print('ir al listado de usuarios');
                },
              ),
            ],
          ),
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
