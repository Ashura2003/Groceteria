// import 'package:flutter/material.dart';
// import '../models/vegetable_data.dart';
// import '../widgets/vegetable_card.dart';
//
// class VegetablesScreen extends StatelessWidget {
//   const VegetablesScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Vegetables",
//           style: TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () => Navigator.pop(context),
//           child: Image.asset(
//             "assets/images/back_icon.png",
//             scale: 2.2,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 1,
//             mainAxisSpacing: 1,
//             mainAxisExtent: 230,
//           ),
//           itemBuilder: (context, index) {
//             return VegetableCardWidget(
//               imagePath: VegetableItemModel.vegetableItemList[index].imagePath,
//               name: VegetableItemModel.vegetableItemList[index].name,
//               price: VegetableItemModel.vegetableItemList[index].price,
//               onTapCallback: () {},
//             );
//           },
//           itemCount: VegetableItemModel.vegetableItemList.length,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/vegetable_data.dart';
import '../widgets/vegetable_card.dart';

class VegetablesScreen extends StatefulWidget {
  const VegetablesScreen({Key? key}) : super(key: key);

  @override
  _VegetablesScreenState createState() => _VegetablesScreenState();
}

class _VegetablesScreenState extends State<VegetablesScreen> {
  bool sortAscending = true;

  void toggleSortOrder() {
    setState(() {
      sortAscending = !sortAscending;
    });
  }

  List<VegetableItemModel> getSortedVegetableItems() {
    List<VegetableItemModel> items = List.from(VegetableItemModel.vegetableItemList);
    items.sort((a, b) {
      if (sortAscending) {
        return a.price.compareTo(b.price);
      } else {
        return b.price.compareTo(a.price);
      }
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Vegetables",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(
            "assets/images/back_icon.png",
            scale: 2.2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: toggleSortOrder,
            icon: Icon(Icons.sort ,color: Colors.black,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            mainAxisExtent: 230,
          ),
          itemBuilder: (context, index) {
            final sortedItems = getSortedVegetableItems();
            return VegetableCardWidget(
              imagePath: sortedItems[index].imagePath,
              name: sortedItems[index].name,
              price: sortedItems[index].price,
              onTapCallback: () {},
            );
          },
          itemCount: VegetableItemModel.vegetableItemList.length,
        ),
      ),
    );
  }
}

