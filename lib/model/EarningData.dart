class EarningData {
  String ID;
  String post_title;
  String post_content;
  String imagename;
  String price;

  EarningData(
      { this.ID,
        this.post_title,
        this.post_content,
        this.imagename,
        this.price});

  factory EarningData.fromJson(Map<String, dynamic> json) {
    return EarningData(
      ID: json['ID'],
      post_title: json['post_title'],
      post_content: json['post_content'],
      imagename: json['imagename'],
      price: json['price'],
    );
  }
}
