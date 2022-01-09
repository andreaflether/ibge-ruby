module IBGE
  class Microrregiao
    attr_accessor :id, :nome, :mesorregiao

    def initialize(options = {})
      @id          = options['id']
      @nome        = options['nome']
      @mesorregiao = Mesorregiao.new(options['mesorregiao'])
    end

    # Obtém o conjunto de microrregiões do Brasil.
    #
    # @return [Array<Microrregiao>]
    #
    # @example
    #           microrregioes = IBGE::Microrregiao.obter_microrregioes
    #           microrregioes.first.nome #=> "Porto Velho"
    def self.obter_microrregioes
      resposta = RestClient.get("#{BASE_URL}/microrregioes")

      tratar_retorno(resposta)
    end
    
    # Obtém o conjunto de microrregiões do Brasil a partir dos respectivos identificadores.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de microrregiões.
    # @return [Microrregiao, Array<Microrregiao>]
    #
    # @example
    #           microrregiao = IBGE::Microrregiao.microrregioes_por_id(23015)
    #           microrregiao.nome #=> "Cascavel"
    #
    #           microrregioes = IBGE::Microrregiao.microrregioes_por_id([23015, 23016])
    def self.microrregioes_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/microrregioes/#{ids}")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de microrregiões do Brasil a partir dos identificadores das Unidades da Federação.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores. 
    # 
    # @param ufs [String, Integer, Array]
    # @return [Array<Microrregiao>]
    #
    # @example
    #           microrregioes = IBGE::Microrregiao.microrregioes_por_uf('CE')
    #           microrregioes.first.nome #=> "Litoral de Camocim e Acaraú"
    #
    #           IBGE::Microrregiao.microrregioes_por_uf(['BA', 'CE'])
    #           IBGE::Microrregiao.microrregioes_por_uf(23) 
    def self.microrregioes_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/microrregioes")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de microrregiões do Brasil a partir dos identificadores das regiões.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regioes [String, Integer, Array]
    # @return [Array<Microrregiao>]
    #
    # @example
    #           microrregioes = IBGE::Microrregiao.microrregioes_por_regiao('NE')
    #           microrregioes.first.nome #=> "Litoral Ocidental Maranhense"
    #
    #           IBGE::Microrregiao.microrregioes_por_regiao(['NE', 'N'])
    #           IBGE::Microrregiao.microrregioes_por_regiao([1, 2])
    def self.microrregioes_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/microrregioes")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de microrregiões do Brasil a partir dos identificadores das mesorregiões.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de mesorregiões.
    # @return [Microrregiao, Array<Microrregiao>]
    #
    # @example
    #           microrregioes = IBGE::Microrregiao.microrregioes_por_mesorregiao(2303)
    #           microrregioes.first.nome #=> "Fortaleza"
    #
    #           microrregioes = IBGE::Microrregiao.microrregioes_por_mesorregiao([2303, 2304])
    def self.microrregioes_por_mesorregiao(mesorregioes)
      mesorregioes = IBGE.formatar(mesorregioes)
      resposta     = RestClient.get("#{BASE_URL}/mesorregioes/#{mesorregioes}/microrregioes")
      
      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      microrregioes = JSON.parse(resposta.body)

      if microrregioes.is_a?(Array) 
        microrregioes.map { |microrregiao| Microrregiao.new(microrregiao) }
      else
        Microrregiao.new(microrregioes)
      end 
    end
  end
end