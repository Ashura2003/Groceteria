import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceteria_app/widgets/app_large_text.dart';

import '../misc/AppColors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 70,left: 20),
            child: Row(
              children: [
                Icon(Icons.menu,size:15, color: Colors.black87,),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.35)
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40,),
          //dicover Text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(height: 30,),
          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 30,right: 30),
                controller: _tabController,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                // indicator: CircleTabIndicator(color: AppColors.mainColor,radius: 4),
                tabs: [
                  Tab(text:"For you"),
                  Tab(text: "Discounts"),
                  Tab(text: "Necessary Goods")

                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount:3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                  return
                    Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                    image: AssetImage(
                    "img/tamatar.jpg"
                    ),
                    fit:BoxFit.cover
                    )
                    ),

                    );
                  },

                ),
                Text("Sup"),
                Text("Bye"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class CircleTabIndicator extends Decoration{
//   final Color color;
//   double radius;
//   CircleTabIndicator({required this.color, required this.radius});
//
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     // TODO: implement createBoxPainter
//     throw _CirclePainter(color: color, radius:radius);
//     }
//
//
// }
//
// class _CirclePainter extends BoxPainter{
//   final Color color;
//   double radius;
//   _CirclePainter({required this.color, required this.radius});
//
//   @override
//   void paint(Canvas canvas, Offset offset,
//       ImageConfiguration configuration) {
//
//     Paint _paint=Paint();
//     _paint.color=color;
//     _paint.isAntiAlias=true;
//
//     final Offset circleOffset=Offset(configuration.size!.width/2, 0);
//     canvas.drawCircle(offset+circleOffset, radius, _paint);
//   }
//
// }
