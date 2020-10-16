final String _imageUrlMedium = "https://image.tmdb.org/t/p/w300";
final String _imageUrlLarge = "https://image.tmdb.org/t/p/w500";

String getMediumPictureUrl(String path) => _imageUrlMedium + path;
String getLargePictureUrl(String path) => _imageUrlLarge + path;

Map<int, String> _genreMap = {
  28: "Ação",
  12: "Aventura",
  16: "Animação",
  35: "Comédia",
  80: "Crime",
  99: "Documentário",
  18: "Drama",
  10751: "Família",
  14: "Fantasia",
  36: "História",
  27: "Terror",
  10402: "Música",
  9648: "Mistério",
  10749: "Romance",
  878: "Ficção científica",
  10770: "Cinema TV",
  53: "Thriller",
  10752: "Guerra",
  37: "Faroeste",
  10759: "Acão & Aventura",
  10762: "Infantil",
  10763: "Notícias",
  10764: "Reality Show",
  10765: "Ficção Científica & Fantasia",
  10766: "Soap Operas",
  10767: "Talk Show",
  10768: "Guerra & Politica",
};

List<String> genresToList(List<dynamic> genreIds) =>
    genreIds.map((id) => _genreMap[id]).toList();

String getGenreValues(List<dynamic> genreIds) {
  StringBuffer buffer = new StringBuffer();
  buffer.writeAll(genresToList(genreIds), " - ");
  return buffer.toString();
}
