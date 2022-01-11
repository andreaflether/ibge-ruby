module IBGE
  class RegiaoIntermediaria
    attr_accessor :id, :nome, :uf

    def initialize(options = {})
      @id   = options['id']
      @nome = options['nome']
      @uf   = UF.new(options['UF'])
    end

    # Obtém o conjunto de regiões intermediárias do Brasil.
    #
    # @return [Array<RegiaoIntermediaria>]
    #
    # @example
    #           regioes = IBGE::RegiaoIntermediaria.obter_regioes_intermediarias
    #           regioes.first.nome #=> "Porto Velho" 
    def self.obter_regioes_intermediarias
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de regiões intermediárias do Brasil a partir dos respectivos identificadores.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de regiões intermediárias.
    # @return [RegiaoIntermediaria, Array<RegiaoIntermediaria>]
    #
    # @example
    #           regiao = IBGE::RegiaoIntermediaria.regioes_intermediarias_por_id(2301)
    #           regiao.nome #=> "Fortaleza"
    #
    #           regioes = IBGE::RegiaoIntermediaria.regioes_intermediarias_por_id([2301, 2302])
    def self.regioes_intermediarias_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias/#{ids}")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de regiões intermediárias do Brasil a partir dos identificadores das Unidades da Federação.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores. 
    # 
    # @param ufs [String, Integer, Array]
    # @return [Array<RegiaoIntermediaria>]
    #
    # @example
    #           regioes = IBGE::RegiaoIntermediaria.regioes_intermediarias_por_uf('CE')
    #           regioes.first.nome #=> "Fortaleza"
    #
    #           IBGE::RegiaoIntermediaria.regioes_intermediarias_por_uf(['BA', 'CE'])
    #           IBGE::RegiaoIntermediaria.regioes_intermediarias_por_uf(23)
    def self.regioes_intermediarias_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/regioes-intermediarias")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de regiões intermediárias do Brasil a partir dos identificadores das regiões.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regioes [String, Integer, Array] Um ou mais identificadores de regiões.
    # @return [Array<RegiaoIntermediaria>]
    #
    # @example
    #           regioes = IBGE::RegiaoIntermediaria.regioes_intermediarias_por_regiao('NE')
    #           regioes.first.nome #=> "São Luís"
    #
    #           IBGE::RegiaoIntermediaria.regioes_intermediarias_por_regiao(['NE', 'N'])
    #           IBGE::RegiaoIntermediaria.regioes_intermediarias_por_regiao([1, 2])
    def self.regioes_intermediarias_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/regioes-intermediarias")
      
      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      regioes = JSON.parse(resposta.body)

      if regioes.is_a?(Array) 
        regioes.map { |regiao| RegiaoIntermediaria.new(regiao) }
      else
        RegiaoIntermediaria.new(regioes)
      end 
    end
  end
end