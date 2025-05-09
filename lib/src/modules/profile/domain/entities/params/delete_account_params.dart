
class DeleteAccountParams {
  final int userId;

  const DeleteAccountParams({
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
    };
  }
}