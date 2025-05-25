import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;
  final int profileId;
  final String firstName;
  final String lastName;
  final String plan;
  final String email;
  final bool verified;
  final String imageUrl;

  const User({
    required this.userId,
    required this.profileId,
    required this.firstName,
    required this.lastName,
    required this.plan,
    required this.email,
    required this.verified,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        userId,
        profileId,
        firstName,
        lastName,
        plan,
        email,
        verified,
        imageUrl,
      ];

  String get fullName => '$firstName $lastName';

  User copyWith({
    int? userId,
    int? profileId,
    String? firstName,
    String? lastName,
    String? plan,
    String? email,
    bool? verified,
    String? imageUrl,
  }) {
    return User(
      userId: userId ?? this.userId,
      profileId: profileId ?? this.profileId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      plan: plan ?? this.plan,
      email: email ?? this.email,
      verified: verified ?? this.verified,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  static const empty = User(
    userId: 0,
    profileId: 0,
    firstName: '',
    lastName: '',
    plan: '',
    email: '',
    verified: false,
    imageUrl: '',
  );

  static const emptySkeletonizer = User(
    userId: 1,
    profileId: 1,
    firstName: 'Name',
    lastName: 'Lastname',
    plan: 'Plan',
    email: 'email@email.com',
    verified: true,
    imageUrl: '',
  );

  get userFullName => '$firstName $lastName $email';
}
