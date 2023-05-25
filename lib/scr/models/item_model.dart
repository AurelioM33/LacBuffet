class ItemModel {
  String itemname;
  String imfUrl;
  String unit;
  double price;
  String description;

  ItemModel({
    required this.description,
    required this.imfUrl,
    required this.unit,
    required this.price,
    required this.itemname,
  });
}
