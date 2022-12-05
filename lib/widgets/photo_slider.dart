import 'package:flutter/material.dart';
import 'package:placeholders/models/models.dart';

class PhotoSlider extends StatefulWidget {
  const PhotoSlider({
    super.key,
    required this.photos,
    this.title,
  });

  final List<Photo> photos;
  final String? title;

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 260,
        child: Column(
          children: [
            if (widget.title != null)
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(widget.title!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.photos.length,
              itemBuilder: (context, index) => _PhotoPoster(
                photo: widget.photos[index],
                photoId: '${widget.title}-${index}-${widget.photos[index].id}',
              ),
            ))
          ],
        ));
  }
}

class _PhotoPoster extends StatelessWidget {
  const _PhotoPoster({super.key, required this.photo, required this.photoId});
  final Photo photo;
  final String photoId;
  @override
  Widget build(BuildContext context) {
    photo.photoId = photoId;
    return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'detail', arguments: photo),
              child: Hero(
                tag: photo.photoId!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage('${photo.thumbnailUrl}.jpg'),
                      width: 130,
                      height: 190,
                      fit: BoxFit.cover),
                ),
              )),
          const SizedBox(height: 5),
          Text(
            photo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]));
  }
}
