class ImageData {
  final String imageUrl;

  ImageData({required this.imageUrl});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      imageUrl: json['imageUrl'],
    );
  }
}
