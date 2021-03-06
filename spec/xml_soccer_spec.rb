# encoding: utf-8
require 'spec_helper'
require 'savon/mock/spec_helper'
require 'fixtures/hashed_responses'
require 'active_support/time'

describe XmlSoccer do
  
  include Savon::SpecHelper
  include HashedResponses

  before(:all) { savon.mock!   }
  after(:all)  { savon.unmock! }
  
  it 'returns correct string for DEMO' do
    expect(XmlSoccer::DEMO).to eq('Demo')
  end
  
  it 'returns correct string for FULL' do
    expect(XmlSoccer::FULL).to eq('Full')
  end     
    
  it 'initializes with an API key and version' do
    expect(XmlSoccer.new(api_key: 'testkey', api_type: XmlSoccer::DEMO)).to be_a XmlSoccer
  end
  
  before do 
    @client = XmlSoccer.new(api_key: 'testkey', api_type: XmlSoccer::FULL)
  end
  
  describe '#leagues' do
    before do
        message = {"ApiKey" => "testkey"}
        fixture = File.read("spec/fixtures/get_all_leagues.xml")

        response = {code: 200, headers: {}, body: fixture}
        savon.expects(:get_all_leagues).with(message: message).returns(response)
        @array = @client.leagues
    end
    
    it 'returns an array' do
     expect(@array).to be_an_instance_of(Array)
    end

    it 'returns expected leagues' do
      expect(@array).to include(HashedResponses::GetAllLeagues)
    end
  end
  
  describe '#teams' do 
    before do
      message = {"ApiKey" => "testkey"}
      fixture = File.read("spec/fixtures/get_all_teams.xml")

      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_all_teams).with(message: message).returns(response)
      @array = @client.teams
    end
    
    it 'returns an array' do 
      expect(@array).to be_an_instance_of(Array)
    end
    
    it 'returns expected team attributes' do
      expect(@array).to include(HashedResponses::GetAllTeams)
    end
  end
  
  describe '#teams_in_league_by_season' do
    before do
      message = {"ApiKey" => "testkey",
                  "league" => "English Premier League", "seasonDateString" => "1213"}
      fixture = File.read("spec/fixtures/get_all_teams_by_league_and_season.xml")                                  
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_all_teams_by_league_and_season).with(message: message).returns(response)
      @array = @client.teams_in_league_by_season(league: "English Premier League", season: "1213")
    end
    
    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end
    
    it 'returns expected team attributes' do
      expect(@array).to include(HashedResponses::GetAllTeams)
    end
    
  end

  describe '#fixture' do
    before do
      message = { "ApiKey" => "testkey", "Id" => "350686" }
      fixture = File.read("spec/fixtures/get_fixture_match_by_id.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_fixture_match_by_id).with(message: message).returns(response)
      @array = @client.fixture(fixture_id: "350686")
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end

    it 'returns expected fixture' do
      expect(@array).to include(HashedResponses::GetFixtureMatchById)
    end
  end

  describe '#fixtures_by_date' do
    before do
      message = {"ApiKey" => "testkey",
                  "startDateString" => "2014-01-03",
                  "endDateString" => "2014-01-06"}
      fixture = File.read("spec/fixtures/get_fixtures_by_date_interval.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_fixtures_by_date_interval).with(message: message).returns(response)
      @array = @client.fixtures_by_date(start_date: Date.new(2014,1,3), end_date: Date.new(2014,1,6))      
    end
    
    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end

    it 'returns expected fixtures' do
      expect(@array).to include(HashedResponses::GetFixturesByDateInterval)
    end
  end

  describe '#fixtures_by_date_and_league' do
    before do
      message = {"ApiKey" => "testkey",
                  "league" => "Scottish Premier League",
                  "startDateString" => "2014-01-03",
                  "endDateString" => "2014-01-06"}
      fixture = File.read("spec/fixtures/get_fixtures_by_date_interval_and_league.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_fixtures_by_date_interval_and_league).with(message: message).returns(response)
      @array = @client.fixtures_by_date_and_league(league: "Scottish Premier League", start_date: Date.new(2014,1,3), end_date: Date.new(2014,1,6))      
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected fixtures' do
      expect(@array).to include(HashedResponses::GetFixturesByDateIntervalAndLeague)
    end
  end
  
  describe '#fixtures_by_date_and_team' do
    before do
      message = {"ApiKey" => "testkey",
                  "teamId" => "Ross County",
                  "startDateString" => "2014-01-03",
                  "endDateString" => "2014-01-06"}
      fixture = File.read("spec/fixtures/get_fixtures_by_date_interval_and_team.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_fixtures_by_date_interval_and_team).with(message: message).returns(response)
      @array = @client.fixtures_by_date_and_team(team: "Ross County", start_date: Date.new(2014,1,3), end_date: Date.new(2014,1,6))      
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected fixtures' do
      expect(@array).to include(HashedResponses::GetFixturesByDateIntervalAndTeam)
    end
  end

  describe '#fixtures_by_league_and_season' do
    before do
      message = {"ApiKey" => "testkey",
                  "league" => "Scottish Premier League",
                  "seasonDateString" => "" }
      fixture = File.read("spec/fixtures/get_fixtures_by_league_and_season.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_fixtures_by_league_and_season).with(message: message).returns(response)
      @array = @client.fixtures_by_league_and_season(league: "Scottish Premier League", season: "")
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected match' do
      expect(@array).to include(HashedResponses::GetFixturesByLeagueAndSeason)
    end
  end    
  
  describe '#historic_match_by_fixture' do
    before do
      message = {"ApiKey" => "testkey",
                  "Id" => "324725" }
      fixture = File.read("spec/fixtures/get_historic_matches_by_fixture_match_id.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_historic_matches_by_fixture_match_id).with(message: message).returns(response)
      @array = @client.historic_match_by_fixture(fixture_id: "324725")      
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected match' do
      expect(@array).to include(HashedResponses::GetHistoricMatchesByFixtureMatchId)
    end
  end

  describe '#historic_match' do
    before do
      message = {"ApiKey" => "testkey",
                  "Id" => "65805" }
      fixture = File.read("spec/fixtures/get_historic_matches_by_id.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_historic_matches_by_id).with(message: message).returns(response)
      @array = @client.historic_match(match_id: "65805")      
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected match' do
      expect(@array).to include(HashedResponses::GetHistoricMatchesById)
    end
  end  

  describe '#historic_matches_by_league_and_date' do
    before do
      message = {"ApiKey" => "testkey",
                  "league" => "Scottish Premier League",
                  "startDateString" => "2014-01-03",
                  "endDateString" => "2014-01-06" }
      fixture = File.read("spec/fixtures/get_historic_matches_by_league_and_date_interval.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_historic_matches_by_league_and_date_interval).with(message: message).returns(response)
      @array = @client.historic_matches_by_league_and_date(league: "Scottish Premier League", start_date: Date.new(2014, 1, 3), end_date: Date.new(2014, 1, 6))
    end
    
    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end

    it 'returns expected match' do
      expect(@array).to include(HashedResponses::GetHistoricMatchesByLeagueAndDateInterval)
    end
  end

  describe '#historic_matches_by_league_and_season' do
    before do
      message = {"ApiKey" => "testkey",
                  "league" => "Scottish Premier League",
                  "seasonDateString" => "" }
      fixture = File.read("spec/fixtures/get_historic_matches_by_league_and_season.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_historic_matches_by_league_and_season).with(message: message).returns(response)
      @array = @client.historic_matches_by_league_and_season(league: "Scottish Premier League", season: "")
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected match' do
      expect(@array).to include(HashedResponses::GetHistoricMatchesByLeagueAndSeason)
    end
  end  
  
  describe '#historic_matches_by_team_and_date' do
    before do
      message = {"ApiKey" => "testkey",
                  "teamId" => "360",
                  "startDateString" => "2014-01-03",
                  "endDateString" => "2014-01-06" }
      fixture = File.read("spec/fixtures/get_historic_matches_by_team_and_date_interval.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_historic_matches_by_team_and_date_interval).with(message: message).returns(response)
      @array = @client.historic_matches_by_team_and_date(team: "360", start_date: Date.new(2014,1,3), end_date: Date.new(2014,1,6))
    end
    
    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end

    it 'returns expected match' do
      expect(@array).to include(HashedResponses::GetHistoricMatchesByTeamAndDateInterval)
    end
  end  

  describe '#historic_matches_by_teams_and_date' do
    before do
      message = {"ApiKey" => "testkey",
                  "team1Id" => "Ross County",
                  "team2Id" => "St Johnstone",
                  "startDateString" => "2014-01-03",
                  "endDateString" => "2014-01-06" }
      fixture = File.read("spec/fixtures/get_historic_matches_by_teams_and_date_interval.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_historic_matches_by_teams_and_date_interval).with(message: message).returns(response)
      @array = @client.historic_matches_by_teams_and_date(team_1: "Ross County", team_2: "St Johnstone", start_date: Date.new(2014,1,3), end_date: Date.new(2014,1,6))
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected match' do
      expect(@array).to include(HashedResponses::GetHistoricMatchesByTeamsAndDateInterval)
    end
  end

  describe '#earliest_match_date_by_league' do
    before do
      message = {"ApiKey" => "testkey", "league" => "Scottish Premier League" }
      fixture = File.read("spec/fixtures/get_earliest_match_date_per_league.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_earliest_match_date_per_league).with(message: message).returns(response)
      @array = @client.earliest_match_date_by_league(league: "Scottish Premier League")
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected match' do
      expect(@array).to include(HashedResponses::GetEarliestMatchDatePerLeague)
    end
  end   

  describe '#league_standings_by_season' do
    before do
      message = {"ApiKey" => "testkey",
                  "league" => "Scottish Premier League",
                  "seasonDateString" => "1213" }
      fixture = File.read("spec/fixtures/get_league_standings_by_season.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_league_standings_by_season).with(message: message).returns(response)
      @array = @client.league_standings_by_season(league: "Scottish Premier League", season: "1213")
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end    
    
    it 'returns expected standing' do
      expect(@array).to include(HashedResponses::GetLeagueStandingsBySeason)
    end
  end     
    
  describe '#live_scores' do
    before do
        message = {"ApiKey" => "testkey"}
        fixture = File.read("spec/fixtures/get_live_score.xml")

        response = {code: 200, headers: {}, body: fixture}
        savon.expects(:get_live_score).with(message: message).returns(response)
        @array = @client.live_scores
    end
    
    it 'returns an array' do
     expect(@array).to be_an_instance_of(Array)
    end

    it 'returns expected score' do
      expect(@array).to include(HashedResponses::GetLiveScore)
    end
  end 

  describe '#live_scores_by_league' do
    before do
        message = {"ApiKey" => "testkey", "league" => "Serie A"}
        fixture = File.read("spec/fixtures/get_live_score_by_league.xml")

        response = {code: 200, headers: {}, body: fixture}
        savon.expects(:get_live_score_by_league).with(message: message).returns(response)
        @array = @client.live_scores_by_league(league: "Serie A")
    end
    
    it 'returns an array' do
     expect(@array).to be_an_instance_of(Array)
    end

    it 'returns expected score' do
      expect(@array).to include(HashedResponses::GetLiveScoreByLeague)
    end
  end 

  describe '#team' do
    before do
        message = {"ApiKey" => "testkey", "team" => "46"}
        fixture = File.read("spec/fixtures/get_team.xml")

        response = {code: 200, headers: {}, body: fixture}
        savon.expects(:get_team).with(message: message).returns(response)
        @array = @client.team(team: "46")
    end
    
    it 'returns an array' do
     expect(@array).to be_an_instance_of(Array)
    end

    it 'returns expected team' do
      expect(@array).to include(HashedResponses::GetTeam)
    end
  end     

  describe '#top_scorers_by_league_and_season' do
    before do
      message = {"ApiKey" => "testkey",
                  "league" => "Scottish Premier League", "seasonDateString" => "1314"}
      fixture = File.read("spec/fixtures/get_top_scorers_by_league_and_season.xml")                                  
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_top_scorers_by_league_and_season).with(message: message).returns(response)
      @array = @client.top_scorers_by_league_and_season(league: "Scottish Premier League", season: "1314")
    end
    
    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end
    
    it 'returns expected scorer' do
      expect(@array).to include(HashedResponses::GetTopScorersByLeagueAndSeason)
    end
    
  end

  describe '#players_by_team' do
    before do
      message = {"ApiKey" => "testkey", "teamId" => "45" }
      fixture = File.read("spec/fixtures/get_players_by_team.xml")    
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_players_by_team).with(message: message).returns(response)
      @array = @client.players_by_team(team_id: "45")
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end
    
    it 'returns expected players' do
      expect(@array).to include(HashedResponses::GetPlayersByTeam)
    end    
  end

  describe '#player' do
    before do
      message = {"ApiKey" => "testkey", "playerId" => "15435" }
      fixture = File.read("spec/fixtures/get_player_by_id.xml")    
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_player_by_id).with(message: message).returns(response)
      @array = @client.player(player_id: "15435")
    end

    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end
    
    it 'returns expected player' do
      expect(@array).to include(HashedResponses::GetPlayerById)
    end    
  end

  describe '#odds_by_fixture' do
    before do
      message = {"ApiKey" => "testkey",
                  "fixtureMatch_Id" => "324725"}
      fixture = File.read("spec/fixtures/get_odds_by_fixture_match_id.xml")                                  
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_odds_by_fixture_match_id).with(message: message).returns(response)
      @array = @client.odds_by_fixture(fixture_id: "324725")
    end
    
    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end
    
    it 'returns expected odds' do
      expect(@array).to include(HashedResponses::GetOddsByFixtureMatchId)
    end
    
  end  

  describe '#check_api_key' do
    before do
      message = {"ApiKey" => "testkey"}
      fixture = File.read("spec/fixtures/check_api_key.xml")                                  
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:check_api_key).with(message: message).returns(response)
      @array = @client.check_api_key
    end
    
    it 'returns an array' do
      expect(@array).to be_an_instance_of(Array)
    end
    
    it 'returns expected message' do
      expect(@array).to include(HashedResponses::CheckApiKey)
    end
    
  end         


end

