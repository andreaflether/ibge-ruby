module IBGE
  class Regiao
    attr_accessor :id, :nome, :sigla

    def initialize(options = {})
      @id    = options['id']
      @nome  = options['nome']
      @sigla = options['sigla']
    end

    # Obtém o conjunto de regiões do Brasil.
    #
    # @return [<Array[Regiao]>]
    #
    # @example
    #           regioes = IBGE::Regiao.obter_regioes
    #           regioes.map(&:sigla) #=> ["N", "NE", "SE", "S", "CO"]
    def self.obter_regioes
      resposta = RestClient.get("#{BASE_URL}/regioes")

      tratar_retorno(resposta)
    end

    # Obtém o conjunto de regiões do Brasil a partir dos respectivos identificadores.
    # Pode ser informada a sigla, identificador (ID) ou um array de siglas/identificadores.
    #
    # @param regioes [String, Integer, Array]
    # @return [Regiao, <Array[Regiao]>]
    #
    # @example
    #           regiao = IBGE::Regiao.regioes_por_identificador('NE')
    #           regiao.nome #=> "Nordeste"
    #
    #           regioes = IBGE::Regiao.regioes_por_identificador([1, 2])
    #           regioes.map(&:sigla) #=> ["N", "NE"]
    def self.regioes_por_identificador(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}")

      tratar_retorno(resposta)
    end
    
    private

    def self.tratar_retorno(resposta)
      regioes = JSON.parse(resposta.body)

      if regioes.is_a?(Array) 
        regioes.map { |regiao| Regiao.new(regiao) }
      else
        Regiao.new(regioes)
      end 
    end
  end
end