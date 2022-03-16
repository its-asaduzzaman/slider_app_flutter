import 'package:flutter/material.dart';
import 'package:slider_app_flutter/misc/colors.dart';
import 'package:slider_app_flutter/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70.0, left: 20.0),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30.0,
                  color: Colors.black54,
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: AppLargeText(text: 'Discover'),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4.0),
                tabs: const [
                  Tab(text: 'Places'),
                  Tab(
                    text: 'Inspiration',
                  ),
                  Tab(
                    text: 'Emotions',
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            height: 300.0,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15.0, top: 10.0),
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("img/mountain.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Text('There'),
                Text('Bye'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
