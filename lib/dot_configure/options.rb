require 'ostruct'

module DotConfigure
  # Customizable configuration class
  class Options < OpenStruct
    attr_accessor :locked

    def locked?
      locked || false
    end    
  end
end