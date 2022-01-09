module IBGE
  class RegiaoImediata
    attr_accessor :id, :nome, :regiao_intermediaria

    def initialize(options = {})
      @id                   = options['id']
      @nome                 = options['nome']
      @regiao_intermediaria = RegiaoIntermediaria.new(options['regiao-intermediaria'])
    end

    def self.obter_regioes_imediatas
      resposta = RestClient.get("#{BASE_URL}/regioes-imediatas")
      
      tratar_retorno(resposta)
    end

    def self.regioes_imediatas_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/regioes-imediatas/#{ids}")

      tratar_retorno(resposta)
    end

    def self.regioes_imediatas_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/regioes-imediatas")

      tratar_retorno(resposta)
    end

    def self.regioes_imediatas_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/regioes-imediatas")

      tratar_retorno(resposta)
    end

    def self.regioes_imediatas_por_intermediaria(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias/#{regioes}/regioes-imediatas")
    
      tratar_retorno(resposta)
    end

    private

    def self.tratar_retorno(resposta)
      regioes = JSON.parse(resposta.body)

      if regioes.is_a?(Array) 
        regioes.map { |regiao| RegiaoImediata.new(regiao) }
      else
        RegiaoImediata.new(regioes)
      end 
    end
  end
end