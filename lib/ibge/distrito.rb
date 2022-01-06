require 'rest-client'
require 'json'

module IBGE
  class Distrito
    attr_accessor :id, :nome, :municipio

    def initialize(options = {})
      @id        = options['id']
      @nome      = options['nome']
      @municipio = Municipio.new(options['municipio'])
    end

    def self.obter_distritos
      response  = RestClient.get("#{BASE_URL}/distritos")
      distritos = JSON.parse(response.body)

      distritos.map { |distrito| Distrito.new(distrito) }
    end
    
    def self.distritos_por_identificador(id)
      response = RestClient.get("#{BASE_URL}/distritos/#{id}")
      estados  = JSON.parse(response.body)
      
      distritos.map { |distrito| Distrito.new(distrito) }
    end

    def self.distritos_por_uf(uf)
      response   = RestClient.get("#{BASE_URL}/estados/#{uf}/distritos")
      distritos  = JSON.parse(response.body)

      distritos.map { |distrito| Distrito.new(distrito) }
    end

    def self.distritos_por_mesorregiao(id); end

    def self.distritos_por_microrregiao(id); end

    def self.distritos_por_municipio(id); end

    def self.distritos_por_regiao_imediata(id); end

    def self.distritos_por_regiao_intermediaria(id); end

    def self.distritos_por_regiao(id); end
  end
end

