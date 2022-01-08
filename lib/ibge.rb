require 'rest-client'
require 'json'
require 'ibge/utils'

module IBGE
  BASE_URL = "https://servicodados.ibge.gov.br/api/v1/localidades"

  autoload :Distrito,     'ibge/distrito'
  autoload :Estado,       'ibge/estado'
  autoload :Mesorregiao,  'ibge/mesorregiao'
  autoload :Microrregiao, 'ibge/microrregiao'
  autoload :Municipio,    'ibge/municipio'
  autoload :Regiao,       'ibge/regiao'
  autoload :Pais,         'ibge/pais'
  autoload :UF,           'ibge/uf'
end