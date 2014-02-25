require "xml_soccer/version"
require "xml_soccer/request_manager"

module XmlSoccer
  DEMO = "Demo"
  FULL = "Full"

  class XmlSoccerWrapper
    attr_reader :request_manager

    def initialize(options={})
      api_key = options[:api_key]
      api_type = options.fetch(:api_type, XmlSoccer::DEMO)

      @request_manager = RequestManager.new(api_key: api_key, api_type: api_type)
    end
  
    def leagues
      request_manager.get_all_leagues
    end

    def fixtures_by_date(start_date, end_date)
      request_manager.get_fixtures_by_date_interval(start_date, end_date)
    end

  end

end
