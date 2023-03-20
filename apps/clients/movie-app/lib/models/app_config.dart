class AppConfig {
  final String? apiImageUrl;
  final String? apiBaseUrl;
  final String? apiKey;

  AppConfig({
    this.apiImageUrl,
    this.apiBaseUrl,
    this.apiKey,
  });

  // factory AppConfig.fromJson(Map<String, dynamic> json) {
  //   return AppConfig(
  //     apiImageUrl: json['api_image_url'],
  //     apiBaseUrl: json['api_base_url'],
  //     apiKey: json['api_key'],
  //   );
  // }
}
