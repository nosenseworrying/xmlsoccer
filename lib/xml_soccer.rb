#require "xml_soccer/version"
require 'savon'

class XmlSoccer
  VERSION = "0.0.1"
  DEMO = "Demo"
  FULL = "Full"
  DEMO_URL = "http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL"
  FULL_URL = "http://www.xmlsoccer.com/FootballData.asmx?WSDL"
  WAIT = 'Wait 5 minutes between calls'  

  attr_reader :api_key, :client

  def initialize(options={})
    @api_key = options[:api_key]
    api_type = options.fetch(:api_type, XmlSoccer::DEMO)

    case api_type
    when DEMO then base_url = DEMO_URL
    when FULL then base_url = FULL_URL
    end

    @client = Savon.client(wsdl: base_url)
  end

  def leagues
    if @last_call && @last_call > 60.minutes.ago
        return WAIT
    else
      response = client.call(:get_all_leagues, message:{"ApiKey" => api_key})
      @last_call =Time.now
      return response.hash[:envelope][:body][:get_all_leagues_response][:get_all_leagues_result][:xmlsoccer_com][:league]
    end      
  end

  def fixtures_by_date(start_date, end_date)
    #request_manager.get_fixtures_by_date_interval(start_date, end_date)
  end

end
