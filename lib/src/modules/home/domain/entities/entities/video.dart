
class Video {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final int duration;
  final DateTime uploadDate;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.duration,
    required this.uploadDate,
  });
}