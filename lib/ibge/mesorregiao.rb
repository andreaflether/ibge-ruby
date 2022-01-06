module IBGE
  class Mesorregiao
    attr_accessor :id, :nome, :uf

    def initialize(options = {})
      @id   = options['id']
      @nome = options['nome']
      @uf   = IBGE::UF.new(options['UF'])
    end
  end
end