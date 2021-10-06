import 'dart:io';

import 'package:extendedip/extendedip.dart';
import 'package:test/test.dart';

void main() {
  test('Test ranges', () {
    final addresses = {
      '9.255.255.255': false,
      '10.0.0.0': true,
      '10.255.255.255': true,
      '11.0.0.0': false,
      '172.15.255.255': false,
      '172.16.0.0': true,
      '172.31.255.255': true,
      '172.32.0.0': false,
      '192.167.255.255': false,
      '192.168.0.0': true,
      '192.168.255.255': true,
      '192.169.0.0': false,
      'fc00::': false,
      'fd00::': true,
      'fe00::': false,
    };
    for (var entry in addresses.entries) {
      expect(InternetAddress(entry.key).isInPrivate, entry.value,
          reason: entry.key);
      expect(InternetAddress(entry.key).toIPv6().isInPrivate, entry.value,
          reason: '${entry.key} as IPv6');
    }
  });
}
