import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class MyCachedImage extends StatelessWidget {
  const MyCachedImage({super.key, required this.url, this.isCircle = false, this.fit = BoxFit.cover});

  final String url;
  final bool isCircle;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url.isNotEmpty ? url : 'https://via.placeholder.com/150', // ✅ صورة افتراضية إذا كان الرابط فارغًا
      fit: fit,
      imageBuilder: isCircle
          ? (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          : null,
      placeholder: (context, url) => const Center(
        child: SpinKitSpinningLines(color: ColorManager.colorButtonSign, size: 50), // ✅ يظهر أثناء تحميل الصورة
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red), // ✅ يظهر عند فشل التحميل
    );
  }
}
