import '../personal_view.dart';

class User {
  final String name;
  final String? school;
  final int? successfulTrade;

  const User({
    required this.name,
    this.school,
    this.successfulTrade,
  });

  get isMe => this == PersonalView.me;
}
