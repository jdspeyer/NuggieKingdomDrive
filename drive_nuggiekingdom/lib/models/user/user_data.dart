///
/// The [UserData] class is an object which stores user data loaded directly from Firestore.
///
class UserData {
  /// [email] is a [String] containing the email the [UserData] used to sign up with.
  String email;

  /// [displayName] is the name that is shown to other [UserData]s when leaving reviews. This must be unique.
  String displayName;

  /// [profileImageUrl] is the URL to the profile image of the Discord account that is signed into the service.
  String profileImageUrl;

  /// Default constructor used to generate an empty [UserData] with no data derrived from the database.
  UserData()
      : email = "",
        displayName = "",
        profileImageUrl = "";
}
