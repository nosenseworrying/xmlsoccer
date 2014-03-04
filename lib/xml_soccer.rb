#require "xml_soccer/version"
require 'savon'
require 'active_support/time'

class XmlSoccer
  DEMO = "Demo"
  FULL = "Full"
  DEMO_URL = "http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL"
  FULL_URL = "http://www.xmlsoccer.com/FootballData.asmx?WSDL"

  private
  attr_reader :api_key, :client

  public
  def initialize(options={})
    @api_key = options[:api_key]

    case options.fetch(:api_type, XmlSoccer::DEMO)
    when DEMO then base_url = DEMO_URL
    when FULL then base_url = FULL_URL
    end

    @client = Savon.client(wsdl: base_url)
  end

  def leagues
    call_api(method: "get_all_leagues", key: :league)
  end

  def teams
    call_api(method: "get_all_teams", key: :team)
  end

  def teams_in_league_by_season(league: nil, season: nil)
    call_api(method: "get_all_teams_by_league_and_season", 
              message: {"league" => league, "seasonDateString" => season},
              key: :team)
  end 

  def team(team: nil)
    call_api(method: "get_team", message: {"team" => team}, key: :team)
  end  

  def fixtures_by_date(start_date: nil, end_date: nil)
    call_api(method: "get_fixtures_by_date_interval", 
              message: {"startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end

  def fixtures_by_date_and_league(league: nil, start_date: nil, end_date: nil)
    call_api(method: "get_fixtures_by_date_interval_and_league", 
              message: {"league" => league,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)   
  end

  def fixtures_by_date_and_team(team: nil, start_date: nil, end_date: nil)
    call_api(method: "get_fixtures_by_date_interval_and_team", 
              message: {"teamId" => team,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end

  def fixtures_by_league_and_season(league: nil, season: nil)
    call_api(method: "get_fixtures_by_league_and_season", 
              message: {"league" => league, "seasonDateString" => season},
              key: :match)        
  end

  def historic_match_by_fixture(fixture_id: nil)
    call_api(method: "get_historic_matches_by_fixture_match_id", 
              message: {"Id" => fixture_id},
              key: :match)
  end

  def historic_match(match_id: nil)
    call_api(method: "get_historic_matches_by_id", 
              message: {"Id" => match_id},
              key: :match)
  end

  def historic_matches_by_league_and_date(league: nil, start_date: nil, end_date: nil)
    call_api(method: "get_historic_matches_by_league_and_date_interval", 
              message: {"league" => league, 
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end  

  def historic_matches_by_league_and_season(league: nil, season: nil)
    call_api(method: "get_historic_matches_by_league_and_season", 
              message: {"league" => league, "seasonDateString" => season},
              key: :match)    
  end  

  def historic_matches_by_team_and_date(team: nil, start_date: nil, end_date: nil)
    call_api(method: "get_historic_matches_by_team_and_date_interval", 
              message: {"teamId" => team,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end  

  def historic_matches_by_teams_and_date(team_1: nil, team_2: nil, start_date: nil, end_date: nil)
    call_api(method: "get_historic_matches_by_teams_and_date_interval", 
              message: {"team1Id" => team_1,
                        "team2Id" => team_2,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end

  def earliest_match_date_by_league(league: nil)
    call_api(method: "get_earliest_match_date_per_league", 
              message: {"league" => league},
              key: :league_information)
  end

  def league_standings_by_season(league: nil, season: nil)
    call_api(method: "get_league_standings_by_season", 
              message: {"league" => league, "seasonDateString" => season},
              key: :team_league_standing)       
  end

  def live_scores
    call_api(method: "get_live_score", key: :match)
  end

  def live_scores_by_league(league: nil)
    call_api(method: "get_live_score_by_league", message: {"league" => league}, key: :match)
  end

  def top_scorers_by_league_and_season(league: nil, season: nil)
    call_api(method: "get_top_scorers_by_league_and_season", 
              message: {"league" => league, "seasonDateString" => season},
              key: :topscorer)
  end

  def odds_by_fixture(fixture_id: nil)
    call_api(method: "get_odds_by_fixture_match_id", 
              message: {"fixtureMatch_Id" => fixture_id},
              key: :odds)
  end

  def check_api_key
    response = client.call(:check_api_key, message: {"ApiKey" => api_key})
    [{ string: response.body[:check_api_key_response][:check_api_key_result] }]
  end

  private
  def call_api(method: nil, message: {}, key: nil)
    message["ApiKey"] = api_key
    response = client.call(method.to_sym, message: message)
    hash_response = response.body["#{method}_response".to_sym]["#{method}_result".to_sym][:xmlsoccer_com]

    if hash_response.is_a?(Hash) && hash_response.has_key?(key)
      hash_response[key].is_a?(Array) ? hash_response[key] : [hash_response[key]]
    else
      puts hash_response
    end
  end

end
