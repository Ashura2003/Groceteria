import 'package:flutter/material.dart';
import '../models/cart_data.dart';

class CartItemWidget extends StatefulWidget {
  final CartItemModel item;
  final void Function(CartItemModel item) onRemove; // Add this line

  const CartItemWidget({Key? key, required this.item, required this.onRemove}) : super(key: key);


  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int itemCount = 0;

  @override
  void initState() {
    super.initState();
    itemCount = widget.item.quantity;
  }
  void removeItemFromCart() {
    setState(() {
      // Call the onRemove function and pass the item to be removed
      widget.onRemove(widget.item);
    });
  }
  @override
  Widget build(BuildContext context) {
    // itemCount = widget.item.quantity;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image.asset(
            widget.item.imagePath,
            width: 40,
            height: 40,
          )),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(widget.item.price,
                    style: TextStyle(
                        color: Color(0xffFF324B),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                InkWell(
                  onTap: (() {
                    setState(() {
                      itemCount++;
                    });
                  }),
                  child: Image.asset(
                    "assets/images/add_icon.png",
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "$itemCount",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (itemCount > 0) itemCount--;
                    });
                  },
                  child: Image.asset(
                    "assets/images/remove_icon.png",
                    width: 24,
                    height: 24,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                InkWell(
                  onTap: () {
                    removeItemFromCart();
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
