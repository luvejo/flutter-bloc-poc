import 'package:equatable/equatable.dart';

class Contest extends Equatable {
  final int id;
  final DateTime deadline;
  final String name;
  final List<String> genres;
  final String topPrize;
  final String link;
  final bool viaEmail;
  final bool viaPostalMail;
  final bool isSaved;

  Contest({
    required this.id,
    required this.deadline,
    required this.name,
    required this.genres,
    required this.topPrize,
    required this.link,
    required this.viaEmail,
    this.viaPostalMail = false,
    this.isSaved = false,
  });

  Contest copyWith({
    int? id,
    DateTime? deadline,
    String? name,
    List<String>? genres,
    String? topPrize,
    String? link,
    bool? viaEmail,
    bool? viaPostalMail,
    bool? isSaved,
  }) {
    return Contest(
      id: id ?? this.id,
      deadline: deadline ?? this.deadline,
      name: name ?? this.name,
      genres: genres ?? this.genres,
      topPrize: topPrize ?? this.topPrize,
      link: link ?? this.link,
      viaEmail: viaEmail ?? this.viaEmail,
      viaPostalMail: viaPostalMail ?? this.viaPostalMail,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  List<Object?> get props => [
        id,
        deadline,
        name,
        genres,
        topPrize,
        viaEmail,
        isSaved,
      ];
}
