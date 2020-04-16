class Pokemon {
  String name;
  String imageUrl;

  Pokemon({this.name, this.imageUrl});

  Pokemon.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imageUrl = json['sprites']['front_default'];

  Map<String, dynamic> toJson() => {'name': name, 'imageUrl': imageUrl};
}
