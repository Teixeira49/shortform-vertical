
import 'package:venetiktok/src/modules/profile/domain/entities/params/delete_account_params.dart';

class DeleteAccountParamsModel extends DeleteAccountParams {
  const DeleteAccountParamsModel({
    required super.userId,
  });

  factory DeleteAccountParamsModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountParamsModel(
      userId: json['userId'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
    };
  }
}