describe IBGE::Municipio do
  shared_examples_for 'objeto' do
    it 'deve retornar o nome Jijoca de Jericoacoara' do
      expect(subject.nome).to eq('Jijoca de Jericoacoara')
    end

    it 'deve retornar o ID 2307254' do
      expect(subject.id).to eq('2307254')
    end

    it 'deve retornar a microrregião, que é um objeto IBGE::Microrregiao' do
      expect(subject.microrregiao).to be_an IBGE::Microrregiao
    end
  end

  shared_examples_for 'array' do |tamanho|
    it 'deve retornar um Array<IBGE::Municipio>' do
      aggregate_failures do
        is_expected.to be_an Array
        expect(subject.first).to be_an IBGE::Municipio
      end
    end
  end

  describe '.obter_municipios' do
    subject do
      VCR.use_cassette('municipio/obter_municipios') do
        IBGE::Municipio.obter_municipios
      end
    end

    it_has_behavior 'array'
  end

  describe '.municipios_por_id' do
    context 'recebendo um array de IDs (["2307254", "2302206"]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_id:2307254|2302206', erb: { param: '2307254%7C2302206' }) do
          IBGE::Municipio.municipios_por_id(%w(2307254 2302206))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID ("2307254") como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_id:2307254', erb: { param: '2307254' }) do
          IBGE::Municipio.municipios_por_id('2307254')
        end
      end

      it_has_behavior 'objeto'
    end
  end

  describe '.municipios_por_uf' do
    context 'recebendo um array de siglas (["BA", "CE"]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_uf:BA|CE', erb: { param: 'BA%7CCE' }) do
          IBGE::Municipio.municipios_por_uf(%w(BA CE)).first(20)
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([29, 23]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_uf:BA|CE', erb: { param: '29%7C23' }) do
          IBGE::Municipio.municipios_por_uf([29, 23]).first(20)
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (CE) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_uf:CE', erb: { param: 'CE' }) do
          IBGE::Municipio.municipios_por_uf('CE')
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_uf:CE', erb: { param: 23 }) do
          IBGE::Municipio.municipios_por_uf(23)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.municipios_por_regiao' do
    context 'recebendo um array de siglas (["N", "NE"]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_regiao:N|NE', erb: { param: 'N%7CNE' }) do
          IBGE::Municipio.municipios_por_regiao(%w(N NE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([1, 2]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_regiao:N|NE', erb: { param: '1%7C2' }) do
          IBGE::Municipio.municipios_por_regiao([1, 2])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_regiao:NE', erb: { param: 2 }) do
          IBGE::Municipio.municipios_por_regiao(2)
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (NE) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_regiao:NE', erb: { param: 'NE' }) do
          IBGE::Municipio.municipios_por_regiao('NE')
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.municipios_por_regiao_imediata' do
    context 'recebendo um array de IDs ([230001, 230002]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_regiao_imediata:230001|230002', erb: { param: '230001%7C230002' }) do
          IBGE::Municipio.municipios_por_regiao_imediata([230001, 230002])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (230001) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_regiao_imediata:230001', erb: { param: '230001' }) do
          IBGE::Municipio.municipios_por_regiao_imediata(230001)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.municipios_por_regiao_intermediaria' do
    context 'recebendo um array de IDs ([2301, 2302]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_regiao_intermediaria:2301|2302', erb: { param: '2301%7C23017' }) do
          IBGE::Municipio.municipios_por_regiao_intermediaria([2301, 2302])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2301) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_regiao_intermediaria:2301', erb: { param: '2301' }) do
          IBGE::Municipio.municipios_por_regiao_intermediaria(2301)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.municipios_por_mesorregiao' do
    context 'recebendo um array de IDs ([2303, 2304]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_mesorregiao:2303|2304', erb: { param: '2303%7C2304' }) do
          IBGE::Municipio.municipios_por_mesorregiao([2303, 2304])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2303) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_mesorregiao:2303', erb: { param: '2303' }) do
          IBGE::Municipio.municipios_por_mesorregiao(2303)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.municipios_por_microrregiao' do
    context 'recebendo um array de IDs ([23016, 23017]) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_microrregiao:23016|23017', erb: { param: '23016%7C23017' }) do
          IBGE::Municipio.municipios_por_microrregiao([23016, 23017])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23016) como parâmetro' do
      subject do
        VCR.use_cassette('municipio/municipios_por_microrregiao:23016', erb: { param: '23016' }) do
          IBGE::Municipio.municipios_por_microrregiao(23016)
        end
      end

      it_has_behavior 'array'
    end
  end
end