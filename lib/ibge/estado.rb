require 'rest-client'
require 'json'

module IBGE
  class Estado
    attr_accessor :id, :nome, :municipio

    def initialize(options = {})
      @id        = options['id']
      @nome      = options['nome']
      @municipio = Municipio.new(options['municipio'])
    end
    
    def self.distritos_por_uf(uf)
      response = RestClient.get("#{BASE_URL}/estados/#{uf}/distritos")
      estados  = JSON.parse(response.body)
      estados.map { |estado| Estado.new(estado) }
    end
  end
end

