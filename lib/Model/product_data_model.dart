import 'dart:convert';

ProductDataModel? productDataModelFromJson(String str) =>
    ProductDataModel.fromJson(json.decode(str));

String productDataModelToJson(ProductDataModel? data) =>
    json.encode(data?.toJson());

class ProductDataModel {
  final List<Product?>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductDataModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  ProductDataModel copyWith({
    List<Product?>? products,
    int? total,
    int? skip,
    int? limit,
  }) =>
      ProductDataModel(
        products: products ?? this.products,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        products: json["products"] == null
            ? null
            : List<Product?>.from(
                json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x?.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final ShippingInformation? shippingInformation;
  final AvailabilityStatus? availabilityStatus;
  final List<Review>? reviews;
  final ReturnPolicy? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    ShippingInformation? shippingInformation,
    AvailabilityStatus? availabilityStatus,
    List<Review>? reviews,
    ReturnPolicy? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        price: price ?? this.price,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        rating: rating ?? this.rating,
        stock: stock ?? this.stock,
        tags: tags ?? this.tags,
        brand: brand ?? this.brand,
        sku: sku ?? this.sku,
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        warrantyInformation: warrantyInformation ?? this.warrantyInformation,
        shippingInformation: shippingInformation ?? this.shippingInformation,
        availabilityStatus: availabilityStatus ?? this.availabilityStatus,
        reviews: reviews ?? this.reviews,
        returnPolicy: returnPolicy ?? this.returnPolicy,
        minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
        meta: meta ?? this.meta,
        images: images ?? this.images,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"] == null
            ? null
            : shippingInformationValues.map[json["shippingInformation"]],
        availabilityStatus: json["availabilityStatus"] == null
            ? null
            : availabilityStatusValues.map[json["availabilityStatus"]],
        reviews: json["reviews"] == null
            ? null
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        returnPolicy: json["returnPolicy"] == null
            ? null
            : returnPolicyValues.map[json["returnPolicy"]],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation == null
            ? null
            : shippingInformationValues.reverse[shippingInformation],
        "availabilityStatus": availabilityStatus == null
            ? null
            : availabilityStatusValues.reverse[availabilityStatus],
        "reviews": reviews == null
            ? null
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "returnPolicy": returnPolicy == null
            ? null
            : returnPolicyValues.reverse[returnPolicy],
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toJson(),
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail,
      };
}

enum AvailabilityStatus { inStock, lowStock, outOfStock }

final availabilityStatusValues = EnumValues({
  "In Stock": AvailabilityStatus.inStock,
  "Low Stock": AvailabilityStatus.lowStock,
  "Out of Stock": AvailabilityStatus.outOfStock
});

class Dimensions {
  final double? width;
  final double? height;
  final double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  Dimensions copyWith({
    double? width,
    double? height,
    double? depth,
  }) =>
      Dimensions(
        width: width ?? this.width,
        height: height ?? this.height,
        depth: depth ?? this.depth,
      );

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Meta {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  Meta copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) =>
      Meta(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        barcode: barcode ?? this.barcode,
        qrCode: qrCode ?? this.qrCode,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

enum ReturnPolicy {
  NO_RETURN_POLICY,
  THE_30_DAYS_RETURN_POLICY,
  THE_90_DAYS_RETURN_POLICY
}

final returnPolicyValues = EnumValues({
  "30-Days Return Policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
  "90-Days Return Policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY,
  "No Return Policy": ReturnPolicy.NO_RETURN_POLICY
});

class Review {
  final String? reviewer;
  final double? rating;
  final String? comment;

  Review({
    this.reviewer,
    this.rating,
    this.comment,
  });

  Review copyWith({
    String? reviewer,
    double? rating,
    String? comment,
  }) =>
      Review(
        reviewer: reviewer ?? this.reviewer,
        rating: rating ?? this.rating,
        comment: comment ?? this.comment,
      );

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewer: json["reviewer"],
        rating: json["rating"]?.toDouble(),
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "reviewer": reviewer,
        "rating": rating,
        "comment": comment,
      };
}

enum ShippingInformation { EXPRESS, FREE_SHIPPING, STANDARD }

final shippingInformationValues = EnumValues({
  "Express": ShippingInformation.EXPRESS,
  "Free Shipping": ShippingInformation.FREE_SHIPPING,
  "Standard": ShippingInformation.STANDARD
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
