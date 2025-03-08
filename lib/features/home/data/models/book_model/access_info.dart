import 'dart:convert';

import 'epub.dart';
import 'pdf.dart';

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  @override
  String toString() {
    return 'AccessInfo(country: $country, viewability: $viewability, embeddable: $embeddable, publicDomain: $publicDomain, textToSpeechPermission: $textToSpeechPermission, epub: $epub, pdf: $pdf, webReaderLink: $webReaderLink, accessViewStatus: $accessViewStatus, quoteSharingAllowed: $quoteSharingAllowed)';
  }

  factory AccessInfo.fromMap(Map<String, dynamic> data) => AccessInfo(
        country: data['country'] as String?,
        viewability: data['viewability'] as String?,
        embeddable: data['embeddable'] as bool?,
        publicDomain: data['publicDomain'] as bool?,
        textToSpeechPermission: data['textToSpeechPermission'] as String?,
        epub: data['epub'] == null
            ? null
            : Epub.fromMap(data['epub'] as Map<String, dynamic>),
        pdf: data['pdf'] == null
            ? null
            : Pdf.fromMap(data['pdf'] as Map<String, dynamic>),
        webReaderLink: data['webReaderLink'] as String?,
        accessViewStatus: data['accessViewStatus'] as String?,
        quoteSharingAllowed: data['quoteSharingAllowed'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'country': country,
        'viewability': viewability,
        'embeddable': embeddable,
        'publicDomain': publicDomain,
        'textToSpeechPermission': textToSpeechPermission,
        'epub': epub?.toMap(),
        'pdf': pdf?.toMap(),
        'webReaderLink': webReaderLink,
        'accessViewStatus': accessViewStatus,
        'quoteSharingAllowed': quoteSharingAllowed,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AccessInfo].
  factory AccessInfo.fromJson(String data) {
    return AccessInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AccessInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}
