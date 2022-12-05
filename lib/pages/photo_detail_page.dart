import 'package:flutter/material.dart';
import 'package:placeholders/models/models.dart';

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Photo photo = ModalRoute.of(context)?.settings.arguments as Photo;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(photo: photo),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(photo),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 170, 44, 205),
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Text(
              photo.title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )),
        background: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage('${photo.url}.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle(this.photo, {super.key});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag: photo.photoId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage('${photo.thumbnailUrl}.jpg'),
                height: 150,
                width: 110,
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 170),
                child: Text(photo.title,
                    style: textTheme.headline5,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2)),
            Text(
              'Id: ${photo.id}',
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(children: [
              const Icon(Icons.photo_album_outlined,
                  size: 15, color: Colors.purple),
              const SizedBox(width: 5),
              Text('Album: ${photo.albumId}', style: textTheme.caption)
            ])
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: const Text(
        "Esta foto hace parte del legado patrimonial y cultural de la emperatriz nor-neo-post-antartica Dona Gloria Muskales, nacida el 32 de Febrero de 1843, en el 4to piso del castillo de sus padres. Este cuadro en particular representa la obra maestra de Muskales: La increible e inmensa profundidad del color puro.",
        textAlign: TextAlign.justify,
      ),
    );
  }
}
