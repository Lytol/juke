require 'forwardable'

module Juke
  module API
    extend Forwardable
    
    def_delegators :adapter, :get, :post, :put, :delete, :raw_response_body, :response_status
    def_delegators :formatter, :encode, :decode
    
    def adapter
      Juke.adapter
    end
    
    def formatter
      Juke.formatter
    end
    
    def response_body
      formatter.decode(raw_response_body)
    end
  end
end