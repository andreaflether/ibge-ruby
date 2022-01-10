module IBGE
  class RegiaoImediata
    attr_accessor :id, :nome, :regiao_intermediaria

    def initialize(options = {})
      @id                   = options['id']
      @nome                 = options['nome']
      @regiao_intermediaria = RegiaoIntermediaria.new(options['regiao-intermediaria'])
    end

    # Obtém o conjunto de regiões imediatas do Brasil.
    #
    # @return [Array<RegiaoImediata>]
    #
    # @example
    #           regioes = IBGE::RegiaoImediata.obter_regioes_imediatas
    #           regioes.first.nome #=> "Porto Velho" 
    def self.obter_regioes_imediatas
      resposta = RestClient.get("#{BASE_URL}/regioes-imediatas")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de regiões imediatas do Brasil a partir dos respectivos identificadores.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de regiões imediatas.
    # @return [RegiaoImediata, Array<RegiaoImediata>]
    #
    # @example
    #           regiao = IBGE::RegiaoImediata.regioes_imediatas_por_id(230001)
    #           regiao.nome #=> "Fortaleza"
    #
    #           regioes = IBGE::RegiaoImediata.regioes_imediatas_por_id([230001, 230002])
    def self.regioes_imediatas_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/regioes-imediatas/#{ids}")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de regiões imediatas do Brasil a partir dos identificadores das Unidades da Federação.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores. 
    # 
    # @param ufs [String, Integer, Array]
    # @return [Array<RegiaoImediata>]
    #
    # @example
    #           regioes = IBGE::RegiaoImediata.regioes_imediatas_por_uf('CE')
    #           regioes.first.nome #=> "Fortaleza"
    #
    #           IBGE::RegiaoImediata.regioes_imediatas_por_uf(['BA', 'CE'])
    #           IBGE::RegiaoImediata.regioes_imediatas_por_uf(23)
    def self.regioes_imediatas_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/regioes-imediatas")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de regiões imediatas do Brasil a partir dos identificadores das regiões.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regioes [String, Integer, Array] Um ou mais identificadores de regiões.
    # @return [Array<RegiaoImediata>]
    #
    # @example
    #           regioes = IBGE::RegiaoImediata.regioes_imediatas_por_regiao('NE')
    #           regioes.first.nome #=> "São Luís"
    #
    #           IBGE::RegiaoImediata.regioes_imediatas_por_regiao(['NE', 'N'])
    #           IBGE::RegiaoImediata.regioes_imediatas_por_regiao([1, 2])
    def self.regioes_imediatas_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/regioes-imediatas")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de regiões imediatas do Brasil a partir dos identificadores das regiões intermediárias.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de regiões intermediárias.
    # @return [Array<RegiaoImediata>]
    #
    # @example
    #           regiao = IBGE::RegiaoImediata.regioes_imediatas_por_intermediaria(2301)
    #           regiao.nome #=> "Fortaleza"
    #
    #           regioes = IBGE::RegiaoImediata.regioes_imediatas_por_intermediaria([2301, 2302])
    def self.regioes_imediatas_por_intermediaria(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias/#{regioes}/regioes-imediatas")
    
      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      regioes = JSON.parse(resposta.body)

      if regioes.is_a?(Array) 
        regioes.map { |regiao| RegiaoImediata.new(regiao) }
      else
        RegiaoImediata.new(regioes)
      end 
    end
  end
end