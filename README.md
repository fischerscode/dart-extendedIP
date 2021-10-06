Extended functionality for an InternetAddress.

## Usage

A simple usage example:

```dart
import 'package:extendedip/extendedip.dart';

void main() {
  // Check if an IP is in a private network.
  print(InternetAddress('192.168.24.64').isInPrivate); // true
  print(InternetAddress('1.2.3.4').isInPrivate); // false

  // Convert an IPv4 to an IPv6.
  print(InternetAddress('1.2.3.4').toIPv6().address); // ::FFFF:1.2.3.4
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/fischerscode/dart-extendedIP/issues
