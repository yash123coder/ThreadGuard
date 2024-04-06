class UserProfile {
  final String username;
  String email;
  String password; // Adding password field
  final String profilePhotoUrl;

  UserProfile(
      {required this.username,
      required this.email,
      required this.password,
      required this.profilePhotoUrl}); 
}
