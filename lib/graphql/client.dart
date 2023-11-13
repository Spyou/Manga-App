import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:manga_app/graphql/querys.dart';
import 'package:manga_app/model/anime_item_model.dart';
import 'package:manga_app/model/banner_model.dart';

class ApiService {
  final client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink(
      'https://graphql.anilist.co',
    ),
  );

  Future<List<BannerData>> getBanners() async {
    var result = await client.query(QueryOptions(document: gql(bannerQuery)));
    if (result.hasException) {
      print("asdasda : : :${result.exception!.raw}");
      print(result.exception?.raw.toString());
      return []; // uzingiz hohlagan erroringizni yozib qo`yishingiz mumkin
    } else {
      final data = result.data;

      if (data != null && data['Page'] != null) {
        final List<dynamic> mediaList = data['Page']['media'];

        final List<BannerData> banners = List<BannerData>.from(
            mediaList.map((item) => BannerData.fromJson(item)));
        print(result.data.toString());

        return banners;
      } else {
        return [];
      }
    }
  }

  Future<List<AnimeSmallModel>> getRecentlyList() async {
    var result = await client.query(QueryOptions(document: gql(recentlyQuery)));
    if (result.hasException) {
      print("asdasda : : :${result.exception!.raw.toString()}");
      print("asdasda : : :${result.exception.toString()}");
      return []; // uzingiz hohlagan erroringizni yozib qo`yishingiz mumkin
    } else {
      final data = result.data;

      if (data != null && data['Page'] != null) {
        final List<dynamic> mediaList = data['Page']['media'];

        final List<AnimeSmallModel> popularList = List<AnimeSmallModel>.from(
            mediaList.map((item) => AnimeSmallModel.fromJson(item)));
        print(result.data.toString());

        return popularList;
      } else {
        return [];
      }
    }
  }

  Future<List<AnimeSmallModel>> getTrendingList() async {
    var result = await client.query(QueryOptions(document: gql(trendingQuery)));
    if (result.hasException) {
      print("asdasda : : :${result.exception!.raw.toString()}");
      print("asdasda : : :${result.exception.toString()}");
      return []; // uzingiz hohlagan erroringizni yozib qo`yishingiz mumkin
    } else {
      final data = result.data;

      if (data != null && data['Page'] != null) {
        final List<dynamic> mediaList = data['Page']['media'];

        final List<AnimeSmallModel> popularList = List<AnimeSmallModel>.from(
            mediaList.map((item) => AnimeSmallModel.fromJson(item)));
        print(result.data.toString());

        return popularList;
      } else {
        return [];
      }
    }
  }
}
