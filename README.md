# Splicer

Allows for interactions with multiple DNS' through one abstract API. You can use
this to talk to one or more DNS providers if you choose.

> splice: join or connect (a rope or ropes) by interweaving the strands.

You are joining multiple DNS providers together. This can be used to transfer
records from one to the other without breaking the primary provider.


## Installation

Add this line to your application's Gemfile:

```rb
gem 'splicer'
```


## Configuring

```rb
Splicer.configure do |config|
  config.register(Splicer::Dynect.new('company','user','pass')) # gem 'splicer-dynect'
  config.register(Splicer::DNSMadeEasy.new('user','pass')) # gem 'splicer-dns_made_easy'
end
```

This library does rely on 3rd party sources, so it can and will take time to
publish the zones. It would be wise to put this into a background job.


## Under The Hood

Splicer is a simple abstract data structure that allows you to put together DNS
zones and records quickly. The providers are what take this abstract DNS model
and turn it into the concrete model in some external API.


### Records

All records are relative to a zone.

```rb
record = Splicer::Records::ARecord('example.com', '127.0.0.1')
```

### Zones

Is a collection of records.

```rb
zone = Splicer::Zone.new('example.com')
zone.add_record(record)
zone.publish
```

When `Splicer::Zone#publish` is called, the provider can be passed to only push
the updates to that zone in the DNS.


## Provider

Providers are adapters to a 3rd party API, such as Dynect or DNSMadeEasy. Both
API's are very different but similar in many respects.

If you write a provider you **MUST** follow a few rules:

  * A provider must utilize the abstract model.
  * Do **NOT** monkey patch the abstract model. This can cause problems with
    other provider gems, and cause the library to be unstable.
  * Provide a way to build an abstract model from the concrete (3rd party)
    model. This will allow for easier export to other DNS providers.
  * If a provider does not have an ability to use/create a record such as a KEY
    record, then ignore it.
  * When publishing the zone, there should be ways to completely overwrite the
    zone and merge existing records with that zone.
  * Tests must be written.


## Contributions

Any and all contributions are welcome. Be sure to create a feature branch and
send pull requests. Always, always, run `rspec spec` or `rake` to ensure that
all tests are passing.
