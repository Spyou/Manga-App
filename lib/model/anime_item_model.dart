class   AnimeSmallModel {
  AnimeSmallModel({
      num? id,
      List<String>? genres,
      CoverImage? coverImage,
      Title? title,
      String? description,
      String? type,
      bool? isAdult,
      num? updatedAt,
    num? chapters,}){
    _id = id;
    _genres = genres;
    _coverImage = coverImage;
    _title = title;
    _description = description;
    _type = type;
    _isAdult = isAdult;
    _updatedAt = updatedAt;
    _chapters = chapters;
}

  AnimeSmallModel.fromJson(dynamic json) {
    _id = json['id'];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    _coverImage = json['coverImage'] != null ? CoverImage.fromJson(json['coverImage']) : null;
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
    _description = json['description'];
    _type = json['type'];
    _isAdult = json['isAdult'];
    _updatedAt = json['updatedAt'];
    _chapters = json['chapters']??"";
  }
  num? _id;
  List<String>? _genres;
  CoverImage? _coverImage;
  Title? _title;
  String? _description;
  String? _type;
  dynamic? _chapters;
  bool? _isAdult;
  num? _updatedAt;
  AnimeSmallModel copyWith({  num? id,
  List<String>? genres,
  CoverImage? coverImage,
  Title? title,
  String? bannerImage,
  String? description,
  String? type,
    dynamic? chapters,
  bool? isAdult,
  num? updatedAt,
}) => AnimeSmallModel(  id: id ?? _id,
  genres: genres ?? _genres,
  coverImage: coverImage ?? _coverImage,
  title: title ?? _title,
  description: description ?? _description,
  type: type ?? _type,
  isAdult: isAdult ?? _isAdult,
  updatedAt: updatedAt ?? _updatedAt,
  chapters: chapters ?? _chapters,
);
  num? get id => _id;
  List<String>? get genres => _genres;
  CoverImage? get coverImage => _coverImage;
  Title? get title => _title;
  String? get description => _description;
  String? get type => _type;
  num? get chapters => _chapters;
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