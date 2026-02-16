# DKIM Validator API - Dart/Flutter Client

DKIM Validator checks the DomainKeys Identified Mail (DKIM) DNS records for a domain to verify that they are present and correctly formatted.

[![pub package](https://img.shields.io/pub/v/apiverve_dkimvalidator.svg)](https://pub.dev/packages/apiverve_dkimvalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [DKIM Validator API](https://apiverve.com/marketplace/dkimvalidator?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_dkimvalidator: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_dkimvalidator/apiverve_dkimvalidator.dart';

void main() async {
  final client = DkimvalidatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'domain': 'google.com'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "dkim_host": "20230601._domainkey.google.com",
    "dkim_record": "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4zd3nfUoLHWFbfoPZzAb8bvjsFIIFsNypweLuPe4M+vAP1YxObFxRnpvLYz7Z+bORKLber5aGmgFF9iaufsH1z0+aw8Qex7uDaafzWoJOM/6lAS5iI0JggZiUkqNpRQLL7H6E7HcvOMC61nJcO4r0PwLDZKwEaCs8gUHiqRn/SS3wqEZX29v/VOUVcI4BjaOz",
    "dkim_records_count": 1,
    "has_dkim_record": true,
    "host": "google.com",
    "issues_found": [
      {
        "code": "WEAK_PUBLIC_KEY_BITS",
        "message": "Public key uses weak 1416 bits",
        "type": "warning"
      }
    ],
    "key_type": "rsa",
    "selector": "20230601",
    "valid": true,
    "version": "DKIM1"
  }
}
```

## API Reference

- **API Home:** [DKIM Validator API](https://apiverve.com/marketplace/dkimvalidator?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/dkimvalidator](https://docs.apiverve.com/ref/dkimvalidator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
