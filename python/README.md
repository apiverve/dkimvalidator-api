DKIM Validator API
============

DKIM Validator checks the DomainKeys Identified Mail (DKIM) DNS records for a domain to verify that they are present and correctly formatted.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-dkimvalidator.svg)](https://pypi.org/project/apiverve-dkimvalidator/)

This is a Python wrapper for the [DKIM Validator API](https://apiverve.com/marketplace/dkimvalidator?utm_source=pypi&utm_medium=referral&utm_content=readme)

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

Before using the DKIM Validator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient

# Initialize the client with your APIVerve API key
api = DkimvalidatorAPIClient("[YOUR_API_KEY]")

query = {
    "domain": "github.com",
    "selector": "s1"
}

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

The DKIM Validator API documentation is found here: [https://docs.apiverve.com/ref/dkimvalidator](https://docs.apiverve.com/ref/dkimvalidator?utm_source=pypi&utm_medium=referral&utm_content=readme).
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
query = {
    "domain": "github.com",
    "selector": "s1"
}
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

---

## Error Handling

The API client provides comprehensive error handling through the `DkimvalidatorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient, DkimvalidatorAPIClientError

api = DkimvalidatorAPIClient("[YOUR_API_KEY]")

query = {
    "domain": "github.com",
    "selector": "s1"
}

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

query = {
    "domain": "github.com",
    "selector": "s1"
}

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

query = {
    "domain": "github.com",
    "selector": "s1"
}

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

query = {
    "domain": "github.com",
    "selector": "s1"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient

api = DkimvalidatorAPIClient("[YOUR_API_KEY]")

query = {
    "domain": "github.com",
    "selector": "s1"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
