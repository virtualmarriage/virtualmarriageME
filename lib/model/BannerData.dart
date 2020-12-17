class BannerData {
  String id;
  String pic;
  String createdDate;

  BannerData(
      { this.id,
        this.pic,
        this.createdDate});

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
      id: json['id'],
      pic: json['pic'],
      createdDate: json['createdDate'],
    );
  }
}


