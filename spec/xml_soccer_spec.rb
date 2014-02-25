# encoding: utf-8
require 'spec_helper'
require "savon/mock/spec_helper"
require "fixtures/request_manager/hashed_responses"
require "active_support/time"

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
    
  it 'initializes with an api key and version' do
    expect(XmlSoccer.new(api_key: 'testkey', api_type: XmlSoccer::DEMO)).to be_a XmlSoccer
  end
  
  before do 
    @client = XmlSoccer.new(api_key: 'testkey', api_type: XmlSoccer::FULL)
  end
  
  describe 'calls api methods:' do
    
    describe 'GetAllLeagues' do
      before do
          message = {"ApiKey" => "testkey"}
          fixture = File.read("spec/fixtures/request_manager/get_all_leagues.xml")

          response = {code: 200, headers: {}, body: fixture}
          savon.expects(:get_all_leagues).with(message: message).returns(response)
          @array = @client.leagues
      end
      
       it 'returns an array' do
         expect(@array).to be_an_instance_of(Array)
        end
        
        it 'responds to league attributes' do
          expect(@array).to include(HashedResponses::GetAllLeagues)
        end
    end
    
    describe 'GetAllTeams' do 
      before do
        message = {"ApiKey" => "testkey"}
        fixture = File.read("spec/fixtures/request_manager/get_all_teams.xml")

        response = {code: 200, headers: {}, body: fixture}
        savon.expects(:get_all_teams).with(message: message).returns(response)
        @array = @client.teams
      end
      
      it 'returns an array' do 
        expect(@array).to be_an_instance_of(Array)
      end
      
      it 'responds to team attributes' do
        expect(@array).to include(HashedResponses::GetAllTeams)
      end
    end
    
    describe 'GetAllTeamsInLeague' do
      before do
        message = {"ApiKey" => "testkey",
                    "league" => "English Premier League", "seasonDateString" => "1011"}
        fixture = File.read("spec/fixtures/request_manager/get_all_teams_by_league_and_season.xml")                                  
        response = {code: 200, headers: {}, body: fixture}
        savon.expects(:get_all_teams_by_league_and_season).with(message: message).returns(response)
        @array = @client.teams_in_league("English Premier League", "1011")
      end
      
      it 'returns an array' do
        expect(@array).to be_an_instance_of(Array)
      end
      
      it 'responds to team attributes' do
        expect(@array).to include(HashedResponses::GetAllTeams)
      end
      
    end
   
    
    it 'gets all teams in a league'
    
    it 'gets fixtures by a date interval'
    
    it 'gets fixtures by date interval and league'
    
    it 'gets fixtures by date interval and team'
    
    it 'gets historic matches by fixture id'
    
    it 'gets historic match by id'
    
    it 'gets historic matches by league and date interval'
    
    it 'gets historic matches by league and season'
    
    it 'gets historic matches by team and date interval'
    
    it 'gets historic matches between teams date interval'
      
  end
    
end

