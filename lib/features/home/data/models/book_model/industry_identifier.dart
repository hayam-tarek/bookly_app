import 'dart:convert';

class IndustryIdentifier {
  String? type;
  String? identifier;

  IndustryIdentifier({this.type, this.identifier});

  @override
  String toString() {
    return 'IndustryIdentifier(type: $type, identifier: $identifier)';
  }

  factory IndustryIdentifier.fromMap(Map<String, dynamic> data) {
    return IndustryIdentifier(
      type: data['type'] as String?,
      identifier: data['identifier'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'type': type,
        'identifier': identifier,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [IndustryIdentifier].
  factory IndustryIdentifier.fromJson(String data) {
    return IndustryIdentifier.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [IndustryIdentifier] to a JSON string.
  String toJson() => json.encode(toMap());
}
