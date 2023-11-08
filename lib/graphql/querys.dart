// Step 3: Define your GraphQL query
const String bannerQuery = '''
  query {
  Page {
    media(type: MANGA) {
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
