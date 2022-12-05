import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:placeholders/models/models.dart';

class PhotoSwiper extends StatelessWidget {
  const PhotoSwiper({super.key, required this.photos});
  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (photos.isEmpty) {
      return SizedBox(
          width: double.infinity,
          height: size.height * 0.5,
          child: const Center(child: CircularProgressIndicator()));
    }

    return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: photos.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.77,
          itemHeight: size.height * 0.42,
          itemBuilder: (context, index) {
            final photo = photos[index];
            photo.photoId = 'swiper-${photo.id}';
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'detail', arguments: photo),
              child: Hero(
                tag: photo.photoId!,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                        placeholder: const AssetImage('assets/no-image.jpg'),
                        image: NetworkImage('${photo.url}.jpg'),
                        fit: BoxFit.fill)),
              ),
            );
          },
        ));
  }
}
