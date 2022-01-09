module IBGE
  class RegiaoIntermediaria
    attr_accessor :id, :nome, :uf

    def initialize(options = {})
      @id   = options['id']
      @nome = options['nome']
      @uf   = UF.new(options['UF'])
    end

    def self.obter_regioes_intermediarias; end

    def self.regioes_intermediarias_por_id(ids); end

    def self.regioes_intermediarias_por_uf(ufs); end

    def self.regioes_intermediarias_por_regiao(regioes); end
  end
end