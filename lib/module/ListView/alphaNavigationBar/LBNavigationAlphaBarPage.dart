
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';

class LBNavigationAlphaBarPage extends StatefulWidget {
  const LBNavigationAlphaBarPage({super.key});

  @override
  State<LBNavigationAlphaBarPage> createState() =>
      _LBNavigationAlphaBarPageState();
}

class _LBNavigationAlphaBarPageState
    extends State<LBNavigationAlphaBarPage> {
  double _scrollDistance = 0.0;
  final double _imageShowHeight = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            Positioned(
              // top设置成负的，保证拉伸图片，图片高度不变的
               top: _scrollDistance < 0 ? min(_scrollDistance, 0) : 0,
                left: 0,bottom: 0,right: 0,
                child: _scrollListWidget(),
            ),
          Positioned(
              left: 0, right: 0, top: 0,
              child: CustomNavBar(
              scrollDistance: _scrollDistance,
              imageShowHeight: _imageShowHeight)),
        ],
      ),
    );
      return _listWidget2();
  }

  _listWidget2(){
    return Scaffold(
      body: Stack(
        children: [
            Positioned(
              left: 0,top: 0,right: 0,bottom: 0,
                child: _scrollListWidget()
            ),
          CustomNavBar(
              scrollDistance: _scrollDistance,
              imageShowHeight: _imageShowHeight)
        ],
      ).intoContainer(color: Colors.blue),
    );
  }


  _listWidget(){
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;

    return RefreshIndicator(
      onRefresh: () async {
        return Future.delayed(Duration(seconds: 1), () {
          print("刷新了======");
        });
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: _scrollDistance < 0 ? min(_scrollDistance, 0) : 0,
              // top: 0,
              bottom: 0,
              right: 0,
              child: Scaffold(
                body: _scrollListWidget(),
              ),
            ),
            CustomNavBar(
                scrollDistance: _scrollDistance,
                imageShowHeight: _imageShowHeight),
          ],
        ),
      ),
    );
  }

  _scrollListWidget(){
    return NotificationListener(
      onNotification:
          (ScrollUpdateNotification scrollNotification) {
        if (scrollNotification.depth == 0) {
          // print(scrollNotification.metrics.pixels);
          setState(() {
            _scrollDistance = scrollNotification.metrics.pixels;
          });
        }
        return false;
      },
      child: CustomScrollView(
        // physics: ClampingScrollPhysics(),
        slivers: [
          // const SliverToBoxAdapter(),
          //sliver很奇怪 会把最上面的那个悬浮，所以这里加一个空widgit使图片跟着下拉
          SliverPersistentHeader(
            delegate: MyDelegate(
              //当下拉的时候_scrollDistance为负数 要图片放大 图片高度就是： maxHeight - _scrollDistance
              //当上划的时候 图片高度不变 直接使用：maxHeight
              imageShowHeight: _scrollDistance < 0
                  ? (_imageShowHeight - _scrollDistance)
                  : _imageShowHeight,
              imgUrl:
              "https://picsum.photos/400/200",
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, index) {
              return Text("data: $index");
            }, childCount: 100),
          )
        ],
      ),
    );
  }

}

class CustomNavBar extends StatelessWidget {
  final double scrollDistance;
  final double imageShowHeight;

  const CustomNavBar({
    super.key,
    required this.scrollDistance,
    required this.imageShowHeight,
  });

  @override
  Widget build(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;

    //滚动距离是 0 滑到导航栏的高度, 这边做下渐变  如果距离小于0  那就直接设置透明度为0
    final percent = scrollDistance > 0.0
        ? min(scrollDistance, imageShowHeight - navHeight) /
        (imageShowHeight - navHeight)
        : 0.0;
    debugPrint("LBLog navHeight is ${navHeight}");
    debugPrint("LBLog scrollDistance is ${scrollDistance}");
    debugPrint("LBLog percent is ${percent}");
    //print("percent: $percent, distance: $_scrollDistance, height: ${_imageShowHeight - navHeight}");

    return SizedBox(
      height: navHeight,
      child: AppBar(
        elevation: 0,
        title: const Text("这里是标题"),
        backgroundColor: Colors.red.withAlpha((percent * 255).toInt()),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  final double imageShowHeight;
  final String imgUrl;

  MyDelegate({
    required this.imageShowHeight,
    required this.imgUrl,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Image.network(
      imgUrl,
      fit: BoxFit.cover,
      height: imageShowHeight,
    );
  }

  @override
  double get maxExtent => imageShowHeight;

  @override
  double get minExtent => imageShowHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}