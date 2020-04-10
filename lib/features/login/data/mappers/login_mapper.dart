import 'dart:convert';

class LoginModelMapper {
  static Map<String, dynamic> _parseJwt(String token) {
    if (token == null) {
      return {};
    }

    final parts = token.split('.');

    if (parts.length != 3) {
      throw Exception('Invalid token.');
    }

    var payload = parts[1].replaceAll('-', '+').replaceAll('_', '/');

    switch (payload.length % 4) {
      case 0:
        break;
      case 2:
        payload += '==';
        break;
      case 3:
        payload += '=';
        break;
      default:
        throw Exception('Illegal base64url string."');
    }

    payload = utf8.decode(base64Url.decode(payload));
    final payloadMap = json.decode(payload);

    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload.');
    }

    return payloadMap as Map<String, dynamic>;
  }
}
