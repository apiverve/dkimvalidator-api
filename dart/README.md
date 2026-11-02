# DKIM Validator API - Dart/Flutter Client

DKIM Validator checks the DomainKeys Identified Mail (DKIM) DNS records for a domain to verify that they are present and correctly formatted.

[![pub package](https://img.shields.io/pub/v/apiverve_dkimvalidator.svg)](https://pub.dev/packages/apiverve_dkimvalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [DKIM Validator API](https://apiverve.com/marketplace/dkimvalidator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_dkimvalidator: ^1.2.4
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
      'domain': 'github.com',
      'selector': 's1'
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
    "selector": "s1",
    "host": "github.com",
    "dkim_host": "s1._domainkey.github.com",
    "cname_target": null,
    "has_dkim_record": true,
    "dkim_record": "k=rsa; t=s; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyn3fMCVpb7ryIRKOGXhXVGYmsWUitNlSckqGHOwNFZgFadplOrD+Qzf1XQkP7MH/VB/97DsAAJGtEXW1Uq71Hjnfr/DuBN/YfjF/gU70qEFb7q1sdIiNtjFL2TkOpoW+X/bhhPNheW/fYwyFb6ZHFM6LTgXyuimWRHTOUP3VjZzhNVda79nt+2WZYbS4l8HdMgWpTNHjpVw5PtXESA9KBg/evSRk5fIaXIX5eRXW3baoV9yVzD8O29/IL/DiSk+yNvaO0EHL5c4yGuZJhGzvpiznb2IDVdemJK4Dqzdy5FTN/SGYZhAEr7MguG3Z314hMS2scgMsOMgB64uj/6+6UwIDAQAB",
    "dkim_records_count": 1,
    "key_type": "rsa",
    "issues_found": [
      {
        "code": "V_TAG_NOT_FOUND",
        "type": "warning",
        "message": "The v tag is missing"
      },
      {
        "code": "STRICT_MODE",
        "type": "info",
        "message": "Strict flag set (t=s): the i= identity domain must exactly match d= (no subdomains)"
      }
    ],
    "valid": true,
    "key_bits": 2048,
    "is_test_mode": false,
    "risk_score": 0,
    "risk_level": "low"
  }
}
```

## API Reference

- **API Home:** [DKIM Validator API](https://apiverve.com/marketplace/dkimvalidator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/dkimvalidator](https://docs.apiverve.com/ref/dkimvalidator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
