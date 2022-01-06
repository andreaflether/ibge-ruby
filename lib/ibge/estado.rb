require 'rest-client'
require 'json'

module IBGE
  class Estado
    attr_accessor :id, :nome

    def initialize(options = {})
      @id        = options['id']
      @nome      = options['nome']
    end
  end
end

