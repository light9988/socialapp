import 'package:flutter/material.dart';
import 'package:xhs/constants/color_plate.dart';
import 'package:xhs/models/card_data.dart';
import 'package:get/get.dart';

import 'mine_controller.dart';

class MinePage extends StatelessWidget {
  MinePage({Key? key}) : super(key: key);
  final MineController controller = Get.put(MineController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              // SliverAppBar(
              //   floating: false,
              //   pinned: true,
              //   title: Text("ddd"),
              // ),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverToBoxAdapter(child: _buildHeader()),
              ),

              /// SliverPersistentHeader 的功能是当滑动到 CustomScrollView 的顶部时，可以将组件固定在顶部
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate.fixedHeight(
                  height: 40,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: TabBar(
                        isScrollable: true,
                        padding: const EdgeInsets.only(top: 10),
                        labelColor: Colors.black,
                        dividerColor: Colors.transparent,
                        indicatorColor: ColorPlate.primary,
                        controller: controller.tabController,
                        tabs: const [
                          Tab(text: "Posts"),
                          Tab(
                              icon: Row(children: [
                            Icon(Icons.lock, size: 16),
                            Text("Collects")
                          ])),
                          Tab(text: "likes"),
                        ]),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(controller: controller.tabController, children: [
            Builder(builder: (context) {
              return CustomScrollView(
                key: const PageStorageKey<String>("Posts"),
                slivers: <Widget>[
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverToBoxAdapter(child: buildDiscoverPage()),
                ],
              );
            }),
            const Center(child: Text("You haven't collected any posts yet")),
            const Center(child: Text("You haven't liked any posts yet")),
          ]),
        ),
      ),
    );
  }

  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }

  Widget _buildHeader() {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          // Image.network(
          //   "https://unsplash.com/photos/landscape-photo-of-new-york-empire-state-building-5omwAMDxmkU.jpeg",
          Image.asset(
            "assets/images/bg.png",
            width: Get.width,
            height: 250,
            fit: BoxFit.cover,
            // errorBuilder: (_, __, ___) => Image.asset(
            //   "assets/images/bg.png",
            //   width: Get.width,
            //   height: 220,
            //   fit: BoxFit.cover,
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colors.white),
                    Image.asset(
                      "assets/images/bg.png",
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              // child: Image.network(
                              //   "https://www.google.com/search?sca_esv=a7c4cc63e26e5a70&sxsrf=ACQVn09p83XOirj-UkEmmkn7EzgmRxKNRg:1709343558776&q=taylor+swift&tbm=isch&source=lnms&sa=X&ved=2ahUKEwiptvr8uNSEAxV3AjQIHT7cDTYQ0pQJegQIDRAB&biw=1440&bih=669&dpr=2#imgrc=G5JeSalK0CY9tM.jpeg",
                              child: Image.asset(
                                "assets/images/profile.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  "Amy",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Text("ID：123456789",
                                  style: TextStyle(color: ColorPlate.grey)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Text("App Developer | Actor",
                    style: TextStyle(color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(), color: ColorPlate.black6),
                        child: const Text("Lion",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(), color: ColorPlate.black6),
                        child: const Text("United States",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    // const Expanded(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                              Text("Following",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text("300K",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                              Text("Followers",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text("500K",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                              Text("Likes&Col",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          ),
                        ],
                      ),
                    // ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.white)),
                            ),
                            child: const Text("Profile",
                                style: TextStyle(color: Colors.white)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.white)),
                            ),
                            child: Image.asset(
                              "assets/images/setting.png",
                              width: 17,
                              height: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDiscoverPage() {
    return Column(
      // physics: NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.zero,
      children: [
        Row(
          children: [
            Column(
              children: controller.data.map((e) => buildCardItem(e)).toList(),
            ),
            Column(
              children: controller.data.reversed
                  .map((e) => buildCardItem(e))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCardItem(CardData cardData) {
    return GestureDetector(
      onTap: () {
        controller.openIndexDetailPage(cardData.id);
      },
      child: Container(
        width: (Get.width / 2) - 8,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.network(
                cardData.cover,
                width: Get.width / 2,
                height: Get.width / 2 + 30,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text(cardData.content,
                  maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(cardData.avatar,
                        width: 20, height: 20, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(cardData.nickname),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/like.png", width: 20),
                  Text(cardData.fav.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  // child 为 header
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  //最大和最小高度相同
  SliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  //需要自定义builder时使用
  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    //测试代码：如果在调试模式，且子组件设置了key，则打印日志
    assert(() {
      if (child.key != null) {
        print('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    // 让 header 尽可能充满限制的空间；宽度为 Viewport 宽度，
    // 高度随着用户滑动在[minHeight,maxHeight]之间变化。
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverHeaderDelegate old) {
    return old.maxExtent != maxExtent || old.minExtent != minExtent;
  }
}
