import 'dart:convert';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class BookModel {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  @override
  String toString() {
    return 'BookModel(kind: $kind, id: $id, etag: $etag, selfLink: $selfLink, volumeInfo: $volumeInfo, saleInfo: $saleInfo, accessInfo: $accessInfo, searchInfo: $searchInfo)';
  }

  factory BookModel.fromMap(Map<String, dynamic> data) => BookModel(
        kind: data['kind'] as String?,
        id: data['id'] as String?,
        etag: data['etag'] as String?,
        selfLink: data['selfLink'] as String?,
        volumeInfo: data['volumeInfo'] == null
            ? null
            : VolumeInfo.fromMap(data['volumeInfo'] as Map<String, dynamic>),
        saleInfo: data['saleInfo'] == null
            ? null
            : SaleInfo.fromMap(data['saleInfo'] as Map<String, dynamic>),
        accessInfo: data['accessInfo'] == null
            ? null
            : AccessInfo.fromMap(data['accessInfo'] as Map<String, dynamic>),
        searchInfo: data['searchInfo'] == null
            ? null
            : SearchInfo.fromMap(data['searchInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'kind': kind,
        'id': id,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toMap(),
        'saleInfo': saleInfo?.toMap(),
        'accessInfo': accessInfo?.toMap(),
        'searchInfo': searchInfo?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BookModel].
  factory BookModel.fromJson(String data) {
    return BookModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BookModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
