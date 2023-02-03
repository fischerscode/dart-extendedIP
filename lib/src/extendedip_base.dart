import 'dart:io';

/// [InternetAddress] with additional functionality.
extension ExtendedInternetAddress on InternetAddress {
  /// True if this address is in a private IP address.
  bool get isInPrivate {
    final bytes = toIPv6().rawAddress;
    switch (bytes[0]) {
      case 253:
        return bytes[1] == 0;
      case 0:
        for (var i = 1; i < 10; i++) {
          if (bytes[i] != 0) {
            return false;
          }
        }
        for (var i = 10; i < 12; i++) {
          if (bytes[i] != 255) {
            return false;
          }
        }
        switch (bytes[12]) {
          case 10:
            return true;
          case 192:
            return bytes[13] == 168;
          case 172:
            return bytes[13] >= 16 && bytes[13] < 32;
        }
    }
    return false;
  }

  /// Convert this IPv4 to an IPv6 address.
  InternetAddress toIPv6() {
    switch (type) {
      case InternetAddressType.IPv6:
        return this;
      case InternetAddressType.IPv4:
        return InternetAddress('::FFFF:$address');
      default:
        throw Exception(
          'Can not transfer $type to ${InternetAddressType.IPv6}!',
        );
    }
  }
}
