require 'rest-client'
require 'json'

module IBGE
  class UF
    attr_accessor :id, :nome, :sigla, :regiao

    def initialize(options = {})
      @id     = options['id']
      @nome   = options['nome']
      @sigla  = options['sigla']
      @regiao = Regiao.new(options['regiao'])
    end

    def self.obter_ufs
      resposta = RestClient.get("#{BASE_URL}/estados")

      ufs = JSON.parse(resposta.body)
      ufs.map { |uf| UF.new(uf) }
    end

    def self.uf_por_identificador(uf)
      resposta = RestClient.get("#{BASE_URL}/estados/#{uf}")

      uf = JSON.parse(resposta.body)
      UF.new(uf)
    end

    def self.ufs_por_regiao(regiao)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regiao}/estados")

      ufs = JSON.parse(resposta.body)
      ufs.map { |uf| UF.new(uf) }
    end
  end
end