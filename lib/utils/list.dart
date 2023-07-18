List<T> intersection<T>(Iterable<Iterable<T>> iterables) {
  return iterables
      .map((e) => e.toSet())
      .reduce((a, b) => a.intersection(b))
      .toList();
}
