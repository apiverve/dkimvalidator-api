DKIM Validator API
============

DKIM Validator checks the DomainKeys Identified Mail (DKIM) DNS records for a domain to verify that they are present and correctly formatted.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [DKIM Validator API](https://apiverve.com/marketplace/dkimvalidator?utm_source=pypi&utm_medium=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-dkimvalidator
```

Using `pip3`:

```bash
pip3 install apiverve-dkimvalidator
```

---

## Configuration

Before using the dkimvalidator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient

# Initialize the client with your APIVerve API key
api = DkimvalidatorAPIClient("[YOUR_API_KEY]")

query = { "domain": "google.com" }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The DKIM Validator API documentation is found here: [https://docs.apiverve.com/ref/dkimvalidator](https://docs.apiverve.com/ref/dkimvalidator?utm_source=pypi&utm_medium=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient

# Initialize the client with your APIVerve API key
api = DkimvalidatorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "domain": "google.com" }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `DkimvalidatorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient, DkimvalidatorAPIClientError

api = DkimvalidatorAPIClient("[YOUR_API_KEY]")

query = { "domain": "google.com" }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except DkimvalidatorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient, DkimvalidatorAPIClientError

api = DkimvalidatorAPIClient("[YOUR_API_KEY]")

query = { "domain": "google.com" }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except DkimvalidatorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient, DkimvalidatorAPIClientError

query = { "domain": "google.com" }

# Using context manager ensures proper cleanup
with DkimvalidatorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except DkimvalidatorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient

# Enable debug mode
api = DkimvalidatorAPIClient("[YOUR_API_KEY]", debug=True)

query = { "domain": "google.com" }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient

api = DkimvalidatorAPIClient("[YOUR_API_KEY]")

query = { "domain": "google.com" }

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=readme) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
