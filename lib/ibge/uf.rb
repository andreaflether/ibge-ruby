module IBGE
  class UF
    attr_accessor :id, :nome, :regiao

    def initialize(options = {})
      @id     = options['id']
      @nome   = options['nome']
      @regiao = Regiao.new(options['regiao'])
    end
  end
end