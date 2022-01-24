require 'rest-client'
require 'json'
require 'ibge/utils'

module IBGE
  BASE_URL = 'https://servicodados.ibge.gov.br/api/v1/localidades'

  autoload :Distrito,            'ibge/distrito'
  autoload :Estado,              'ibge/estado'
  autoload :Mesorregiao,         'ibge/mesorregiao'
  autoload :Microrregiao,        'ibge/microrregiao'
  autoload :Municipio,           'ibge/municipio'
  autoload :Subdistrito,         'ibge/subdistrito'
  autoload :Regiao,              'ibge/regiao'
  autoload :RegiaoImediata,      'ibge/regiao_imediata'
  autoload :RegiaoIntermediaria, 'ibge/regiao_intermediaria'
  autoload :Pais,                'ibge/pais'
  autoload :UF,                  'ibge/uf'
end