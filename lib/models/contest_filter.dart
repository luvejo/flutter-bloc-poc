class ContestFilter {
  final List<String> genres;
  final bool viaEmail;
  final bool viaPostalMail;
  final bool savedOnly;
  final String query;

  const ContestFilter({
    this.viaEmail = true,
    this.viaPostalMail = true,
    this.genres = const [],
    this.query = '',
    this.savedOnly = false,
  });
}
