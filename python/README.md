DKIM Validator API
============

DKIM Validator checks the DomainKeys Identified Mail (DKIM) DNS records for a domain to verify that they are present and correctly formatted.

![Build Status](https://img.shields.io/badge/build-passing-green)
![Code Climate](https://img.shields.io/badge/maintainability-B-purple)
![Prod Ready](https://img.shields.io/badge/production-ready-blue)

This is a Python API Wrapper for the [DKIM Validator API](https://apiverve.com/marketplace/api/dkimvalidator)

---

## Installation
	pip install apiverve-dkimvalidator

---

## Configuration

Before using the dkimvalidator API client, you have to setup your account and obtain your API Key.  
You can get it by signing up at [https://apiverve.com](https://apiverve.com)

---

## Usage

The DKIM Validator API documentation is found here: [https://docs.apiverve.com/api/dkimvalidator](https://docs.apiverve.com/api/dkimvalidator).  
You can find parameters, example responses, and status codes documented here.

### Setup

```
# Import the client module
from apiverve_dkimvalidator.apiClient import DkimvalidatorAPIClient

# Initialize the client with your APIVerve API key
api = DkimvalidatorAPIClient("[YOUR_API_KEY]")
```

---


### Perform Request
Using the API client, you can perform requests to the API.

###### Define Query

```
query = { "domain": "google.com" }
```

###### Simple Request

```
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

```
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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms) and all legal documents and agreements.

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2025 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.