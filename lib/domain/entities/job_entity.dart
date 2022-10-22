class JobEntity {
  final String id;
  final String companyName;
  final String? companyLink;
  final String? vacancyLink;
  final String mainComment;
  final String? contact;
  final String? companyLocation;
  final String? position;
  final String? vacancySalary;
  final String? preferredSalary;
  final String? extraComment;

  const JobEntity({
    required this.id,
    required this.companyName,
    this.companyLink,
    this.vacancyLink,
    required this.mainComment,
    this.contact,
    this.companyLocation,
    this.position,
    this.vacancySalary,
    this.preferredSalary,
    this.extraComment,
  });

  factory JobEntity.withValidation({
    required String id,
    required String companyName,
    String? companyLink,
    String? vacancyLink,
    required String mainComment,
    String? contact,
    String? companyLocation,
    String? position,
    String? vacancySalary,
    String? preferredSalary,
    String? extraComment,
  }) {
    if (companyName.isEmpty || mainComment.isEmpty) {
      throw Exception;
    }
    return JobEntity(
      id: id,
      companyName: companyName,
      companyLink: companyLink,
      vacancyLink: vacancyLink,
      mainComment: mainComment,
      contact: contact,
      companyLocation: companyLocation,
      position: position,
      vacancySalary: vacancySalary,
      preferredSalary: preferredSalary,
      extraComment: extraComment,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'companyName': companyName,
        'companyLink': companyLink ?? '',
        'vacancyLink': vacancyLink ?? '',
        'mainComment': mainComment,
        'contact': contact ?? '',
        'companyLocation': companyLocation ?? '',
        'position': position ?? '',
        'vacancySalary': vacancySalary ?? '',
        'preferredSalary': preferredSalary ?? '',
        'extraComment': extraComment ?? ''
      };

  JobEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        companyName = json['companyName'],
        companyLink = json['companyLink'] == '' ? null : json['companyLink'],
        vacancyLink = json['vacancyLink'] == '' ? null : json['vacancyLink'],
        mainComment = json['mainComment'],
        contact = json['contact'] == '' ? null : json['contact'],
        companyLocation =
            json['companyLocation'] == '' ? null : json['companyLocation'],
        position = json['position'] == '' ? null : json['position'],
        vacancySalary =
            json['vacancySalary'] == '' ? null : json['vacancySalary'],
        preferredSalary =
            json['preferredSalary'] == '' ? null : json['preferredSalary'],
        extraComment = json['extraComment'] == '' ? null : json['extraComment'];

  JobEntity copyWith(
    String? companyName,
    String? companyLink,
    String? vacancyLink,
    String? mainComment,
    String? contact,
    String? companyLocation,
    String? position,
    String? vacancySalary,
    String? preferredSalary,
    String? extraComment,
  ) =>
      JobEntity(
        id: id,
        companyName: companyName ?? this.companyName,
        companyLink: companyLink ?? this.companyLink,
        vacancyLink: vacancyLink ?? this.vacancyLink,
        mainComment: mainComment ?? this.mainComment,
        contact: contact ?? this.contact,
        companyLocation: companyLocation ?? this.companyLocation,
        position: position ?? this.position,
        vacancySalary: vacancySalary ?? this.vacancySalary,
        preferredSalary: preferredSalary ?? this.preferredSalary,
        extraComment: extraComment ?? this.extraComment,
      );

  @override
  String toString() {
    return 'id: $id, companyName: $companyName, companyLink: $companyLink, vacancyLink: $vacancyLink, mainComment: $mainComment, contact: $contact, companyLocation: $companyLocation, position: $position, vacancySalary: $vacancySalary, preferredSalary: $preferredSalary, extraComment: $extraComment';
  }
}
