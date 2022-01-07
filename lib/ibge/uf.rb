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

    # Obtém o conjunto de Unidades da Federação do Brasil.
    #
    # @example
    #           ufs = IBGE::UF.obter_ufs
    #           ufs.first.class #=> IBGE::UF
    #           ufs.first.nome #=> "Acre"
    #           ufs.map(&:sigla) #=> ['AC', 'AM', 'AP'...]
    def self.obter_ufs
      resposta = RestClient.get("#{BASE_URL}/estados")

      ufs = JSON.parse(resposta.body)
      ufs.map { |uf| UF.new(uf) }
    end

    # Obtém o conjunto de Unidades da Federação do Brasil a partir dos respectivos identificadores.
    # Pode ser informado a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param uf [String, Integer, Array]
    # @return [UF, Array<UF>]
    #
    # @example
    #           uf = IBGE::UF.uf_por_identificador('CE')
    #           uf.class #=> IBGE::UF
    #           uf = IBGE::UF.ufs_por_identificador(['BA', 'CE'])
    #           uf.class #=> Array
    def self.uf_por_identificador(uf)
      uf       = formatar(uf)
      resposta = RestClient.get("#{BASE_URL}/estados/#{uf}")

      uf = JSON.parse(resposta.body)
      UF.new(uf)
    end

    # Obtém o conjunto de Unidades da Federação do Brasil a partir dos identificadores das regiões.
    # Pode ser informado a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regiao [String, Integer, Array]
    # @return [Array<UF>]
    #
    # @example
    #           ufs = IBGE::UF.ufs_por_regiao('NE')
    #           ufs.first.nome #=> "Maranhão"
    #           ufs = IBGE::UF.ufs_por_regiao(['NE', 'N'])
    #           ufs.map(&:nome) #=> ['Ceará', 'Amazonas'...]
    def self.ufs_por_regiao(regiao)
      regiao   = formatar(regiao)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regiao}/estados")

      ufs = JSON.parse(resposta.body)
      ufs.map { |uf| UF.new(uf) }
    end

    private

    def formatar(parametro)
      parametro.is_a?(Array) ? parametro.join('|') : parametro
    end 
  end
end