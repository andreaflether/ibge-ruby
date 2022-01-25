module IBGE
  class Subdistrito
    attr_accessor :id, :nome, :distrito

    def initialize(options = {})
      @id = options['id']
      @nome = options['nome']
      @distrito = Distrito.new(options['distrito'])
    end

    # Obtém o conjunto de subdistritos do Brasil.
    #
    # @return [Array<Subdistrito>]
    #
    # @example
    #           subdistritos = IBGE::Subdistrito.obter_subdistritos
    #           subdistritos.first.nome #=> "Zona Central"
    def self.obter_subdistritos
      resposta = RestClient.get("#{BASE_URL}/subdistritos")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de subdistritos do Brasil a partir dos respectivos identificadores.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param ids [String, Integer, Array] Um ou mais identificadores de subdistritos.
    # @return [Array<Subdistrito>]
    #
    # @example
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_id('23044000512')
    #           subdistritos.first.nome #=> "Mucuripe"
    #
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_id(['23044000512', '23044006511'])
    def self.subdistritos_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/subdistritos/#{ids}")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de subdistritos do Brasil a partir dos identificadores das Unidades da Federação.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores. 
    # 
    # @param ufs [String, Integer, Array]
    # @return [Array<Subdistrito>]
    #
    # @example
    #           distritos = IBGE::Subdistrito.subdistritos_por_uf('CE')
    #           distritos.first.nome #=> "Antônio Bezerra"
    #
    #           IBGE::Subdistrito.subdistritos_por_uf(['BA', 'CE'])
    #           IBGE::Subdistrito.subdistritos_por_uf(23) 
    def self.subdistritos_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/subdistritos")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de subdistritos do Brasil a partir dos identificadores das regiões.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regioes [String, Integer, Array]
    # @return [Array<Subdistrito>]
    #
    # @example
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_regiao('NE')
    #           subdistritos.first.nome #=> "RPA I"
    #
    #           IBGE::Subdistrito.subdistritos_por_regiao(['NE', 'N'])
    #           IBGE::Subdistrito.subdistritos_por_regiao([1, 2])
    def self.subdistritos_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/subdistritos")
    
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de subdistritos do Brasil a partir dos identificadores das microrregiões.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param microrregioes [String, Integer, Array] Um ou mais identificadores de microrregiões.
    # @return [Array<Subdistrito>]
    #
    # @example
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_microrregiao(23016)
    #           subdistritos.last.nome #=> "Parangaba"
    #
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_microrregiao([23016, 23017])
    def self.subdistritos_por_microrregiao(microrregioes)
      microrregioes = IBGE.formatar(microrregioes)
      resposta      = RestClient.get("#{BASE_URL}/microrregioes/#{microrregioes}/subdistritos")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de subdistritos do Brasil a partir dos identificadores das mesorregiões.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param mesorregioes [String, Integer, Array] Um ou mais identificadores de mesorregiões.
    # @return [Array<Subdistrito>]
    #
    # @example
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_mesorregiao(2303)
    #           subdistritos.first.nome #=> "Antônio Bezerra"
    #
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_mesorregiao([2303, 2304])
    def self.subdistritos_por_mesorregiao(mesorregioes)
      mesorregioes = IBGE.formatar(mesorregioes)
      resposta     = RestClient.get("#{BASE_URL}/mesorregioes/#{mesorregioes}/subdistritos")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de subdistritos do Brasil a partir dos identificadores dos distritos.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param distritos [String, Integer, Array] um ou mais identificadores de distritos.
    # @return [Array<Subdistrito>]
    #
    # @example
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_distrito('230440005')
    #           subdistritos.last.nome #=> "Mucuripe"
    #
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_distrito(['230440005', '230370905'])
    def self.subdistritos_por_distrito(distritos)
      distritos = IBGE.formatar(distritos)
      resposta  = RestClient.get("#{BASE_URL}/distritos/#{distritos}/subdistritos")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de subdistritos do Brasil a partir dos identificadores dos municípios.
    # Pode ser informado um único ID ou um array de IDs.
    #
    # @param municipios [String, Integer, Array] um ou mais identificadores de municípios.
    # @return [Array<Subdistrito>]
    #
    # @example
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_municipio('2304400')
    #           subdistritos.last.nome #=> "Parangaba"
    #
    #           subdistritos = IBGE::Subdistrito.subdistritos_por_municipio(['2304400', '2927408'])
    def self.subdistritos_por_municipio(municipios)
      municipios = IBGE.formatar(municipios)
      resposta   = RestClient.get("#{BASE_URL}/municipios/#{municipios}/subdistritos")

      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      subdistritos = JSON.parse(resposta.body)

      subdistritos.map { |subdistrito| Subdistrito.new(subdistrito) }
    end
  end
end