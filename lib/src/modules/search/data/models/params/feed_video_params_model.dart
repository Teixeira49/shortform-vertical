import '../../../domain/entities/entities.dart';

class FeedVideoParamsModel extends FeedVideoParams {
  const FeedVideoParamsModel({
    required super.userId,
    //required super.page,
    //required super.limit,
    //required super.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      //'page': page,
      //'limit': limit,
      //'type': type.name,
    };
  }

  factory FeedVideoParamsModel.fromEntity(FeedVideoParams entity) {
    return FeedVideoParamsModel(
      userId: entity.userId,
      //page: entity.page,
      //limit: entity.limit,
      //type: entity.type,
    );
  }

  factory FeedVideoParamsModel.fromMap(Map<String, dynamic> map) {
    return FeedVideoParamsModel(
      userId: map['user_id'] as int,
      //page: map['page'] as int,
      //limit: map['limit'] as int,
      //type: VideoType.values.firstWhere((e) => e.name == map['type']),
    );
  }
}