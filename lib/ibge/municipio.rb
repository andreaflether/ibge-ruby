module IBGE
  class Municipio
    attr_accessor :id, :nome, :microrregiao

    def initialize(options = {})
      @id = options['id']
      @nome = options['nome']
      @microrregiao = Microrregiao.new(options['microrregiao'])
    end

    def self.obter_municipios
      resposta = RestClient.get("#{BASE_URL}/municipios")
      
      tratar_retorno(resposta)
    end

    def self.municipios_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/municipios/#{ids}")
    
      tratar_retorno(resposta)
    end

    def self.municipios_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/municipios")
    
      tratar_retorno(resposta)
    end

    def self.municipios_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/municipios")
    
      tratar_retorno(resposta)
    end

    def self.municipios_por_regiao_imediata(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes-imediatas/#{regioes}/municipios")
    
      tratar_retorno(resposta)
    end

    def self.municipios_por_regiao_intermediaria(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes-intermediarias/#{regioes}/municipios")
    
      tratar_retorno(resposta)
    end

    def self.municipios_por_microrregiao(microrregioes)
      microrregioes = IBGE.formatar(microrregioes)
      resposta      = RestClient.get("#{BASE_URL}/microrregioes/#{microrregioes}/municipios")

      tratar_retorno(resposta)
    end

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