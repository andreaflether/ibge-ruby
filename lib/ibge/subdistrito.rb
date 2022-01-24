module IBGE
  class Subdistrito
    attr_accessor :id, :nome, :distrito

    def initialize(options = {})
      @id = options['id']
      @nome = options['nome']
      @distrito = Distrito.new(options['distrito'])
    end

    def self.obter_subdistritos
      resposta = RestClient.get("#{BASE_URL}/subdistritos")
      
      tratar_retorno(resposta)
    end

    def self.subdistritos_por_id(ids)
      ids      = IBGE.formatar(ids)
      resposta = RestClient.get("#{BASE_URL}/subdistritos/#{ids}")
    
      tratar_retorno(resposta)
    end

    def self.subdistritos_por_uf(ufs)
      ufs      = IBGE.formatar(ufs)
      resposta = RestClient.get("#{BASE_URL}/estados/#{ufs}/subdistritos")
    
      tratar_retorno(resposta)
    end

    def self.subdistritos_por_regiao(regioes)
      regioes  = IBGE.formatar(regioes)
      resposta = RestClient.get("#{BASE_URL}/regioes/#{regioes}/subdistritos")
    
      tratar_retorno(resposta)
    end

    def self.subdistritos_por_microrregiao(microrregioes)
      microrregioes = IBGE.formatar(microrregioes)
      resposta      = RestClient.get("#{BASE_URL}/microrregioes/#{microrregioes}/subdistritos")

      tratar_retorno(resposta)
    end

    def self.subdistritos_por_mesorregiao(mesorregioes)
      mesorregioes = IBGE.formatar(mesorregioes)
      resposta     = RestClient.get("#{BASE_URL}/mesorregioes/#{mesorregioes}/subdistritos")

      tratar_retorno(resposta)
    end

    def self.subdistritos_por_distrito(distritos)
      distritos = IBGE.formatar(distritos)
      resposta  = RestClient.get("#{BASE_URL}/distritos/#{distritos}/subdistritos")

      tratar_retorno(resposta)
    end

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