import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class BLTAutoScaleCachedNetworkImage extends StatefulWidget{
  final String imageUrl;
  final BoxFit fit;
  double? width;
  double? height;
  BLTAutoScaleCachedNetworkImage({required this.imageUrl, this.fit = BoxFit.cover, this.width, this.height});

  @override
  State<BLTAutoScaleCachedNetworkImage> createState() => _BLTAutoScaleCachedNetworkImageState();

}

class _BLTAutoScaleCachedNetworkImageState extends State<BLTAutoScaleCachedNetworkImage>{
  @override
  Widget build(BuildContext context) {
    var scale = 1;
    if(widget.imageUrl.contains("3x.")){
      scale = 3;
    }else if(widget.imageUrl.contains("2x.")){
      scale = 2;
    }
    return  CachedNetworkImage(
      imageUrl: widget.imageUrl,
      imageBuilder: (context, image){
        image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((image, synchronousCall) {
          if(widget.width != null && widget.width!.toInt() != (image.image.width / scale).toInt()){
              widget.width = (image.image.width/scale).toInt().toDouble();
              widget.height = (image.image.width/scale).toInt().toDouble();
              /// 延迟一下，处理build中重绘的问题
              Future.delayed(Duration(milliseconds: 100), () {
                setState(() {});
              });
          }
          // setState(() {});
        }));
        return Image(image: image);
      },
      fit: BoxFit.contain,
      width: widget.width,
      height: widget.height,
    );
  }

}