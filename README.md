
# XmlSoccer

This is a Ruby wrapper for the excellent soccer data Api that can be found at www.xmlsoccer.com

This particular gem is a rewrite/refactoring of the xmlsoccer gem (https://github.com/kavinderd/xmlsoccer)

## Installation

Add this line to your application's Gemfile:

    gem 'xml_soccer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xml_soccer

## Usage

The XmlSoccer API is a SOAP service so this gem uses the 'Savon' gem to interface.

I would recommend everyone interested in using this gem to first read the documentation of the API @ http://xmlsoccer.wikia.com/wiki/Main_Page

Additionally, the author of the API has put a rate limit on all requests. The gem does check against last request times, but it is still worth knowing: http://xmlsoccer.wikia.com/wiki/Time_interval_limits

Currently there is not support for Live Match Data.

Example Use:

XmlSoccer API GetAllLeagues
(You must have an API Key and know which type to use.  Currently there are two types XmlSoccer::DEMO and XmlSoccer::FULL)

  include XmlSoccer

	xmlsoccer = XmlSoccerWrapper.new(api_key: 'Api_key', api_type:'Api_Type')

	leagues = xmlsoccer.leagues

	leagues.each do |league|
		put league[:name]
	end

As time permits I will add extensive Ruby specific documentation to the Wiki for this repo.

## Contributing

1. Fork it ( https://github.com/nosenseworrying/xmlsoccer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
