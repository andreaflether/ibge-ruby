module IBGE
  class Pais
    attr_accessor :id, :nome, :regiao_intermediaria, :sub_regiao

    def initialize(options = {})
      @id                   = options['id']
      @nome                 = options['nome']
      @regiao_intermediaria = options['regiao-intermediaria']
      @sub_regiao           = options['sub-regiao']
    end

    # Obtém o conjunto de países.
    # 
    # @return [Array<Pais>]
    #
    # @example
    #           paises = IBGE::Pais.obter_paises
    #           paises.first.nome #=> "Afeganistão"
    #           paises.first.class #=> IBGE::Pais
    def self.obter_paises
      resposta = RestClient.get("#{BASE_URL}/paises")
      
      tratar_retorno(resposta)
    end

    # Obtém o conjunto de países a partir dos respectivos identificadores.
    # Pode ser informado o identificador (ID) ou um array de identificadores.
    #
    # @param paises[Integer, String, Array]
    # @return [Array<Pais>]
    #
    # @example
    #           pais = IBGE::Pais.paises_por_identificador(76)
    #           pais.nome #=> "Brasil"
    #
    #           paises = IBGE::Pais.paises_por_identificador([32, 76])
    #           paises.map(&:nome) #=> ["Argentina", "Brasil"]
    def self.paises_por_identificador(paises)
      paises   = IBGE.formatar(paises)
      resposta = RestClient.get("#{BASE_URL}/paises/#{paises}")
      
      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      paises = JSON.parse(resposta.body)

      paises.map { |pais| Pais.new(pais) }
    end
  end
end
