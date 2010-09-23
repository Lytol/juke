require 'juke/adapters/rack'

module Juke
  module Adapters
    class Rails < Rack
      def app
        ::Rails.application
      end
    end
  end
end