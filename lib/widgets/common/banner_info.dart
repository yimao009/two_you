import 'package:flutter/material.dart';

/// banner 展示组件
///
/// 只需要传入需要展示的 [bannerImage]
class BannerInfo extends StatelessWidget {
  final String bannerImage;

  const BannerInfo({Key? key, required this.bannerImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BannerInfo build');
    return Row(
      children: [
        Image.network(
          bannerImage,
          width: MediaQuery.of(context).size.width,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Container(
              color: Colors.red,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: const Text('😢'),
              ),
            );
          },
        )
      ],
    );
  }
}
