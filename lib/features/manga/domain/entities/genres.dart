typedef ListGenres = List<Genres>;

class Genres {
  const Genres({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;
}
