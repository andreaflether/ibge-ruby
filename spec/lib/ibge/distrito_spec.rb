describe IBGE::Distrito do
  shared_examples_for 'objeto' do
    it 'deve retornar o nome Fortaleza' do
      expect(subject.first.nome).to eq('Fortaleza')
    end

    it 'deve retornar o ID 230440005' do
      expect(subject.first.id).to eq("230440005")
    end

    it 'deve retornar o município, que é um objeto IBGE::Municipio' do
      expect(subject.first.municipio).to be_an IBGE::Municipio
    end
  end

  shared_examples_for 'array' do |tamanho|
    it 'deve retornar um Array<IBGE::Distrito>' do
      aggregate_failures do
        is_expected.to be_an Array
        expect(subject.first).to be_an IBGE::Distrito
      end
    end
  end

  describe '.obter_distritos' do
    subject do
      VCR.use_cassette('distrito/obter_distritos') do
        IBGE::Distrito.obter_distritos
      end
    end

    it_has_behavior 'array'
  end

  describe '.distritos_por_id' do
    context 'recebendo um array de IDs (["230440005", "230370905"]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_id:230440005|230370905', erb: { param: '230440005%7C230370905' }) do
          IBGE::Distrito.distritos_por_id(%w(230440005 230370905))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID ("230440005") como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_id:230440005', erb: { param: '230440005' }) do
          IBGE::Distrito.distritos_por_id('230440005')
        end
      end

      it_has_behavior 'objeto'
    end
  end

  describe '.distritos_por_uf' do
    context 'recebendo um array de siglas (["BA", "CE"]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_uf:BA|CE', erb: { param: 'BA%7CCE' }) do
          IBGE::Distrito.distritos_por_uf(%w(BA CE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([29, 23]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_uf:BA|CE', erb: { param: '29%7C23' }) do
          IBGE::Distrito.distritos_por_uf([29, 23])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (CE) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_uf:CE', erb: { param: 'CE' }) do
          IBGE::Distrito.distritos_por_uf('CE')
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_uf:CE', erb: { param: 23 }) do
          IBGE::Distrito.distritos_por_uf(23)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.distritos_por_regiao' do
    context 'recebendo um array de siglas (["N", "NE"]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_regiao:N|NE', erb: { param: 'N%7CNE' }) do
          IBGE::Distrito.distritos_por_regiao(%w(N NE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([1, 2]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_regiao:N|NE', erb: { param: '1%7C2' }) do
          IBGE::Distrito.distritos_por_regiao([1, 2])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_regiao:NE', erb: { param: 2 }) do
          IBGE::Distrito.distritos_por_regiao(2)
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (NE) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_regiao:NE', erb: { param: 'NE' }) do
          IBGE::Distrito.distritos_por_regiao('NE')
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.distritos_por_municipio' do
    context 'recebendo um array de IDs (["2307254", "2302206"]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_municipio:2307254|2302206', erb: { param: '2307254%7C2302206' }) do
          IBGE::Distrito.distritos_por_municipio(['2307254', '2302206'])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID ("2307254") como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_municipio:2307254', erb: { param: '2307254' }) do
          IBGE::Distrito.distritos_por_municipio('2307254')
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.distritos_por_regiao_imediata' do
    context 'recebendo um array de IDs ([230001, 230002]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_regiao_imediata:230001|230002', erb: { param: '230001%7C230002' }) do
          IBGE::Distrito.distritos_por_regiao_imediata([230001, 230002])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (230001) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_regiao_imediata:230001', erb: { param: '230001' }) do
          IBGE::Distrito.distritos_por_regiao_imediata(230001)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.distritos_por_regiao_intermediaria' do
    context 'recebendo um array de IDs ([2301, 2302]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_regiao_intermediaria:2301|2302', erb: { param: '2301%7C23017' }) do
          IBGE::Distrito.distritos_por_regiao_intermediaria([2301, 2302])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2301) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_regiao_intermediaria:2301', erb: { param: '2301' }) do
          IBGE::Distrito.distritos_por_regiao_intermediaria(2301)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.distritos_por_mesorregiao' do
    context 'recebendo um array de IDs ([2303, 2304]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_mesorregiao:2303|2304', erb: { param: '2303%7C2304' }) do
          IBGE::Distrito.distritos_por_mesorregiao([2303, 2304])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2303) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_mesorregiao:2303', erb: { param: '2303' }) do
          IBGE::Distrito.distritos_por_mesorregiao(2303)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.distritos_por_microrregiao' do
    context 'recebendo um array de IDs ([23016, 23017]) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_microrregiao:23016|23017', erb: { param: '23016%7C23017' }) do
          IBGE::Distrito.distritos_por_microrregiao([23016, 23017])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23016) como parâmetro' do
      subject do
        VCR.use_cassette('distrito/distritos_por_microrregiao:23016', erb: { param: '23016' }) do
          IBGE::Distrito.distritos_por_microrregiao(23016)
        end
      end

      it_has_behavior 'array'
    end
  end
end