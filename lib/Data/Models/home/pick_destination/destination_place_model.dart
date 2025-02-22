class Place {
  final String destination_name;
  final String destination_image;

  Place({required this.destination_name, required this.destination_image});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        destination_name: json['name'], destination_image: json['imageUrl']);
  }
}
