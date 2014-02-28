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
    call_api(method: "get_all_leagues", message: {"ApiKey" => api_key}, key: :league)
  end

  def teams
    call_api(method: "get_all_teams", message: {"ApiKey" => api_key}, key: :team)
  end

  def teams_in_league_by_season(league: nil, season: nil)
    call_api(method: "get_all_teams_by_league_and_season", 
              message: {"ApiKey" => api_key, "league" => league, "seasonDateString" => season},
              key: :team)
  end 

  def fixtures_by_date(start_date: nil, end_date: nil)
    call_api(method: "get_fixtures_by_date_interval", 
              message: {"ApiKey" => api_key,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end

  def fixtures_by_date_and_league(league: nil, start_date: nil, end_date: nil)
    call_api(method: "get_fixtures_by_date_interval_and_league", 
              message: {"ApiKey" => api_key,
                        "league" => league,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)   
  end

  def fixtures_by_date_and_team(team: nil, start_date: nil, end_date: nil)
    call_api(method: "get_fixtures_by_date_interval_and_team", 
              message: {"ApiKey" => api_key,
                        "teamId" => team,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end  

  def historic_match_by_fixture(fixture_id: nil)
    call_api(method: "get_historic_matches_by_fixture_match_id", 
              message: {"ApiKey" => api_key, "Id" => fixture_id},
              key: :match)
  end

  def historic_match(match_id: nil)
    call_api(method: "get_historic_matches_by_id", 
              message: {"ApiKey" => api_key, "Id" => match_id},
              key: :match)
  end

  def historic_matches_by_league_and_date(league: nil, start_date: nil, end_date: nil)
    call_api(method: "get_historic_matches_by_league_and_date_interval", 
              message: {"ApiKey" => api_key,
                        "league" => league, 
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end  

  def historic_matches_by_league_and_season(league: nil, season: nil)
    call_api(method: "get_historic_matches_by_league_and_season", 
              message: {"ApiKey" => api_key, "league" => league, "seasonDateString" => season},
              key: :match)    
  end  

  def historic_matches_by_team_and_date(team: nil, start_date: nil, end_date: nil)
    call_api(method: "get_historic_matches_by_team_and_date_interval", 
              message: {"ApiKey" => api_key,
                        "teamId" => team,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end  

  def historic_matches_by_teams_and_date(team_1: nil, team_2: nil, start_date: nil, end_date: nil)
    call_api(method: "get_historic_matches_by_teams_and_date_interval", 
              message: {"ApiKey" => api_key,
                        "team1Id" => team_1,
                        "team2Id" => team_2,
                        "startDateString" => start_date.strftime("%Y-%m-%d"),
                        "endDateString" => end_date.strftime("%Y-%m-%d")},
              key: :match)
  end

  private
  def call_api(method: nil, message: nil, key: nil)
    response = client.call(method.to_sym, message: message)
    hash_response = response.body["#{method}_response".to_sym]["#{method}_result".to_sym][:xmlsoccer_com]

    if hash_response.is_a?(Hash) && hash_response.has_key?(key)
      hash_response[key].is_a?(Array) ? hash_response[key] : [hash_response[key]]
    else
      puts hash_response
    end
  end

end
