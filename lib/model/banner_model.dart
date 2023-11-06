class BannerMedia {
  BannerMedia({
      num? id,
      List<String>? genres,
      CoverImage? coverImage,
      Title? title,
      String? bannerImage,
      String? description,
      String? type,
      bool? isAdult,
      num? updatedAt,}){
    _id = id;
    _genres = genres;
    _coverImage = coverImage;
    _title = title;
    _bannerImage = bannerImage;
    _description = description;
    _type = type;
    _isAdult = isAdult;
    _updatedAt = updatedAt;
}

  BannerMedia.fromJson(dynamic json) {
    _id = json['id'];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    _coverImage = json['coverImage'] != null ? CoverImage.fromJson(json['coverImage']) : null;
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _bannerImage = json['bannerImage'];
    _description = json['description'];
    _type = json['type'];
    _isAdult = json['isAdult'];
    _updatedAt = json['updatedAt'];
  }
  num? _id;
  List<String>? _genres;
  CoverImage? _coverImage;
  Title? _title;
  String? _bannerImage;
  String? _description;
  String? _type;
  bool? _isAdult;
  num? _updatedAt;
BannerMedia copyWith({  num? id,
  List<String>? genres,
  CoverImage? coverImage,
  Title? title,
  String? bannerImage,
  String? description,
  String? type,
  bool? isAdult,
  num? updatedAt,
}) => BannerMedia(  id: id ?? _id,
  genres: genres ?? _genres,
  coverImage: coverImage ?? _coverImage,
  title: title ?? _title,
  bannerImage: bannerImage ?? _bannerImage,
  description: description ?? _description,
  type: type ?? _type,
  isAdult: isAdult ?? _isAdult,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  List<String>? get genres => _genres;
  CoverImage? get coverImage => _coverImage;
  Title? get title => _title;
  String? get bannerImage => _bannerImage;
  String? get description => _description;
  String? get type => _type;
  bool? get isAdult => _isAdult;
  num? get updatedAt => _updatedAt;

}


class Title {
  Title({
      String? english,}){
    _english = english;
}

  Title.fromJson(dynamic json) {
    _english = json['english'];
  }
  String? _english;
Title copyWith({  String? english,
}) => Title(  english: english ?? _english,
);
  String? get english => _english;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english'] = _english;
    return map;
  }

}


class CoverImage {
  CoverImage({
      required String? large,
      required String? extraLarge,}){
    _large = large;
    _extraLarge = extraLarge;
}

  CoverImage.fromJson(dynamic json) {
    _large = json['large'];
    _extraLarge = json['extraLarge'];
  }
  String? _large;
  String? _extraLarge;
CoverImage copyWith({  String? large,
  String? extraLarge,
}) => CoverImage(  large: large ?? _large,
  extraLarge: extraLarge ?? _extraLarge,
);
  String? get large => _large;
  String? get extraLarge => _extraLarge;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['large'] = _large;
    map['extraLarge'] = _extraLarge;
    return map;
  }

}