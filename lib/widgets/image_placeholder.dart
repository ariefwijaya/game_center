import 'package:game_center/main.import.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagePlaceholder extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? imageFit;
  final ImageProvider<Object>? assetsPlaceholder;
  final bool noPlaceholder;
  final Color? colorize;
  const ImagePlaceholder(
      {Key? key,
      this.height,
      this.width,
      this.imageUrl,
      this.borderRadius,
      this.shape = BoxShape.rectangle,
      this.imageFit = BoxFit.cover,
      this.assetsPlaceholder,
      this.noPlaceholder = false,
      this.colorize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        useOldImageOnUrlChange: true,
        placeholder: (context, url) => _buildPlaceholder(context),
        imageBuilder: (context, imageProvider) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                shape: shape,
                borderRadius: borderRadius,
                image: DecorationImage(
                    fit: imageFit,
                    image: imageProvider,
                    colorFilter: colorize == null
                        ? null
                        : ColorFilter.mode(colorize!, BlendMode.srcIn)))),
        errorWidget: (context, url, error) => _buildPlaceholder(context),
      );
    } else {
      return _buildPlaceholder(context);
    }
  }

  BorderRadiusGeometry? placeHolderBorderRadius() {
    if (shape == BoxShape.circle || borderRadius != null) {
      return borderRadius;
    } else {
      return BorderRadius.circular(8);
    }
  }

  Widget _buildPlaceholder(BuildContext context) {
    if (noPlaceholder) {
      return SizedBox(
        height: height,
        width: width,
      );
    }
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: shape,
          borderRadius: placeHolderBorderRadius(),
          image: DecorationImage(
              fit: imageFit,
              image: assetsPlaceholder ??
                  AssetImage(Assets.images.squarePlaceholder.path))),
    );
  }
}
