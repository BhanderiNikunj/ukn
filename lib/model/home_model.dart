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
  final List<ExtraOption> extraOption;
  final List<Category> category;
  final List<CategoryData> categoryData;

  Datum({
    required this.slider,
    required this.category,
    required this.extraOption,
    required this.categoryData,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        slider: json["slider"] != null
            ? List<SliderData>.from(
                json["slider"].map((x) => SliderData.fromJson(x)))
            : [],
        category: json["category"] != null
            ? List<Category>.from(
                json["category"].map((x) => Category.fromJson(x)))
            : [],
        extraOption: json["extra_option"] != null
            ? List<ExtraOption>.from(
                json["extra_option"].map((x) => ExtraOption.fromJson(x)))
            : [],
        categoryData: json["category"] != null
            ? List<CategoryData>.from(
                json["category_data"].map((x) => CategoryData.fromJson(x)))
            : [],
      );
}

class ExtraOption {
  final String image;
  final String routeName;

  ExtraOption({
    required this.image,
    required this.routeName,
  });

  factory ExtraOption.fromJson(Map<String, dynamic> json) => ExtraOption(
        image: json["image"]?.toString() ?? "",
        routeName: json["route_name"]?.toString() ?? "",
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
