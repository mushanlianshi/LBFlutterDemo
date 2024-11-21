
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';

/// 顶部折叠效果的
class LBSliverOverlapHeaderPage extends StatelessWidget{
  const LBSliverOverlapHeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                centerTitle: false,
                // leading: SizedBox(),
                // leadingWidth: 0,
                title: Text("header title"),
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                // FlexibleSpaceBar 是 Flutter 中的一个组件，它通常与 SliverAppBar 结合使用，用于创建具有弹性空间的应用程序栏，这个弹性空间可以根据滚动位置的变化而变化
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(imageUrl: "https://picsum.photos/400/200", fit: BoxFit.cover),
                  // background: Image.network('https://picsum.photos/400/200',
                  //     fit: BoxFit.cover),
                ),
              ),
            ];
          },
          body: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverOverlapAbsorber(
                    handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return ListTile(
                            title: Text('列表项 #$index'),
                          );
                        },
                        childCount: 50,
                      ),
                    ),
                  ),
                  SliverOverlapInjector(
                    handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  ),
                ],
              );
            },
          ),
        )
    );
  }

}