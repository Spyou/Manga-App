class MangaModel {
  String? imageAsset;
  String? genreName;
  String? movieRating;
  String? year;
  final List<Map>? cast;
  final List<Map>? comments;
  MangaModel(
      {this.imageAsset,
      this.genreName,
      this.movieRating,
      this.year,
      this.comments,
      this.cast});
}

// data
final trending = [
  MangaModel(
      imageAsset: "assets/genre_image_1.jpeg",
      year: '2023 . 1 seasons . Shonen',
      genreName: 'One Piece'),
  MangaModel(
      imageAsset: "assets/genre_image_2.jpeg",
      year: '1999 . 2 seasons . Shonen',
      genreName: 'Jujutsu Kaisen S2'),
  MangaModel(
      imageAsset: "assets/genre_image_3.jpeg",
      year: '2023 . 3 seasons . Shonen',
      genreName: 'Gintama'),
  MangaModel(
      imageAsset: "assets/genre_image_1.jpeg",
      year: '2023 . 1 seasons . Shonen',
      genreName: 'One Piece'),
  MangaModel(
      imageAsset: "assets/genre_image_2.jpeg",
      year: '1999 . 2 seasons . Shonen',
      genreName: 'Jujutsu Kaisen S2'),
  MangaModel(
      imageAsset: "assets/genre_image_3.jpeg",
      year: '2023 . 3 seasons . Shonen',
      genreName: 'Gintama'),
];

final genre = [
  MangaModel(imageAsset: "assets/genre_image_1.jpeg", genreName: 'Action'),
  MangaModel(imageAsset: "assets/genre_image_2.jpeg", genreName: 'Adventure'),
  MangaModel(imageAsset: "assets/genre_image_3.jpeg", genreName: 'Comedy'),
  MangaModel(imageAsset: "assets/genre_image_1.jpeg", genreName: 'Drama'),
  MangaModel(imageAsset: "assets/genre_image_2.jpeg", genreName: 'Echi'),
  MangaModel(imageAsset: "assets/genre_image_3.jpeg", genreName: 'Fantasy'),
  MangaModel(imageAsset: "assets/genre_image_1.jpeg", genreName: 'Horror'),
  MangaModel(imageAsset: "assets/genre_image_3.jpeg", genreName: 'Mecha'),
];

final popularImages = [
  MangaModel(
      imageAsset: "assets/popular_image_1.jpeg",
      genreName: "One Piece",
      cast: [
        {
          "name": "Timothee Chalamet",
          "role": "Paul Atreides",
          "image": "assets/actor_1.jpeg",
        },
        {
          "name": "Zendaya",
          "role": "Chani",
          "image": "assets/actor_2.jpeg",
        },
        {
          "name": "Rebecca Ferguson",
          "role": "Lady Jessica",
          "image": "assets/actor_3.jpeg",
        },
        {
          "name": "Oscar Isaac",
          "role": "Duke Leto",
          "image": "assets/actor_4.jpeg",
        },
        {
          "name": "Jaon Momoa",
          "role": "Duncan Idaho",
          "image": "assets/actor_5.jpeg",
        },
      ],
      year: "1999",
      movieRating: "9.9"),
  MangaModel(
      imageAsset: "assets/popular_image_2.jpeg",
      genreName: "Zom 100: Bucket List of the Dead",
      year: "2023",
      movieRating: "8.7"),
  MangaModel(
      imageAsset: "assets/popular_image_3.jpeg",
      genreName: "Bleach TYBW",
      year: "2023",
      movieRating: "9.9"),
  MangaModel(
      imageAsset: "assets/popular_image_4.jpeg",
      genreName: "Demon Slayer Swordsmith Village Arc",
      year: "2021",
      movieRating: "7.5"),
  MangaModel(
      imageAsset: "assets/popular_image_5.jpeg",
      genreName: "Attack on Titan Final Season",
      year: "2021",
      movieRating: "9.2"),
];
final legendaryImages = [
  MangaModel(
      imageAsset: "assets/legendary_movie_1.jpeg",
      genreName: "Alien",
      year: "1979",
      movieRating: "7.3"),
  MangaModel(
      imageAsset: "assets/legendary_movie_2.jpeg",
      genreName: "300",
      year: "2006",
      movieRating: "9.4"),
  MangaModel(
      imageAsset: "assets/popular_image_3.jpeg",
      genreName: "Narcos",
      year: "2020",
      movieRating: "8.7"),
  MangaModel(
      imageAsset: "assets/for_your_image_2.jpeg",
      genreName: "Shazam!",
      year: "2021",
      movieRating: "7.5"),
  MangaModel(
      imageAsset: "assets/for_your_image_1.jpeg",
      genreName: "Cruella",
      year: "2021",
      movieRating: "9.2"),
];

// final genresList = [
//   MangaModel(genreName: "Horror", imageAsset: "assets/genres_1.png"),
//   MangaModel(genreName: "Fantasy", imageAsset: "assets/genres_2.jpeg"),
//   MangaModel(genreName: "History", imageAsset: "assets/genres_3.jpeg"),
//   MangaModel(genreName: "Detective", imageAsset: "assets/genres_4.jpeg"),
//   MangaModel(genreName: "Action", imageAsset: "assets/genres_5.jpeg"),
// ];
