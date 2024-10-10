class Certificate {
  final DateTime issuedAt;
  final String? downloadLink;
  final String? certificateImage;
  final String? certificateName;

  Certificate({
    required this.issuedAt,
    this.downloadLink,
    this.certificateImage,
    this.certificateName,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      issuedAt: json['issued_at'] != null ? DateTime.parse(json['issued_at']) : DateTime.now(),
      downloadLink: json['download_link'] as String?,
      certificateImage: json['certificate_image'] as String?,
      certificateName: json['certificate_name'] as String?,
    );
  }
}
