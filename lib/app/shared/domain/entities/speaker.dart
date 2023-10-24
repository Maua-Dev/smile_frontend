class Speaker {
  final String name;
  final String bio;
  final String? linkPhoto;
  final String? company;

  Speaker({
    required this.name,
    required this.bio,
    this.linkPhoto,
    this.company,
  });
}
