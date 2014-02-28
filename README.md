
# XmlSoccer

This is a Ruby wrapper for the excellent soccer data API that can be found at www.xmlsoccer.com

This particular gem is a rewrite/refactoring of the xmlsoccer gem (https://github.com/kavinderd/xmlsoccer)

Please note that this gem is currently in pre-release, and is subject to change.

## Installation

This gem requires Ruby 2.0 or greater, due to the use of keyword arguments in methods.

Add this line to your application's Gemfile:

    gem "xml_soccer"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xml_soccer --pre

## Usage

The xmlsoccer.com API is a SOAP service, so this gem uses the 'Savon' gem to interface.

I would recommend everyone interested in using this gem to first read the documentation for the xmlsoccer.com API at http://xmlsoccer.wikia.com/wiki/Main_Page

Additionally, the author of the xmlsoccer.com API has put a rate limit on all requests: http://xmlsoccer.wikia.com/wiki/Time_interval_limits

Methods will return an Array of the results (as Hashes) from the API call.  If an error occurs, methods will return nil, and print the
response from the API call to the console.

You must have an xmlsoccer.com API Key and know which API type to use.  Currently there are two types: XmlSoccer::DEMO and XmlSoccer::FULL.
Demo is the default if you do not explicitly provide a type.

Example Usage:

xmlsoccer.com API GetAllLeagues

```
xmlsoccer = XmlSoccer.new(api_key: 'Api_key', api_type:'Api_Type')

leagues = xmlsoccer.leagues

if leagues
  leagues.each do |league|
    puts league[:name]
  end
else
  puts "An Error Occured!"
end
```

The following methods are currently implemented:

xml_soccer method | xmlsoccer.com API call
--- | ---
`leagues` | GetAllLeagues
`teams` | GetAllTeams
`teams_in_league_by_season(league: 'league', season: 'season')` | GetAllTeamsByLeagueAndSeason
`fixtures_by_date(start_date: Date, end_date: Date)` | GetFixturesByDateInterval
`fixtures_by_date_and_league(league: 'league', start_date: Date, end_date: Date)` | GetFixturesByDateIntervalAndLeague
`fixtures_by_date_and_team(team: 'team', start_date: Date, end_date: Date)` | GetFixturesByDateIntervalAndTeam
`historic_match_by_fixture(fixture_id: 'fixture_id')` | GetHistoricMatchesByFixtureMatchID
`historic_match(match_id: 'match_id')` | GetHistoricMatchesByID
`historic_matches_by_league_and_date(league: 'league', start_date: Date, end_date: Date)` | GetHistoricMatchesByLeagueAndDateInterval
`historic_matches_by_league_and_season(league: 'league', season: 'season')` | GetHistoricMatchesByLeagueAndSeason
`historic_matches_by_team_and_date(team: 'team', start_date: Date, end_date: Date)` | GetHistoricMatchesByTeamAndDateInterval
`historic_matches_by_teams_and_date(team_1: 'team_1', team_2: 'team_2', start_date: Date, end_date: Date)` | GetHistoricMatchesByTeamsAndDateInterval


## Contributing

1. Fork it ( https://github.com/nosenseworrying/xmlsoccer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
