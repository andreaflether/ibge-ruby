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

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de Unidades da Federação do Brasil a partir dos respectivos identificadores.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param uf [String, Integer, Array]
    # @return [UF, Array<UF>]
    #
    # @example
    #           uf = IBGE::UF.uf_por_identificador('CE')
    #
    #           ufs = IBGE::UF.ufs_por_identificador(['BA', 'CE'])
    def self.ufs_por_identificador(uf)
      uf       = IBGE.formatar(uf)
      resposta = RestClient.get("#{BASE_URL}/estados/#{uf}")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de Unidades da Federação do Brasil a partir dos identificadores das regiões.
    # Pode ser informada a sigla, o identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regiao [String, Integer, Array]
    # @return [Array<UF>]
    #
    # @example
    #           ufs = IBGE::UF.ufs_por_regiao('NE')
    #           ufs.first.nome #=> "Maranhão"
    #
    #           ufs = IBGE::UF.ufs_por_regiao(['NE', 'N'])
    #           ufs.map(&:nome) #=> ['Ceará', 'Amazonas'...]
    def self.ufs_por_regiao(regiao)
      regiao   = IBGE.formatar(regiao)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regiao}/estados")

      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      ufs = JSON.parse(resposta.body)

      if ufs.is_a?(Array) 
        ufs.map { |uf| UF.new(uf) }
      else
        UF.new(ufs)
      end 
    end
  end
end