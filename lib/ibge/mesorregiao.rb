module IBGE
  class Mesorregiao
    attr_accessor :id, :nome, :uf

    def initialize(options = {})
      @id   = options['id']
      @nome = options['nome']
      @uf   = IBGE::UF.new(options['UF'])
    end

    def self.obter_mesorregioes
      resposta = RestClient.get("#{BASE_URL}/mesorregioes")

      tratar_retorno(resposta)
    end

    def self.mesorregioes_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/mesorregioes")

      tratar_retorno(resposta)
    end

    def self.mesorregioes_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/mesorregioes/#{ids}")
      
      tratar_retorno(resposta)
    end

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