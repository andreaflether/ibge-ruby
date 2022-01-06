module IBGE
  class Municipio
    attr_accessor :id, :nome, :microrregiao

    def initialize(options = {})
      @id = options['id']
      @nome = options['nome']
      @microrregiao = Microrregiao.new(options['microrregiao'])
    end
  end
end