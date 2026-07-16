# DKIM Validator API - PHP Package

DKIM Validator checks the DomainKeys Identified Mail (DKIM) DNS records for a domain to verify that they are present and correctly formatted.

## Installation

Install via Composer:

```bash
composer require apiverve/dkimvalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Dkimvalidator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['domain' => 'google.com']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Dkimvalidator\Client;
use APIVerve\Dkimvalidator\Exceptions\APIException;
use APIVerve\Dkimvalidator\Exceptions\ValidationException;

try {
    $response = $client->execute(['domain' => 'google.com']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "selector": "20230601",
    "host": "google.com",
    "dkim_host": "20230601._domainkey.google.com",
    "cname_target": null,
    "has_dkim_record": true,
    "dkim_record": "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4zd3nfUoLHWFbfoPZzAb8bvjsFIIFsNypweLuPe4M+vAP1YxObFxRnpvLYz7Z+bORKLber5aGmgFF9iaufsH1z0+aw8Qex7uDaafzWoJOM/6lAS5iI0JggZiUkqNpRQLL7H6E7HcvOMC61nJcO4r0PwLDZKwEaCs8gUHiqRn/SS3wqEZX29v/VOUVcI4BjaOz",
    "dkim_records_count": 1,
    "version": "DKIM1",
    "key_type": "rsa",
    "key_bits": 1416,
    "is_test_mode": false,
    "issues_found": [
      {
        "code": "WEAK_PUBLIC_KEY_BITS",
        "type": "warning",
        "message": "Public key uses weak 1416 bits"
      }
    ],
    "valid": true,
    "risk_score": 25,
    "risk_level": "medium"
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/dkimvalidator?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/dkimvalidator?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/dkimvalidator?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
