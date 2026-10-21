# DKIM Validator API - Ruby Gem

DKIM Validator checks the DomainKeys Identified Mail (DKIM) DNS records for a domain to verify that they are present and correctly formatted.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_dkimvalidator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_dkimvalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_dkimvalidator'

# Initialize the client
client = APIVerve::Dkimvalidator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  domain: "github.com",
  selector: "s1"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ domain: "github.com", selector: "s1" })
  puts response["data"]
rescue APIVerve::Dkimvalidator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Dkimvalidator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Dkimvalidator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/dkimvalidator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/dkimvalidator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/dkimvalidator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
