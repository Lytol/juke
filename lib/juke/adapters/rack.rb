begin
  require "rack/test"
rescue LoadError
  puts "You must install the rack-test gem: `gem install rack-test`"
  exit
end

module Juke
  extend self
  
  attr_writer :app
  
  def app
    raise("You must specify the Rack application with Juke.app = MyApp to use Juke with Rack") unless @app
    @app
  end
  
  module Adapters
    class Rack
      include ::Rack::Test::Methods
      
      def app
        Juke.app
      end
            
      def get_with_juke(url, params = {})
        get_without_juke(url, params)
      end
      alias_method_chain :get, :juke
      
      def post_with_juke(url, params = {})
        post_without_juke(url, params)
      end
      alias_method_chain :post, :juke
      
      def put_with_juke(url, params = {})
        put_without_juke(url, params)
      end
      alias_method_chain :put, :juke
      
      def delete_with_juke(url, params = {})
        delete_without_juke(url, params)
      end
      alias_method_chain :delete, :juke
      
      def raw_response_body
        last_response.body
      end
      
      def response_status
        last_response.status
      end
    end
  end
end