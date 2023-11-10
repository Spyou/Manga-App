// Step 3: Define your GraphQL query
const String bannerQuery = '''
  query {
  Page {
    media(type: MANGA status:RELEASING sort: [TRENDING_DESC], isAdult: false) {
      id
      genres
      coverImage {
        large
        extraLarge
      }
      title{
          english
      }
      bannerImage
      description
      type
      isAdult
      updatedAt
    }
  }
}
''';
const String recentlyQuery = '''
  query {
  Page {
    media(type: MANGA   sort: POPULARITY_DESC isAdult: false) {
      id
      genres
      coverImage {
        large
        extraLarge
      }
      title{
          english
      }
      bannerImage
      description
      type
      isAdult
      updatedAt
      chapters
    }
  }
}
''';
const String trendingQuery = '''
  query {
  Page {
    media(type: MANGA status:FINISHED sort: [POPULARITY_DESC] isAdult: false) {
      id
      genres
      coverImage {
        large
        extraLarge
      }
      title{
          english
      }
      bannerImage
      description
      type
      isAdult
      updatedAt
      chapters

    }
  }
}
''';

