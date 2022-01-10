module IBGE
  class RegiaoIntermediaria
    attr_accessor :id, :nome, :uf

    def initialize(options = {})
      @id   = options['id']
      @nome = options['nome']
      @uf   = UF.new(options['UF'])
    end

    def self.obter_regioes_intermediarias
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias")

      tratar_retorno(resposta)
    end

    def self.regioes_intermediarias_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias/#{ids}")
      
      tratar_retorno(resposta)
    end

    def self.regioes_intermediarias_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/regioes-intermediarias")
      
      tratar_retorno(resposta)
    end

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