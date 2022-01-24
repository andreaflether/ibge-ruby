module IBGE
  class Municipio
    attr_accessor :id, :nome, :microrregiao

    def initialize(options = {})
      @id = options['id']
      @nome = options['nome']
      @microrregiao = Microrregiao.new(options['microrregiao'])
    end

    # Obtém o conjunto de municípios do Brasil.

    # @return [Array<Municipio>]
    #
    # @example
    #           municipios = IBGE::Municipio.obter_municipios
    #           municipios.first.nome #=> "Alta Floresta D'Oeste"
    def self.obter_municipios
      resposta = RestClient.get("#{BASE_URL}/municipios")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de municípios do Brasil a partir dos respectivos identificadores.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de municípios.
    # @return [Municipio, Array<Municipio>]
    #
    # @example
    #           municipio = IBGE::Municipio.municipios_por_id(2307254)
    #           municipio.nome #=> "Jijoca de Jericoacoara"
    #
    #           municipios = IBGE::Municipio.municipios_por_id([2307254, 2302206])
    def self.municipios_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/municipios/#{ids}")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de municípios do Brasil a partir dos identificadores das Unidades da Federação.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores. 
    # 
    # @param ufs [String, Integer, Array]
    # @return [Array<Municipio>]
    #
    # @example
    #           municipios = IBGE::Municipio.municipios_por_uf('CE')
    #           municipios.first.nome #=> "Abaiara"
    #
    #           IBGE::Municipio.municipios_por_uf(['BA', 'CE'])
    #           IBGE::Municipio.municipios_por_uf(23) 
    def self.municipios_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/municipios")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de municípios do Brasil a partir dos identificadores das regiões.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regioes [String, Integer, Array]
    # @return [Array<Municipio>]
    #
    # @example
    #           municipios = IBGE::Municipio.municipios_por_regiao('NE')
    #           municipios.first.nome #=> "Açailândia"
    #
    #           IBGE::Municipio.municipios_por_regiao(['NE', 'N'])
    #           IBGE::Municipio.municipios_por_regiao([1, 2])
    def self.municipios_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/municipios")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de municípios do Brasil a partir dos identificadores das regiões imediatas.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de regiões imediatas.
    # @return [Array<Municipio>]
    #
    # @example
    #           municipios = IBGE::Municipio.municipios_por_regiao_imediata(230001)
    #           municipios.first.nome #=> "Aquiraz"
    #
    #           municipios = IBGE::Municipio.municipios_por_regiao_imediata([230001, 230002])
    def self.municipios_por_regiao_imediata(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes-imediatas/#{regioes}/municipios")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de municípios do Brasil a partir dos identificadores das regiões intermediárias.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de regiões intermediárias.
    # @return [Array<Municipio>]
    #
    # @example
    #           municipios = IBGE::Municipio.municipios_por_regiao_intermediaria(2301)
    #           municipios.first.nome #=> "Acarape"
    #
    #           municipios = IBGE::Municipio.municipios_por_regiao_intermediaria([2301, 2302])
    def self.municipios_por_regiao_intermediaria(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias/#{regioes}/municipios")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de municípios do Brasil a partir dos identificadores das microrregiões.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de microrregiões.
    # @return [Array<Municipio>]
    #
    # @example
    #           municipios = IBGE::Municipio.municipios_por_microrregiao(23016)
    #           municipios.last.nome #=> "Pacatuba"
    #
    #           municipios = IBGE::Municipio.municipios_por_microrregiao([23016, 23017])
    def self.municipios_por_microrregiao(microrregioes)
      microrregioes = IBGE.formatar(microrregioes)
      resposta      = RestClient.get("#{BASE_URL}/microrregioes/#{microrregioes}/municipios")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de municípios do Brasil a partir dos identificadores das mesorregiões.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de mesorregiões.
    # @return [Array<Municipio>]
    #
    # @example
    #           municipios = IBGE::Municipio.municipios_por_mesorregiao(2303)
    #           municipios.first.nome #=> "Aquiraz"
    #
    #           municipios = IBGE::Municipio.municipios_por_mesorregiao([2303, 2304])
    def self.municipios_por_mesorregiao(mesorregioes)
      mesorregioes = IBGE.formatar(mesorregioes)
      resposta     = RestClient.get("#{BASE_URL}/mesorregioes/#{mesorregioes}/municipios")

      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      municipios = JSON.parse(resposta.body)

      if municipios.is_a?(Array) 
        municipios.map { |municipio| Municipio.new(municipio) }
      else
        Municipio.new(municipios)
      end 
    end
  end
end