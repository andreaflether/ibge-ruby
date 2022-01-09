describe IBGE::RegiaoImediata do
  shared_examples_for 'objeto' do
    it 'deve retornar o nome Fortaleza' do
      expect(subject.nome).to eq('Fortaleza')
    end

    it 'deve retornar o ID 230001' do
      expect(subject.id).to eq(230001)
    end

    it 'deve retornar a região intermediária, que é um objeto IBGE::RegiaoIntermediaria' do
      expect(subject.regiao_intermediaria).to be_an IBGE::RegiaoIntermediaria
    end
  end

  shared_examples_for 'array' do
    it 'deve retornar um Array<IBGE::RegiaoImediata>' do
      aggregate_failures do
        is_expected.to be_an Array
        expect(subject.first).to be_an IBGE::RegiaoImediata
      end
    end
  end

  describe '.obter_regioes_imediatas' do
    subject do
      VCR.use_cassette('regiao_imediata/obter_regioes_imediatas') do
        IBGE::RegiaoImediata.obter_regioes_imediatas
      end
    end

    it_has_behavior 'array'
  end

  describe '.regioes_imediatas_por_id' do
    context 'recebendo um array de IDs ([230001, 230002]) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_id:230001|230002', erb: { param: '230001%7C230002' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_id([230001, 230002])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (230001) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_id:230001', erb: { param: '230001' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_id(230001)
        end
      end

      it_has_behavior 'objeto'
    end
  end

  describe '.regioes_imediatas_por_uf' do
    context 'recebendo um array de siglas (["BA", "CE"]) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_uf:BA|CE', erb: { param: 'BA%7CCE' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_uf(%w(BA CE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([29, 23]) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_uf:BA|CE', erb: { param: '29%7C23' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_uf([29, 23])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (CE) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_uf:CE', erb: { param: 'CE' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_uf('CE')
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_uf:CE', erb: { param: 23 }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_uf(23)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.regioes_imediatas_por_regiao' do
    context 'recebendo um array de siglas (["N", "NE"]) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_regiao:N|NE', erb: { param: 'N%7CNE' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_regiao(%w(N NE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([1, 2]) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_regiao:N|NE', erb: { param: '1%7C2' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_regiao([1, 2])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_regiao:NE', erb: { param: 2 }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_regiao(2)
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (NE) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_regiao:NE', erb: { param: 'NE' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_regiao('NE')
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.regioes_imediatas_por_intermediaria' do
    context 'recebendo um array de IDs ([2301, 2302]) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_intermediaria:2301|2302', erb: { param: '2301%7C23017' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_intermediaria([2301, 2302])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2301) como parâmetro' do
      subject do
        VCR.use_cassette('regiao_imediata/regioes_imediatas_por_intermediaria:2301', erb: { param: '2301' }) do
          IBGE::RegiaoImediata.regioes_imediatas_por_intermediaria(2301)
        end
      end

      it_has_behavior 'array'
    end
  end
end