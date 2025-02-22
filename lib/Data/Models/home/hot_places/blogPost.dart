class Blogpost {
  final int id;
  final String title;
  final String description;
  final String? imageUrl;
  final int totalReacts;
  final DateTime createdAt;

  Blogpost({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.totalReacts,
    required this.createdAt,
  });

  factory Blogpost.fromJson(Map<String, dynamic> json) {
    String? processImageUrl(dynamic url) {
      if (url == null) return null;

      final String baseUrl = 'http://10.0.2.2:8000';

      // If we're getting the image field from Django
      if (json['image'] != null) {
        final String imagePath = json['image'].toString();
        // Check if the URL already contains the base URL
        if (imagePath.startsWith('http')) {
          return imagePath;
        }
        // Remove any leading slashes to prevent double slashes
        final cleanPath =
            imagePath.startsWith('/') ? imagePath.substring(1) : imagePath;
        return '$baseUrl/$cleanPath';
      }

      return null;
    }

    return Blogpost(
      id: json['id'] != null
          ? (json['id'] is int ? json['id'] : int.parse(json['id'].toString()))
          : 0,
      title: json['title']?.toString() ?? "",
      description: json['description']?.toString() ?? "",
      imageUrl: processImageUrl(json['image']),
      totalReacts: json['total_reacts'] != null
          ? (json['total_reacts'] is int
              ? json['total_reacts']
              : int.parse(json['total_reacts'].toString()))
          : 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'].toString())
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': imageUrl,
      'total_reacts': totalReacts,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
