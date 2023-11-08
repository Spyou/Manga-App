import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:manga_app/graphql/querys.dart';
import 'package:manga_app/model/banner_model.dart';

import '../blocs/home_bloc/home_bloc.dart';

class ApiService {
  final client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink(
      'https://graphql.anilist.co',
    ),
  );

  Future<HomeState> getBanners() async {
    var result = await client.query(QueryOptions(document: gql(bannerQuery)));
    if (result.hasException) {
      print(result.exception?.raw.toString());
      return ErrorLoad(
          error: result.exception?.raw.toString() ??
              "Error loaded"); // uzingiz hohlagan erroringizni yozib qo`yishingiz mumkin
    } else {
      final data = result.data;

      if (data != null && data['Page'] != null) {
        final List<dynamic> mediaList = data['Page']['media'];

        final List<BannerMedia> banners = List<BannerMedia>.from(
            mediaList.map((item) => BannerMedia.fromJson(item)));
        print(result.data.toString());

        return HomeBannerListResult(list: banners);
      } else {
        return ErrorLoad(error: "List Null");
      }
    }
  }
}
