module IBGE
  class Microrregiao
    attr_accessor :id, :nome, :mesorregiao

    def initialize(options = {})
      @id          = options['id']
      @nome        = options['nome']
      @mesorregiao = Mesorregiao.new(options['mesorregiao'])
    end

    def self.obter_microrregioes
      resposta = RestClient.get("#{BASE_URL}/microrregioes")

      tratar_retorno(resposta)
    end
    
    def self.microrregioes_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/microrregioes/#{ids}")

      tratar_retorno(resposta)
    end
    
    def self.microrregioes_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/microrregioes")

      tratar_retorno(resposta)
    end

    def self.microrregioes_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/microrregioes")

      tratar_retorno(resposta)
    end

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