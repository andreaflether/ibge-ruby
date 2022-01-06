module IBGE
  class Microrregiao
    attr_accessor :id, :nome, :mesorregiao

    def initialize(options = {})
      @id          = options['id']
      @nome        = options['nome']
      @mesorregiao = Mesorregiao.new(options['mesorregiao'])
    end
  end
end