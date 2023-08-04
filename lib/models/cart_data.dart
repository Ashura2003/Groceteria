class CartItemModel {
  late final String imagePath;
  late final String name;
  late final String price;
  late final int quantity;
  CartItemModel(
      {required this.imagePath, required this.name, required this.price, required this.quantity});
  static final cartItemList = [];
}
