import 'dart:convert';

List<CategoryDataModel> categoriesDataModelFromJson(String str) => List<CategoryDataModel>.from(json.decode(str).map((x) => CategoryDataModel.fromJson(x)));

String categoryDataModelToJson(List<CategoryDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryDataModel {
  final String? slug;
  final String? name;
  final String? url;

  CategoryDataModel({
    this.slug,
    this.name,
    this.url,
  });

  CategoryDataModel copyWith({
    String? slug,
    String? name,
    String? url,
  }) =>
      CategoryDataModel(
        slug: slug ?? this.slug,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) => CategoryDataModel(
        slug: json["slug"] as String?,
        name: json["name"] as String?,
        url: json["url"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "url": url,
      };
}
