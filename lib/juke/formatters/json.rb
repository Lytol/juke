require 'json'

module Juke
  module Formatters
    class Json
      
      def encode(obj)
        obj.to_json
      end
      
      def decode(str)
        ::JSON::parse(str)
      end
      
    end
  end
end