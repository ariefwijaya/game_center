import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game_center/widgets/image_placeholder.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageGalleryViewer extends StatefulWidget {
  final List<String> imageUrls;
  final int? initialIndex;
  const ImageGalleryViewer(
      {Key? key, required this.imageUrls, this.initialIndex})
      : super(key: key);

  static Widget memory(
      {required List<Uint8List> imageUrls, final int? initialIndex}) {
    return _MemoryImageGalleryViewer(
        imageList: imageUrls, initialIndex: initialIndex);
  }

  @override
  State<ImageGalleryViewer> createState() => _ImageGalleryViewerState();
}

class _ImageGalleryViewerState extends State<ImageGalleryViewer> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialIndex ?? 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          PhotoViewGallery.builder(
            pageController: controller,
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions.customChild(
                child: Stack(
                  children: [
                    _buildImage(context, widget.imageUrls[index]),
                    Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "${index + 1}",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ))
                  ],
                ),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                minScale: PhotoViewComputedScale.contained * 1,
                maxScale: PhotoViewComputedScale.covered * 1.5,
                heroAttributes: PhotoViewHeroAttributes(
                    tag: "$index ${widget.imageUrls[index]}"),
              );
            },
            itemCount: widget.imageUrls.length,
            loadingBuilder: (context, progress) => Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  value: progress == null || progress.expectedTotalBytes == null
                      ? null
                      : progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!,
                ),
              ),
            ),
          ),
          Positioned(
              top: kToolbarHeight,
              left: 10,
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).shadowColor.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: const AutoLeadingButton()))
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String imageUrl) {
    return Center(
      child: ImagePlaceholder(
        imageUrl: imageUrl,
        imageFit: BoxFit.contain,
      ),
    );
  }
}

class _MemoryImageGalleryViewer extends StatefulWidget {
  final List<Uint8List> imageList;
  final int? initialIndex;
  const _MemoryImageGalleryViewer(
      {Key? key,
      required this.imageList,
      // ignore: unused_element
      this.initialIndex})
      : super(key: key);

  @override
  State<_MemoryImageGalleryViewer> createState() =>
      __MemoryImageGalleryViewerState();
}

class __MemoryImageGalleryViewerState extends State<_MemoryImageGalleryViewer> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.initialIndex ?? 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          PhotoViewGallery.builder(
            pageController: controller,
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions.customChild(
                child: Stack(
                  children: [
                    _buildImage(context, widget.imageList[index]),
                    Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "${index + 1}",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ))
                  ],
                ),
                initialScale: PhotoViewComputedScale.contained * 0.8,
                minScale: PhotoViewComputedScale.contained * 1,
                maxScale: PhotoViewComputedScale.covered * 1.5,
                heroAttributes: PhotoViewHeroAttributes(
                    tag: "$index ${widget.imageList[index].hashCode}"),
              );
            },
            itemCount: widget.imageList.length,
            loadingBuilder: (context, progress) => Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  value: progress == null || progress.expectedTotalBytes == null
                      ? null
                      : progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!,
                ),
              ),
            ),
          ),
          Positioned(
              top: 30,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).shadowColor.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: IconButton(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    onPressed: () {
                      context.popRoute();
                    },
                    icon: const Icon(Icons.close)),
              ))
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, Uint8List image) {
    return Center(child: Image.memory(image));
  }
}
