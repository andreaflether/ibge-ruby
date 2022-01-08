module IBGE
  class << self
    def formatar(parametro)
      parametro.is_a?(Array) ? parametro.join('%7C') : parametro
    end
  end
end 