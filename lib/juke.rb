require 'juke/cucumber'
require 'juke/ext/utils'

module Juke
  extend self
  
  def adapter=(adapter)
    adapter = adapter.to_s
    
    begin
      require "juke/adapters/#{adapter}"
    rescue LoadError
      puts "The adapter `#{adapter}` could not be found (juke/adapters/#{adapter})"
      exit
    end
    
    camelcase_adapter = Juke::Ext::Utils.camelize(adapter)
    adapter_const = Juke::Ext::Utils.constantize("Juke::Adapters::#{camelcase_adapter}")
    @adapter = adapter_const.new
  end
  
  def adapter
    @adapter ||= default_adapter.new
  end

  def formatter=(formatter)
    formatter = formatter.to_s
    
    begin
      require "juke/formatters/#{formatter}"
    rescue LoadError
      puts "The formatter `#{formatter.to_s}` could not be found (juke/formatters/#{formatter})"
      exit
    end
    
    camelcase_formatter = Juke::Ext::Utils.camelize(formatter)
    formatter_const = Juke::Ext::Utils.constantize("Juke::Formatters::#{camelcase_formatter}")
    @formatter = formatter_const.new
  end
  
  def formatter
    @formatter ||= default_formatter.new
  end
  
  private
  
    def default_adapter
      require 'juke/adapters/rails'
      Juke::Adapters::Rails
    end
    
    def default_formatter
      require 'juke/formatters/json'
      Juke::Formatters::Json
    end
  
end