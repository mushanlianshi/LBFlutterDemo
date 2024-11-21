
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';


/// 自定义顶部header效果的
class LBCustomSliverHeaderPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BltScaffold(
      title: "自定义顶部悬停的效果的",
      child: CustomScrollView(
      slivers: <Widget>[
        // 创建一个固定在页面顶部的 SliverPersistentHeader
        SliverPersistentHeader(
          pinned: true, // 固定在页面顶部
          delegate: _MyHeaderDelegate(),
        ),
        // 添加一个普通的 SliverList
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
                leading: CircleAvatar(child: Text('$index')),
              );
            },
            childCount: 50,
          ),
        ),
      ],
    ),
    );
  }
}




// 定义一个 SliverPersistentHeaderDelegate
class _MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // 计算当前 Header 的高度
    double height = maxExtent - shrinkOffset;

    if (height < minExtent) {
      height = minExtent;
    }

    // 计算当前 Header 的背景颜色
    final double alpha = (maxExtent - height) / (maxExtent - minExtent);
    final Color backgroundColor = Colors.blue.withOpacity(alpha);

    print("LBLog height is ${height}   ${alpha}");

    // 构建 Header
    return Stack(
      fit: StackFit.expand,
      children: [
        // 背景图片
        CachedNetworkImage(imageUrl: 'https://picsum.photos/id/1/800/600', fit: BoxFit.fill),
        // 渐变遮罩层
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                backgroundColor.withOpacity(0.5),
                backgroundColor,
              ],
            ),
          ),
        ),
        // 折叠的内容
        Positioned(
          top: 100 - shrinkOffset,
          left: 16.0,
          right: 16.0,
          child: Opacity(
            opacity: 1 - alpha,
            child: const Text(
              'Header',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200.0; // 最大高度

  @override
  double get minExtent => 50.0; // 最小高度

  @override
  bool shouldRebuild(_MyHeaderDelegate oldDelegate) {
    return false; // 不需要重新构建
  }
}