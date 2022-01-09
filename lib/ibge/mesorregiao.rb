module IBGE
  class Mesorregiao
    attr_accessor :id, :nome, :uf

    def initialize(options = {})
      @id   = options['id']
      @nome = options['nome']
      @uf   = IBGE::UF.new(options['UF'])
    end

    # Obtém o conjunto de mesorregiões do Brasil.
    #
    # @return [Array<Mesorregiao>]
    #
    # @example
    #           mesorregioes = IBGE::Mesorregiao.obter_mesorregioes
    #           mesorregioes.first.nome #=> "Madeira-Guaporé"
    def self.obter_mesorregioes
      resposta = RestClient.get("#{BASE_URL}/mesorregioes")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de mesorregiões do Brasil a partir dos identificadores das Unidades da Federação.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores. 
    # 
    # @param ufs [String, Integer, Array]
    # @return [Array<Mesorregiao>]
    #
    # @example
    #           mesorregioes = IBGE::Mesorregiao.mesorregioes_por_uf('CE')
    #           mesorregioes.first.nome #=> "Noroeste Cearense"
    #
    #           IBGE::Mesorregiao.mesorregioes_por_uf(['BA', 'CE'])
    #           IBGE::Mesorregiao.mesorregioes_por_uf(23) 
    def self.mesorregioes_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/mesorregioes")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de mesorregiões do Brasil a partir dos respectivos identificadores.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array]
    # @return [Mesorregiao, Array<Mesorregiao>]
    #
    # @example
    #           mesorregiao = IBGE::Mesorregiao.mesorregioes_por_id(2303)
    #           mesorregiao.nome #=> "Metropolitana de Fortaleza"
    #
    #           mesorregioes = IBGE::Mesorregiao.mesorregioes_por_id([2303, 2304])
    def self.mesorregioes_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/mesorregioes/#{ids}")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de mesorregiões do Brasil a partir dos identificadores das regiões.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regioes [String, Integer, Array]
    # @return [Array<Mesorregiao>]
    #
    # @example
    #           mesorregioes = IBGE::Mesorregiao.mesorregioes_por_regiao('NE')
    #           mesorregioes.first.nome #=> "Norte Maranhense"
    #
    #           IBGE::Mesorregiao.mesorregioes_por_regiao(['NE', 'N'])
    #           IBGE::Mesorregiao.mesorregioes_por_regiao([1, 2])
    def self.mesorregioes_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/mesorregioes")

      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      mesorregioes = JSON.parse(resposta.body)

      if mesorregioes.is_a?(Array) 
        mesorregioes.map { |mesorregiao| Mesorregiao.new(mesorregiao) }
      else
        Mesorregiao.new(mesorregioes)
      end 
    end
  end
end