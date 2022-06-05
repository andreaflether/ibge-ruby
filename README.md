# IBGE Ruby

[![Gem Version](https://badge.fury.io/rb/ibge-ruby.svg)](http://badge.fury.io/rb/ibge-ruby)

A gem ibge-ruby permite você integrar a sua aplicação Ruby on Rails com todos os [serviços de localidade](https://servicodados.ibge.gov.br/api/docs/localidades) fornecidos pelo IBGE de maneira simples e rápida.

## Instalação

Adicione essa linha no Gemfile da sua aplicação:

    gem 'ibge-ruby'

E execute:

    $ bundle

Ou instale diretamente com o comando:

    $ gem install ibge-ruby

## Métodos

Cada link direciona para a documentação do IBGE com a descrição do método, entrada e saída. Ao lado é a referência de como utilizá-lo com a gem.

* __Distritos__
  * [Distritos](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-distritosGet) - `IBGE::Distrito.obter_distritos`
  * [Distritos por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-distritosIdGet) - `IBGE::Distrito.distritos_por_id(ids)`
  * [Distritos por UF](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-estadosUFDistritosGet) - `IBGE::Distrito.distritos_por_uf(ufs)`
  * [Distritos por mesorregião](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-mesorregioesMesorregiaoDistritosGet) - `IBGE::Distrito.distritos_por_mesorregiao(mesorregioes)`
  * [Distritos por microrregião](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-microrregioesMicrorregiaoDistritosGet) - `IBGE::Distrito.distritos_por_microrregiao(microrregioes)`
  * [Distritos por município](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-municipiosMunicipioDistritosGet) - `IBGE::Distrito.distritos_por_municipio(municipios)`
  * [Distritos por região imediata](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-regioesImediatasRegiaoImediataDistritosGet) - `IBGE::Distrito.distritos_por_regiao_imediata(regioes)`
  * [Distritos por região intermediária](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-regioesIntermediariasRegiaoIntermediariaDistritosGet) - `IBGE::Distrito.distritos_por_regiao_intermediaria(regioes)`
  * [Distritos por região](https://servicodados.ibge.gov.br/api/docs/localidades#api-Distritos-regioesMacrorregiaoDistritosGet) - `IBGE::Distrito.distritos_por_regiao(regioes)`

* __Mesorregiões__
  * [Mesorregiões](https://servicodados.ibge.gov.br/api/docs/localidades#api-Mesorregioes-mesorregioesGet) - `IBGE::Mesorregiao.obter_mesorregioes`
  * [Mesorregiões por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-Mesorregioes-mesorregioesMesorregiaoGet) - `IBGE::Mesorregiao.mesorregioes_por_id(ids)`
  * [Mesorregiões por UF](https://servicodados.ibge.gov.br/api/docs/localidades#api-Mesorregioes-estadosUFMesorregioesGet) - `IBGE::Mesorregiao.mesorregioes_por_uf(ufs)`
  * [Mesorregiões por região](https://servicodados.ibge.gov.br/api/docs/localidades#api-Mesorregioes-regioesMacrorregiaoMesorregioesGet) - `IBGE::Mesorregiao.mesorregioes_por_regiao(regioes)` 
  
* __Microrregiões__
  * [Microrregiões](https://servicodados.ibge.gov.br/api/docs/localidades#api-Microrregioes-microrregioesGet) - `IBGE::Microrregiao.obter_microrregioes`
  * [Microrregiões por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-Microrregioes-microrregioesMicrorregiaoGet) - `IBGE::Microrregiao.microrregioes_por_id(ids)`
  * [Microrregiões por UF](https://servicodados.ibge.gov.br/api/docs/localidades#api-Microrregioes-estadosUFMicrorregioesGet) - `IBGE::Microrregiao.microrregioes_por_uf(ufs)`
  * [Microrregiões por mesorregião](https://servicodados.ibge.gov.br/api/docs/localidades#api-Microrregioes-mesorregioesMesorregiaoMicrorregioesGet) - `IBGE::Microrregiao.microrregioes_por_mesorregiao(mesorregioes)`
  * [Microrregiões por região](https://servicodados.ibge.gov.br/api/docs/localidades#api-Microrregioes-regioesMacrorregiaoMicrorregioesGet) - `IBGE::Microrregiao.microrregioes_por_masorregiao(masorregioes)`

* __Municípios__
  * [Municípios](https://servicodados.ibge.gov.br/api/docs/localidades#api-Municipios-municipiosGet) - `IBGE::Municipio.obter_municipios`
  * [Municípios por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-Municipios-municipiosMunicipioGet) - `IBGE::Municipio.municipios_por_id(ids)`
  * [Municípios por UF](https://servicodados.ibge.gov.br/api/docs/localidades#api-Municipios-estadosUFMunicipiosGet) - `IBGE::Municipio.municipios_por_uf(ufs)`
  * [Municípios por mesorregião](https://servicodados.ibge.gov.br/api/docs/localidades#api-Municipios-mesorregioesMesorregiaoMunicipiosGet) - `IBGE::Municipio.municipios_por_mesorregiao(mesorregioes)`
  * [Municípios por microrregião](https://servicodados.ibge.gov.br/api/docs/localidades#api-Municipios-microrregioesMicrorregiaoMunicipiosGet) - `IBGE::Municipio.municipios_por_microrregiao(microrregioes)`
  * [Municípios por região imediata](https://servicodados.ibge.gov.br/api/docs/localidades#api-Municipios-regioesImediatasRegiaoImediataMunicipiosGet) - `IBGE::Municipio.municipios_por_regiao_imediata(regioes)`
  * [Municípios por região intermediária](https://servicodados.ibge.gov.br/api/docs/localidades#api-Municipios-regioesIntermediariasRegiaoIntermediariaMunicipiosGet) - `IBGE::Municipio.municipios_por_regiao_intermediaria(regioes)`
  * [Municípios por região](https://servicodados.ibge.gov.br/api/docs/localidades#api-Municipios-regioesMacrorregiaoMunicipiosGet) - `IBGE::Municipio.municipios_por_regiao(regioes)`
  
* __Países__
  * [Países](https://servicodados.ibge.gov.br/api/docs/localidades#api-Paises-paisesGet) - `IBGE::Pais.obter_paises`
  * [Países por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-Paises-paisesPaisGet) - `IBGE::Pais.paises_por_identificador(ids)`
  
* __Regiões__
  * [Regiões](https://servicodados.ibge.gov.br/api/docs/localidades#api-Regioes-regioesGet) - `IBGE::Regiao.obter_regioes`
  * [Regiões por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-Regioes-regioesMacrorregiaoGet) - `IBGE::Regiao.regioes_por_identificador(ids)`
  
* __Regiões Imediatas__
  * [Regiões imediatas](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesImediatas-regioesImediatasGet) - `IBGE::RegiaoImediata.obter_regioes_imediatas`
  * [Regiões imediatas por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesImediatas-regioesImediatasRegiaoImediataGet) - `IBGE::RegiaoImediata.regioes_imediatas_por_id(ids)`
  * [Regiões imediatas por UF](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesImediatas-estadosUFRegioesImediatasGet) - `IBGE::RegiaoImediata.regioes_imediatas_por_uf(ufs)`
  * [Regiões imediatas por regiões intermediárias](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesImediatas-regioesIntermediariasRegiaoIntermediariaRegioesImediatasGet) - `IBGE::RegiaoImediata.regioes_imediatas_por_intermediaria(regioes)`
  * [Regiões imediatas por região](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesImediatas-regioesMacrorregiaoRegioesImediatasGet) - `IBGE::RegiaoImediata.regioes_imediatas_por_regiao(regioes)`
  
* __Regiões Intermediárias__
  * [Regiões intermediárias](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesIntermediarias-regioesIntermediariasGet) - `IBGE::RegiaoIntermediaria.obter_regioes_intermediarias`
  * [Regiões intermediárias por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesIntermediarias-regioesIntermediariasRegiaoIntermediariaGet) - `IBGE::RegiaoIntermediaria.regioes_intermediarias_por_id(ids)`
  * [Regiões intermediárias por UF](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesIntermediarias-estadosUFRegioesIntermediariasGet) - `IBGE::RegiaoIntermediaria.regioes_intermediarias_por_uf(ufs)`
  * [Regiões intermediárias por região](https://servicodados.ibge.gov.br/api/docs/localidades#api-RegioesIntermediarias-regioesMacrorregiaoRegioesIntermediariasGet) - `IBGE::RegiaoIntermediaria.regioes_intermediarias_por_regiao(regioes)`
  
* __Subdistritos__
  * [Subdistritos](https://servicodados.ibge.gov.br/api/docs/localidades#api-Subdistritos-subdistritosGet) - `IBGE::Subdistrito.obter_subdistritos`
  * [Subdistritos por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-Subdistritos-subdistritosIdGet) - `IBGE::Subdistrito.subdistritos_por_id(ids)`
  * [Subdistritos por UF](https://servicodados.ibge.gov.br/api/docs/localidades#api-Subdistritos-estadosUFSubdistritosGet) - `IBGE::Subdistrito.subdistritos_por_uf(ufs)`
  * [Subdistritos por distrito](https://servicodados.ibge.gov.br/api/docs/localidades#api-Subdistritos-distritosDistritoSubdistritosGet) - `IBGE::Subdistrito.subdistritos_por_distrito(distritos)`
  * [Subdistritos por mesorregião](https://servicodados.ibge.gov.br/api/docs/localidades#api-Subdistritos-mesorregioesMesorregiaoSubdistritosGet) - `IBGE::Subdistrito.subdistritos_por_mesorregiao(mesorregioes)`
  * [Subdistritos por microrregião](https://servicodados.ibge.gov.br/api/docs/localidades#api-Subdistritos-microrregioesMicrorregiaoSubdistritosGet) - `IBGE::Subdistrito.subdistritos_por_microrregiao(microrregioes)`
  * [Subdistritos por município](https://servicodados.ibge.gov.br/api/docs/localidades#api-Subdistritos-municipiosMunicipioSubdistritosGet) - `IBGE::Subdistrito.subdistritos_por_municipio(municipios)`
  * [Subdistritos por região](https://servicodados.ibge.gov.br/api/docs/localidades#api-Subdistritos-regioesMacrorregiaoSubdistritosGet) - `IBGE::Subdistrito.subdistritos_por_regiao(regioes)`
  
* __UFs__
  * [UFs](https://servicodados.ibge.gov.br/api/docs/localidades#api-UFs-estadosGet) - `IBGE::UF.obter_ufs`
  * [UF por identificador](https://servicodados.ibge.gov.br/api/docs/localidades#api-UFs-estadosUFGet) - `IBGE::UF.ufs_por_identificador(ids)`
  * [UFs por região](https://servicodados.ibge.gov.br/api/docs/localidades#api-UFs-regioesMacrorregiaoEstadosGet) - `IBGE::UF.ufs_por_regiao(regioes)`

### Observações

1. Nas referências dos serviços, é possível enviar um ou mais parâmetros delimitados pelo caractere | (pipe). 
Na gem, ao utilizar serviços em que é possível enviar vários parâmetros (quase todos), utilize o formato de **array**.

❌ **Serviço IBGE**: `1|2|3`

✅ **Gem IBGE Ruby**: `[1, 2, 3]` ou `['1', '2', '3']`.

<sub>* Em alguns casos também é possível passar siglas. Verifique a seção Pesquisa por identificador (ID), sigla ou array de IDs/siglas.</sub>

2. No momento, esta gem não oferece suporte aos query parameters `orderBy` e `view`. Contudo, no Ruby, é possível simular o `orderBy` da seguinte forma:

```ruby
# Sem order by
regioes = IBGE::Regiao.obter_regioes.map(&:nome) #=> ['Norte', 'Nordeste', 'Sudeste', 'Sul', 'Centro-Oeste']

# Comportamento similar ao orderBy com Ruby
regioes = IBGE::Regiao.obter_regioes.sort_by(&:nome).map(&:nome) #=> ['Centro-Oeste', 'Nordeste', 'Norte', 'Sudeste', 'Sul']
```

## Utilização

Abaixo estão alguns exemplos de utilização da gem. Verifique a [documentação](https://www.rubydoc.info/gems/ibge-ruby/IBGE) para uma referência mais completa.

### Países

```ruby
require 'ibge'

paises = IBGE::Pais.obter_paises
paises.map(&:nome) #=> ['Afeganistão', 'Albânia', 'Argélia', 'Andorra', 'Angola'...]
```

### Regiões

```ruby
regioes = IBGE::Regiao.obter_regioes
regioes.map(&:nome) #=> ['Norte', 'Nordeste', 'Sudeste', 'Sul', 'Centro-Oeste']
regioes.first #=> #<IBGE::Regiao:0x0000555f7e83de38 @id=1, @nome="Norte", @sigla="N">
```

### Pesquisa por identificador (ID), sigla ou array de IDs/siglas

Em qualquer módulo que possua um método que faça referência aos recursos de **Região** ou **UFs**, é possível pesquisar pelo ID, sigla ou um array de IDs/siglas.

```ruby
IBGE::Municipio.municipios_por_regiao('NE') #=> mesma coisa de IBGE::Municipio.municipios_por_regiao(2)
IBGE::Municipio.municipios_por_regiao(['N', 'NE']) #=> mesma coisa de IBGE::Municipio.municipios_por_regiao([1, 2])

IBGE::Distrito.distritos_por_uf('CE') #=> mesma coisa de IBGE::Distrito.distritos_por_uf(23)
IBGE::Distrito.distritos_por_uf(['BA', 'CE]) #=> mesma coisa de IBGE::Distrito.distritos_por_uf([29, 23])
```

## Contribuindo

1. Faça um fork
2. Crie uma branch com a funcionalidade (`git checkout -b nova_funcionalidade`)
3. Faça um commit das suas mudanças (`git commit -am "[add] nova funcionalidade"`)
4. Faça um push para a branch (`git push origin nova_funcionalidade`)
5. Crie um pull request
