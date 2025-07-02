final class FirebaseEnvironmentValues {
  final String webApiKey;
  final String androidApiKey;
  final String iosApiKey;

  final String webAppId;
  final String androidAppId;
  final String iosAppId;

  final String projectId;
  final String storageBucket;
  final String messagingSenderId;

  FirebaseEnvironmentValues({
    required this.webApiKey,
    required this.androidApiKey,
    required this.iosApiKey,
    required this.webAppId,
    required this.androidAppId,
    required this.iosAppId,
    required this.projectId,
    required this.storageBucket,
    required this.messagingSenderId,
  });
}
