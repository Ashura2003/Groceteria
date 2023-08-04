class VegetableItemModel {
  late final String imagePath;
  late final String name;
  late final String price;

  VegetableItemModel({
    required this.imagePath,
    required this.name,
    required this.price,
  });

  static final List<VegetableItemModel> vegetableItemList = [
    VegetableItemModel(
      imagePath: "assets/images/pepper_red.png",
      name: "Red Pepper",
      price: "1kg, 2\$",
    ),
    VegetableItemModel(
      imagePath: "assets/images/butternut.png",
      name: "Butternut Squash",
      price: "1kg, 6\$",
    ),
    VegetableItemModel(
      imagePath: "assets/images/ginger.png",
      name: "Ginger",
      price: "1kg, 4\$",
    ),
    VegetableItemModel(
      imagePath: "assets/images/carrots.png",
      name: "Carrots",
      price: "1kg, 1\$",
    ),
  ];

  static List<VegetableItemModel> sortItemsByPrice(bool ascending) {
    List<VegetableItemModel> sortedList = List.from(vegetableItemList);
    sortedList.sort((a, b) {
      double priceA = double.parse(a.price.replaceAll('\$', ''));
      double priceB = double.parse(b.price.replaceAll('\$', ''));
      return ascending ? priceA.compareTo(priceB) : priceB.compareTo(priceA);
    });
    return sortedList;
  }
}
