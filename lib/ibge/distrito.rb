module IBGE
  class Distrito
    attr_accessor :id, :nome, :municipio

    def initialize(options = {})
      @id        = options['id']
      @nome      = options['nome']
      @municipio = Municipio.new(options['municipio'])
    end

    # Obtém o conjunto de distritos do Brasil.
    #
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.obter_distritos
    #           distritos.first.nome #=> "Abadia de Goiás"
    def self.obter_distritos
      resposta = RestClient.get("#{BASE_URL}/distritos")
      
      tratar_retorno(resposta)
    end
    
    # Obtém o conjunto de distritos do Brasil a partir dos respectivos identificadores.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de distritos.
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.distritos_por_id(230440005)
    #           distritos.first.nome #=> "Fortaleza"
    #
    #           distritos = IBGE::Distrito.distritos_por_id([230440005, 230370905])
    def self.distritos_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/distritos/#{ids}")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de distritos do Brasil a partir dos identificadores das Unidades da Federação.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores. 
    # 
    # @param ufs [String, Integer, Array]
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.distritos_por_uf('CE')
    #           distritos.last.nome #=> "Quatiguaba"
    #
    #           IBGE::Distrito.distritos_por_uf(['BA', 'CE'])
    #           IBGE::Distrito.distritos_por_uf(23) 
    def self.distritos_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/distritos")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de distritos do Brasil a partir dos identificadores das regiões.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regioes [String, Integer, Array]
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.distritos_por_regiao('NE')
    #           distritos.last.nome #=> "Zé Doca"
    #
    #           IBGE::Distrito.distritos_por_regiao(['NE', 'N'])
    #           IBGE::Distrito.distritos_por_regiao([1, 2])
    def self.distritos_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/distritos")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de distritos do Brasil a partir dos identificadores dos municípios.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param municipios [String, Integer, Array]
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.distritos_por_municipio('2307254')
    #           distritos.first.nome #=> "Jijoca de Jericoacoara"
    #
    #           distritos = IBGE::Distrito.distritos_por_regiao(["2307254", "2302206"])
    def self.distritos_por_municipio(municipios)
      municipios = IBGE.formatar(municipios) 
      resposta   = RestClient.get("#{BASE_URL}/municipios/#{municipios}/distritos")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de distritos do Brasil a partir dos identificadores das regiões imediatas.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de regiões imediatas.
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.distritos_por_regiao_imediata(230001)
    #           distritos.first.nome #=> "Aquiraz"
    #
    #           distritos = IBGE::Distrito.distritos_por_regiao_imediata([230001, 230002])
    def self.distritos_por_regiao_imediata(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes-imediatas/#{regioes}/distritos")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de distritos do Brasil a partir dos identificadores das regiões intermediárias.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de regiões intermediárias.
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.distritos_por_regiao_intermediaria(2301)
    #           distritos.first.nome #=> "Acarape"
    #
    #           distritos = IBGE::Distrito.distritos_por_regiao_intermediaria([2301, 2302])
    def self.distritos_por_regiao_intermediaria(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias/#{regioes}/distritos")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de distritos do Brasil a partir dos identificadores das mesorregiões.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de mesorregiões.
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.distritos_por_mesorregiao(2303)
    #           distritos.first.nome #=> "Aquiraz"
    #
    #           distritos = IBGE::Distrito.distritos_por_mesorregiao([2303, 2304])
    def self.distritos_por_mesorregiao(mesorregioes)
      mesorregioes = IBGE.formatar(mesorregioes)
      resposta     = RestClient.get("#{BASE_URL}/mesorregioes/#{mesorregioes}/distritos")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de distritos do Brasil a partir dos identificadores das microrregiões.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de microrregiões.
    # @return [Array<Distrito>]
    #
    # @example
    #           distritos = IBGE::Distrito.distritos_por_microrregiao(23016)
    #           distritos.last.nome #=> "Senador Carlos Jereissati"
    #
    #           distritos = IBGE::Distrito.distritos_por_microrregiao([23016, 23017])
    def self.distritos_por_microrregiao(microrregioes)
      microrregioes = IBGE.formatar(microrregioes)
      resposta      = RestClient.get("#{BASE_URL}/microrregioes/#{microrregioes}/distritos")
    
      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      distritos = JSON.parse(resposta.body)

      distritos.map { |distrito| Distrito.new(distrito) }
    end
  end
end

