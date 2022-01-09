describe IBGE::Mesorregiao do
  shared_examples_for 'objeto' do
    it 'deve retornar um objeto IBGE::Mesorregiao' do
      is_expected.to be_an IBGE::Mesorregiao
    end

    it 'deve retornar o nome Metropolitana de Fortaleza' do
      expect(subject.nome).to eq('Metropolitana de Fortaleza')
    end

    it 'deve retornar o ID 2303' do
      expect(subject.id).to eq(2303)
    end

    it 'deve retornar a UF, que é um objeto IBGE::UF' do
      expect(subject.uf).to be_an IBGE::UF
    end
  end

  shared_examples_for 'array' do
    it 'deve retornar um Array<IBGE::Mesorregiao>' do
      aggregate_failures do
        is_expected.to be_an Array
        expect(subject.first).to be_an IBGE::Mesorregiao
      end
    end
  end

  describe '.obter_mesoregioes' do
    subject do
      VCR.use_cassette('mesorregiao/obter_mesorregioes') do
        IBGE::Mesorregiao.obter_mesorregioes
      end
    end

    it_has_behavior 'array'
  end

  describe '.mesorregioes_por_uf' do
    context 'recebendo um array de siglas (["BA", "CE"]) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_uf:BA|CE', erb: { param: 'BA%7CCE' }) do
          IBGE::Mesorregiao.mesorregioes_por_uf(%w(BA CE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([29, 23]) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_uf:BA|CE', erb: { param: '29%7C23' }) do
          IBGE::Mesorregiao.mesorregioes_por_uf([29, 23])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (CE) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_uf:CE', erb: { param: 'CE' }) do
          IBGE::Mesorregiao.mesorregioes_por_uf('CE')
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_uf:CE', erb: { param: 23 }) do
          IBGE::Mesorregiao.mesorregioes_por_uf(23)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.mesorregioes_por_regiao' do
    context 'recebendo um array de siglas (["N", "NE"]) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_regiao:N|NE', erb: { param: 'N%7CNE' }) do
          IBGE::Mesorregiao.mesorregioes_por_regiao(%w(N NE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([1, 2]) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_regiao:N|NE', erb: { param: '1%7C2' }) do
          IBGE::Mesorregiao.mesorregioes_por_regiao([1, 2])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_regiao:NE', erb: { param: 2 }) do
          IBGE::Mesorregiao.mesorregioes_por_regiao(2)
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (NE) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_regiao:NE', erb: { param: 'NE' }) do
          IBGE::Mesorregiao.mesorregioes_por_regiao('NE')
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.mesorregioes_por_id' do
    context 'recebendo um array de IDs ([2303, 2304]) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_id:2303|2304', erb: { param: '2303|2304' }) do
          IBGE::Mesorregiao.mesorregioes_por_id([2303, 2304])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2303) como parâmetro' do
      subject do
        VCR.use_cassette('mesorregiao/mesorregioes_por_id:2303', erb: { param: '2303' }) do
          IBGE::Mesorregiao.mesorregioes_por_id(2303)
        end
      end

      it_has_behavior 'objeto'
    end
  end
end