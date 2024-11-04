import 'dart:convert';

List<CategoriesDataModel> categoriesDataModelFromJson(String str) =>
    List<CategoriesDataModel>.from(json.decode(str).map((x) => CategoriesDataModel.fromJson(x)));

String categoriesDataModelToJson(List<CategoriesDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesDataModel {
  final String? slug;
  final String? name;
  final String? url;

  CategoriesDataModel({
    this.slug,
    this.name,
    this.url,
  });

  CategoriesDataModel copyWith({
    String? slug,
    String? name,
    String? url,
  }) =>
      CategoriesDataModel(
        slug: slug ?? this.slug,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) => CategoriesDataModel(
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
