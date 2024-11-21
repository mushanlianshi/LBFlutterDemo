
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 定义旅游景点类
class TouristAttraction {
  final String name; // 名称
  final String description; // 描述
  final Color color; // 背景色

  TouristAttraction(
      {required this.name, required this.description, required this.color});
}

/// 使用sliver 充满每个页面的
class LBSliverFullPage extends StatelessWidget{

  // 旅游景点列表
  final List<TouristAttraction> attractions = [
    TouristAttraction(
      name: '埃菲尔铁塔',
      description:
      '埃菲尔铁塔是法国巴黎的一座铁塔，位于马斯菲尔德公园（Champ de Mars）内，是巴黎地标之一。铁塔的设计者是古斯塔夫·埃菲尔，铁塔的建造是为了纪念法国大革命一百周年。',
      color: Colors.lightBlue, // 设置该景点的颜色
    ),
    TouristAttraction(
      name: '自由女神像',
      description:
      '自由女神像是位于美国纽约港的一座巨型铜像，是纽约市的象征之一，也是美国和法国友谊的象征。这座雕像是由法国雕塑家弗雷德里克·奥古斯特·巴托尔迪设计并制作，1886年10月28日揭幕。',
      color: Colors.pink, // 设置该景点的颜色
    ),
    TouristAttraction(
      name: '泰姬陵',
      description:
      '泰姬陵是位于印度北部城市阿格拉的一座白色大理石陵墓，于17世纪由莫卧儿帝国皇帝沙贾汗为其逝去的爱妃慕塔芝·马哈尔而建造。泰姬陵被认为是世界上最美的建筑之一。',
      color: Colors.orange, // 设置该景点的颜色
    ),
    TouristAttraction(
      name: '长城',
      description:
      '长城是一道蜿蜒于中国北部的防御工事，由石头、砖头、土坯等材料砌成，是中国古代的一项伟大工程。长城的修建始于公元前7世纪，历经2000多年的修建和扩建，成为了世界上最长的城墙。',
      color: Colors.yellow, // 设置该景点的颜色
    ),
    TouristAttraction(
      name: '比萨斜塔',
      description:
      '比萨斜塔是意大利比萨市的一座独立的钟楼，以其明显的倾斜而闻名于世。斜塔的建造始于12世纪，由于斜塔的基础建设不够坚固，导致了斜塔的倾斜。',
      color: Colors.green, // 设置该景点的颜色
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          /// 可以滑动上去
          const SliverAppBar(
            title: Text('旅游景点'),
            floating: true,
          ),
          /// 使用SliverFillViewport 来充满整个屏幕的
          SliverFillViewport(
            /// 占屏幕高度的多少 1 就是整个屏幕的高度
            viewportFraction: 1,
            delegate: SliverChildBuilderDelegate(
              // 构建子元素
                  (BuildContext context, int index) {
                final attraction = attractions[index];
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  color: attraction.color, // 设置背景色
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        attraction.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        attraction.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: attractions.length,
            ),
          ),
        ],
      ),
    );
  }

}