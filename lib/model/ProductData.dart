class ProductData {
  String ID;
  String post_title;
  String post_content;
  String imagename;
  String price;

  ProductData(
      { this.ID,
        this.post_title,
        this.post_content,
        this.imagename,
        this.price});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      ID: json['ID'],
      post_title: json['post_title'],
      post_content: json['post_content'],
      imagename: json['imagename'],
      price: json['price'],
    );
  }
}
