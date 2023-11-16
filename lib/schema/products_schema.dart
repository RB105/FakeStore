class ProductSchema {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductSchema(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  ProductSchema.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null
        ? Rating.fromJson(json['rating'])
        : Rating(count: 0, rate: 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['title'] = title ?? "";
    data['price'] = price ?? "";
    data['description'] = description ?? "";
    data['category'] = category ?? "";
    data['image'] = image ?? "";
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] ?? 0;
    count = json['count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
