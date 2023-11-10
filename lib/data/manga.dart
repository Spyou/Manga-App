class MangaModel {
  String? imageAsset;
  String? title;
  String? movieRating;
  String? year;
  String? released;
  String? rating;
  final List<Map>? cast;
  final List<Map>? comments;
  MangaModel(
      {this.imageAsset,
      this.released,
      this.title,
      this.movieRating,
      this.year,
      this.comments,
      this.rating,
      this.cast});
}

// data
final trending = [
  MangaModel(
      imageAsset: "assets/genre_image_1.jpeg",
      year: '2023 . 1 seasons . Shonen',
      title: 'One Piece'),
  MangaModel(
      imageAsset: "assets/genre_image_2.jpeg",
      year: '1999 . 2 seasons . Shonen',
      title: 'Jujutsu Kaisen S2'),
  MangaModel(
      imageAsset: "assets/genre_image_3.jpeg",
      year: '2023 . 3 seasons . Shonen',
      title: 'Gintama'),
  MangaModel(
      imageAsset: "assets/genre_image_1.jpeg",
      year: '2023 . 1 seasons . Shonen',
      title: 'One Piece'),
  MangaModel(
      imageAsset: "assets/genre_image_2.jpeg",
      year: '1999 . 2 seasons . Shonen',
      title: 'Jujutsu Kaisen S2'),
];

final genre = [
  MangaModel(imageAsset: "assets/genre_image_1.jpeg", title: 'Action'),
  MangaModel(imageAsset: "assets/genre_image_2.jpeg", title: 'Adventure'),
  MangaModel(imageAsset: "assets/genre_image_3.jpeg", title: 'Comedy'),
  MangaModel(imageAsset: "assets/genre_image_1.jpeg", title: 'Drama'),
  MangaModel(imageAsset: "assets/genre_image_2.jpeg", title: 'Echi'),
  MangaModel(imageAsset: "assets/genre_image_3.jpeg", title: 'Fantasy'),
  MangaModel(imageAsset: "assets/genre_image_1.jpeg", title: 'Horror'),
  MangaModel(imageAsset: "assets/genre_image_3.jpeg", title: 'Mecha'),
];

final recently = [
  MangaModel(
      imageAsset:
          "https://i.pinimg.com/originals/44/a6/8f/44a68f2ebc9a5373de2724f9620d04f7.png",
      title: "One Piece",
      released: "1080 Chapters",
      rating: '10.0'),
  MangaModel(
      imageAsset:
          "https://rukminim2.flixcart.com/image/850/1000/kyt0ya80/poster/j/z/q/medium-bleach-anime-series-matte-finish-poster-posterpoint6397-original-imagaybn9ux8adqf.jpeg?q=20",
      title: "Bleach",
      released: "14 Chapters",
      rating: '9.0'),
  MangaModel(
      imageAsset: "https://m.media-amazon.com/images/I/81s+jxE5KEL.jpg",
      title: "Jujutsu Kaisen",
      released: "10 Chapters",
      rating: '7.0'),
  MangaModel(
      imageAsset: "https://flxt.tmsimg.com/assets/p24955247_b_v13_ab.jpg",
      title: "Zom 100: Bucket List of the Dead",
      released: "109 Chapters",
      rating: '6.1'),
  MangaModel(
      imageAsset:
          "https://images.meesho.com/images/products/93006485/yaeuo_512.webp",
      title: "Attack on Titan",
      released: "80 Chapters",
      rating: '8.9'),
  MangaModel(
      imageAsset:
          "https://i.pinimg.com/1200x/73/f9/62/73f962ffd7c064129f9c06c6cfa10e80.jpg",
      title: "Demon Slayer",
      released: "20 Chapters",
      rating: "7.3"),
  MangaModel(
      imageAsset:
          "https://i.pinimg.com/564x/48/19/7c/48197c68aecfec84d3ab5e03fce3b90d.jpg",
      title: "Naruto",
      released: "19 Chapters",
      rating: "9.9"),
  MangaModel(
      imageAsset: "https://m.media-amazon.com/images/I/810juzDPc1L.jpg",
      title: "Dragon Ball",
      released: "6 Chapters",
      rating: "10.0"),
  MangaModel(
      imageAsset:
          "https://i5.walmartimages.com/asr/5b35a398-9479-4e8c-961e-4e193f5fd72f.9bc944942fa4e4922c2beb6aac18346f.jpeg",
      title: "Berserk!",
      released: "101 Chapters",
      rating: "9.0"),
  MangaModel(
      imageAsset:
          "https://m.media-amazon.com/images/M/MV5BM2ZkYTAwMGMtOGEwOS00MzBjLTgxOGYtZTYwY2E1ZjMyZmY4XkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_.jpg",
      title: "Monster",
      released: "10 Chapters",
      rating: "9.9"),
];

final popular = [
  MangaModel(
      imageAsset:
          "https://static.displate.com/280x392/displate/2023-06-26/611acc49e69e80765d0dfc4ba3b71878_3db311585a9f2f85088ad3e7434f14c8.jpg",
      title: "Berserk!",
      released: "101 Chapters"),
  MangaModel(
      imageAsset:
          "https://i.pinimg.com/originals/44/a6/8f/44a68f2ebc9a5373de2724f9620d04f7.png",
      title: "One Piece",
      released: "1080 Chapters"),
  MangaModel(
      imageAsset:
          "https://rukminim2.flixcart.com/image/850/1000/kyt0ya80/poster/j/z/q/medium-bleach-anime-series-matte-finish-poster-posterpoint6397-original-imagaybn9ux8adqf.jpeg?q=20",
      title: "Bleach",
      released: "14 Chapters"),
  MangaModel(
      imageAsset: "https://m.media-amazon.com/images/I/81s+jxE5KEL.jpg",
      title: "Jujutsu Kaisen",
      released: "10 Chapters"),
  MangaModel(
      imageAsset: "https://flxt.tmsimg.com/assets/p24955247_b_v13_ab.jpg",
      title: "Zom 100: Bucket List of the Dead",
      released: "109 Chapters"),
  MangaModel(
      imageAsset:
          "https://images.meesho.com/images/products/93006485/yaeuo_512.webp",
      title: "Attack on Titan",
      released: "80 Chapters"),
  MangaModel(
      imageAsset:
          "https://i.pinimg.com/1200x/73/f9/62/73f962ffd7c064129f9c06c6cfa10e80.jpg",
      title: "Demon Slayer",
      released: "20 Chapters"),
  MangaModel(
      imageAsset:
          "https://i.pinimg.com/564x/48/19/7c/48197c68aecfec84d3ab5e03fce3b90d.jpg",
      title: "Naruto",
      released: "19 Chapters"),
  MangaModel(
      imageAsset: "https://m.media-amazon.com/images/I/810juzDPc1L.jpg",
      title: "Dragon Ball",
      released: "6 Chapters"),
  MangaModel(
      imageAsset:
          "https://m.media-amazon.com/images/M/MV5BM2ZkYTAwMGMtOGEwOS00MzBjLTgxOGYtZTYwY2E1ZjMyZmY4XkEyXkFqcGdeQXVyNTgyNTA4MjM@._V1_.jpg",
      title: "Monster",
      released: "10 Chapters"),
];
