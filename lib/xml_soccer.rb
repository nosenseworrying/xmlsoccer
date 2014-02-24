require "xml_soccer/version"
require "xml_soccer/request_manager"

module Xmlsoccer
  DEMO = "Demo"
  FULL = "Full"

  class XmlSoccerWrapper

    def initialize(options={})
      @api_key = options[:api_key]
      @api_type = options.fetch(:api_type, Xmlsoccer::DEMO)

      @request_manager = RequestManager.new(api_key: @api_key, api_type: @api_type)
    end
  
    def leagues
      @request_manager.get_all_leagues
    end

  end

end
