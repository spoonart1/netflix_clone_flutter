class DownloadEntity {
  final String owner;
  final List<DownloadedMovieEntity> movies;

  DownloadEntity(this.owner, this.movies);

  static List<DownloadEntity> sampel1 = [
    DownloadEntity("Maja", [DownloadedMovieEntity.Spiderman, DownloadedMovieEntity.Nope]),
    DownloadEntity("Yohan", [DownloadedMovieEntity.LastSeenAlive, DownloadedMovieEntity.TheCellar]),
    DownloadEntity("John", [DownloadedMovieEntity.TheGodFather, DownloadedMovieEntity.TheNorthMan]),
    DownloadEntity("Marshall", [DownloadedMovieEntity.AfterEverHappy, DownloadedMovieEntity.SonicTheHedgehog]),
  ];
}

class DownloadedMovieEntity {
  final String title;
  final int chapterCount;
  final num totalSize;
  final String backdropPath;

  DownloadedMovieEntity(
      this.title, this.chapterCount, this.totalSize, this.backdropPath);

  static DownloadedMovieEntity Spiderman = DownloadedMovieEntity(
      "Spider-Man: No Way Home", 1, 2.4, "/14QbnygCuTO0vl7CAFmPf1fgZfV.jpg");

  static DownloadedMovieEntity Nope =
      DownloadedMovieEntity("Nope", 1, 2.2, "/AfvIjhDu9p64jKcmohS4hsPG95Q.jpg");

  static DownloadedMovieEntity LastSeenAlive = DownloadedMovieEntity(
      "Last Seen Alive", 1, 1.4, "/ftGzl2GCyko61Qp161bQElN2Uzd.jpg");

  static DownloadedMovieEntity TheCellar = DownloadedMovieEntity(
      "The Cellar", 1, 1.4, "/qViFGWCHaSmW4gP00RGh3xjMjsP.jpg");

  static DownloadedMovieEntity TheGodFather = DownloadedMovieEntity(
      "The God Father", 1, 2.3, "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg");

  static DownloadedMovieEntity TheNorthMan = DownloadedMovieEntity(
      "The North Man", 1, 2.1, "/fqw8nJLPRgKRyFSDC0xBsC06NGC.jpg");

  static DownloadedMovieEntity AfterEverHappy = DownloadedMovieEntity(
      "After Ever Happy", 1, 2.1, "/rwgmDkIEv8VjAsWx25ottJrFvpO.jpg");

  static DownloadedMovieEntity SonicTheHedgehog = DownloadedMovieEntity(
      "Sonic The Hedgehog", 1, 2.1, "/8wwXPG22aNMpPGuXnfm3galoxbI.jpg");

  static DownloadedMovieEntity ICameBy = DownloadedMovieEntity(
      "I Came By", 1, 2.1, "/r26Qj2HfAv6rPXzULLpdDWrkwrT.jpg");

  static DownloadedMovieEntity WireRoom = DownloadedMovieEntity(
      "WireRoom", 1, 2.1, "/skL7c4ZhZqo1IFbMcHNrol4fvkc.jpg");

  static DownloadedMovieEntity Fall =
      DownloadedMovieEntity("Fall", 1, 2.1, "/2RSirqZG949GuRwN38MYCIGG4Od.jpg");
}
