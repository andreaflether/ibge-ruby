module IBGE
  class Regiao
    attr_accessor :id, :nome, :sigla

    def initialize(options = {})
      @id    = options['id']
      @nome  = options['nome']
      @sigla = options['sigla']
    end
  end
end