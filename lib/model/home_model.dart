class HomeModel {
  final bool status;
  final String message;
  final Datum data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        message: json["message"],
        data: Datum.fromJson(json["data"]),
      );
}

class Datum {
  final List<SliderData> slider;
  final List<Category> category;
  final List<CategoryData> categoryData;

  Datum({
    required this.slider,
    required this.category,
    required this.categoryData,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        slider:
            List<SliderData>.from(json["slider"].map((x) => SliderData.fromJson(x))),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        categoryData: List<CategoryData>.from(
            json["category_data"].map((x) => CategoryData.fromJson(x))),
      );
}

class Category {
  final int id;
  final String name;
  final String imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: int.tryParse(json["id"]?.toString() ?? "") ?? 0,
        name: json["name"]?.toString() ?? "",
        imageUrl: json["image_url"]?.toString() ?? "",
      );
}

class CategoryData {
  final int id;
  final String name;
  final String imageUrl;
  final String videoUrl;
  final int categoryId;

  CategoryData({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.videoUrl,
    required this.categoryId,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: int.tryParse(json["id"]?.toString() ?? "") ?? 0,
        name: json["name"]?.toString() ?? "",
        imageUrl: json["image_url"]?.toString() ?? "",
        videoUrl: json["video_url"]?.toString() ?? "",
        categoryId: int.tryParse(json["category_id"]?.toString() ?? "") ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "video_url": videoUrl,
        "category_id": categoryId,
      };
}

class SliderData {
  final String id;
  final String name;
  final String imageUrl;

  SliderData({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
        id: json["id"]?.toString() ?? "",
        name: json["name"]?.toString() ?? "",
        imageUrl: json["image_url"]?.toString() ?? "",
      );
}
