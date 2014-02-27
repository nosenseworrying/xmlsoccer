#require "xml_soccer/version"
require 'savon'
require 'active_support/time'

class XmlSoccer
  DEMO = "Demo"
  FULL = "Full"
  DEMO_URL = "http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL"
  FULL_URL = "http://www.xmlsoccer.com/FootballData.asmx?WSDL"
  WAIT = 'Wait 5 minutes between calls'  

  private
  attr_reader :api_key, :client
  attr_accessor :last_call

  public
  def initialize(options={})
    @api_key = options[:api_key]

    case options.fetch(:api_type, XmlSoccer::DEMO)
    when DEMO then base_url = DEMO_URL
    when FULL then base_url = FULL_URL
    end

    @client = Savon.client(wsdl: base_url)
    self.last_call = 1.day.ago
  end

  def leagues
    if last_call > 60.minutes.ago
        return WAIT
    else
      response = client.call(:get_all_leagues, message:{"ApiKey" => api_key})
      self.last_call = Time.now
      return response.hash[:envelope][:body][:get_all_leagues_response][:get_all_leagues_result][:xmlsoccer_com][:league]
    end      
  end

  def teams
    if last_call > 60.minutes.ago
      return WAIT
    else
      response = client.call(:get_all_teams, message:{"ApiKey" => api_key})
      self.last_call = Time.now
      return response.hash[:envelope][:body][:get_all_teams_response][:get_all_teams_result][:xmlsoccer_com][:team]
    end
  end

  def teams_in_league_by_season(league: nil, season: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else      
      response = client.call(:get_all_teams_by_league_and_season, message: {"ApiKey" => api_key, "league" => league, "seasonDateString" => season})
      self.last_call = Time.now
      return response.hash[:envelope][:body][:get_all_teams_by_league_and_season_response][:get_all_teams_by_league_and_season_result][:xmlsoccer_com][:team]
    end
  end 

  def fixtures_by_date(start_date: nil, end_date: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_fixtures_by_date_interval,
        message: {"ApiKey" => api_key,
                    "startDateString" => start_date.strftime("%Y-%m-%d"),
                    "endDateString" => end_date.strftime("%Y-%m-%d")})
      self.last_call = Time.now
      return response.hash[:envelope][:body][:get_fixtures_by_date_interval_response][:get_fixtures_by_date_interval_result][:xmlsoccer_com][:match]
    end
  end

  def fixtures_by_date_and_league(league: nil, start_date: nil, end_date: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_fixtures_by_date_interval_and_league,
        message: {"ApiKey" => api_key,
                    "league" => league,
                    "startDateString" => start_date.strftime("%Y-%m-%d"),
                    "endDateString" => end_date.strftime("%Y-%m-%d")})
      self.last_call = Time.now
      return response.hash[:envelope][:body][:get_fixtures_by_date_interval_and_league_response][:get_fixtures_by_date_interval_and_league_result][:xmlsoccer_com][:match]
    end
  end

  def fixtures_by_date_and_team(team: nil, start_date: nil, end_date: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_fixtures_by_date_interval_and_team,
        message: {"ApiKey" => api_key,
                    "teamId" => team,
                    "startDateString" => start_date.strftime("%Y-%m-%d"),
                    "endDateString" => end_date.strftime("%Y-%m-%d")})
      self.last_call = Time.now
      return response.hash[:envelope][:body][:get_fixtures_by_date_interval_and_team_response][:get_fixtures_by_date_interval_and_team_result][:xmlsoccer_com][:match]
    end
  end  

  def historic_match_by_fixture(fixture_id: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_historic_matches_by_fixture_match_id,
        message: {"ApiKey" => api_key,
                    "Id" => fixture_id})
      self.last_call = Time.now         
      return response.hash[:envelope][:body][:get_historic_matches_by_fixture_match_id_response][:get_historic_matches_by_fixture_match_id_result][:xmlsoccer_com][:match]
    end
  end

  def historic_match(match_id: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_historic_matches_by_id,
        message: {"ApiKey" => api_key,
                    "Id" => match_id})
      self.last_call = Time.now        
      return response.hash[:envelope][:body][:get_historic_matches_by_id_response][:get_historic_matches_by_id_result][:xmlsoccer_com][:match]
    end
  end

  def historic_matches_by_league_and_date(league: nil, start_date: nil, end_date: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_historic_matches_by_league_and_date_interval,
        message: {"ApiKey" => api_key,
                    "league" => league, 
                    "startDateString" => start_date.strftime("%Y-%m-%d"),
                    "endDateString" => end_date.strftime("%Y-%m-%d")})      
      self.last_call = Time.now
      return response.hash[:envelope][:body][:get_historic_matches_by_league_and_date_interval_response][:get_historic_matches_by_league_and_date_interval_result][:xmlsoccer_com][:match]
    end
  end  

  def historic_matches_by_league_and_season(league: nil, season: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_historic_matches_by_league_and_season,
        message: {"ApiKey" => api_key,
                    "league" => league, "seasonDateString" => season})
      self.last_call = Time.now          
      return response.hash[:envelope][:body][:get_historic_matches_by_league_and_season_response][:get_historic_matches_by_league_and_season_result][:xmlsoccer_com][:match]
    end
  end  

  def historic_matches_by_team_and_date(team: nil, start_date: nil, end_date: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_historic_matches_by_team_and_date_interval,
        message: {"ApiKey" => api_key,
                    "teamId" => team,
                    "startDateString" => start_date.strftime("%Y-%m-%d"),
                    "endDateString" => end_date.strftime("%Y-%m-%d")})
      self.last_call = Time.now              
      return response.hash[:envelope][:body][:get_historic_matches_by_team_and_date_interval_response][:get_historic_matches_by_team_and_date_interval_result][:xmlsoccer_com][:match]
    end
  end  

  def historic_matches_by_teams_and_date(team_1: nil, team_2: nil, start_date: nil, end_date: nil)
    if last_call > 5.minutes.ago
      return WAIT
    else
      response = client.call(:get_historic_matches_by_teams_and_date_interval,
        message: {"ApiKey" => api_key,
                    "team1Id" => team_1,
                    "team2Id" => team_2,
                    "startDateString" => start_date.strftime("%Y-%m-%d"),
                    "endDateString" => end_date.strftime("%Y-%m-%d")})
      self.last_call = Time.now     
      return response.hash[:envelope][:body][:get_historic_matches_by_teams_and_date_interval_response][:get_historic_matches_by_teams_and_date_interval_result][:xmlsoccer_com][:match]
    end
  end

end
