module IBGE
  class Distrito
    attr_accessor :id, :nome, :municipio

    def initialize(options = {})
      @id        = options['id']
      @nome      = options['nome']
      @municipio = Municipio.new(options['municipio'])
    end

    def self.obter_distritos
      resposta = RestClient.get("#{BASE_URL}/distritos")
      
      tratar_retorno(resposta)
    end
    
    def self.distritos_por_id(ids)
      ids        = IBGE.formatar(ids)
      resposta   = RestClient.get("#{BASE_URL}/distritos/#{ids}")
    
      tratar_retorno(resposta)
    end

    def self.distritos_por_uf(ufs)
      ufs        = IBGE.formatar(ufs)
      resposta   = RestClient.get("#{BASE_URL}/estados/#{ufs}/distritos")
    
      tratar_retorno(resposta)
    end

    def self.distritos_por_regiao(regioes)
      regioes   = IBGE.formatar(regioes)
      resposta  = RestClient.get("#{BASE_URL}/regioes/#{regioes}/distritos")
      
      tratar_retorno(resposta)
    end

    def self.distritos_por_municipio(municipios)
      municipios = IBGE.formatar(municipios) 
      resposta   = RestClient.get("#{BASE_URL}/municipios/#{municipios}/distritos")
      
      tratar_retorno(resposta)
    end

    def self.distritos_por_regiao_imediata(regioes)
      regioes   = IBGE.formatar(regioes)
      resposta  = RestClient.get("#{BASE_URL}/regioes-imediatas/#{regioes}/distritos")
    
      tratar_retorno(resposta)
    end

    def self.distritos_por_regiao_intermediaria(regioes)
      regioes    = IBGE.formatar(regioes)
      resposta  = RestClient.get("#{BASE_URL}/regioes-intermediarias/#{regioes}/distritos")
    
      tratar_retorno(resposta)
    end

    def self.distritos_por_mesorregiao(mesorregioes)
      mesorregioes = IBGE.formatar(mesorregioes)
      resposta     = RestClient.get("#{BASE_URL}/mesorregioes/#{mesorregioes}/distritos")
    
      tratar_retorno(resposta)
    end

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

