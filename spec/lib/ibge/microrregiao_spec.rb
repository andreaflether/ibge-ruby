describe IBGE::Microrregiao do
  shared_examples_for 'objeto' do
    it 'deve retornar um objeto IBGE::Microrregiao' do
      is_expected.to be_an IBGE::Microrregiao
    end

    it 'deve retornar o ID 23016' do
      expect(subject.id).to eq(23016)
    end

    it 'deve retornar o nome Fortaleza' do
      expect(subject.nome).to eq('Fortaleza')
    end

    it 'deve retornar a mesorregião, que é um objeto IBGE::Mesorregiao' do
      expect(subject.mesorregiao).to be_an IBGE::Mesorregiao
    end
  end

  shared_examples_for 'array' do
    it 'deve retornar um Array<IBGE::Microrregiao>' do
      aggregate_failures do
        is_expected.to be_an Array
        expect(subject.first).to be_an IBGE::Microrregiao
      end
    end
  end

  describe '.obter_microrregioes' do
    subject do
      VCR.use_cassette('microrregiao/obter_microrregioes') do
        IBGE::Microrregiao.obter_microrregioes
      end
    end

    it_has_behavior 'array'
  end

  describe '.microrregioes_por_id' do
    context 'recebendo um array de IDs ([23016, 23017]) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_id:23016|23017', erb: { param: '23016%7C23017' }) do
          IBGE::Microrregiao.microrregioes_por_id([23016, 23017])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23016) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_id:23016', erb: { param: '23016' }) do
          IBGE::Microrregiao.microrregioes_por_id(23016)
        end
      end

      it_has_behavior 'objeto'
    end
  end

  describe '.microrregioes_por_uf' do
    context 'recebendo um array de siglas (["BA", "CE"]) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_uf:BA|CE', erb: { param: 'BA%7CCE' }) do
          IBGE::Microrregiao.microrregioes_por_uf(%w(BA CE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([29, 23]) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_uf:BA|CE', erb: { param: '29%7C23' }) do
          IBGE::Microrregiao.microrregioes_por_uf([29, 23])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (CE) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_uf:CE', erb: { param: 'CE' }) do
          IBGE::Microrregiao.microrregioes_por_uf('CE')
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_uf:CE', erb: { param: 23 }) do
          IBGE::Microrregiao.microrregioes_por_uf(23)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.microrregioes_por_regiao' do
    context 'recebendo um array de siglas (["N", "NE"]) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_regiao:N|NE', erb: { param: 'N%7CNE' }) do
          IBGE::Microrregiao.microrregioes_por_regiao(%w(N NE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([1, 2]) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_regiao:N|NE', erb: { param: '1%7C2' }) do
          IBGE::Microrregiao.microrregioes_por_regiao([1, 2])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_regiao:NE', erb: { param: 2 }) do
          IBGE::Microrregiao.microrregioes_por_regiao(2)
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (NE) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_regiao:NE', erb: { param: 'NE' }) do
          IBGE::Microrregiao.microrregioes_por_regiao('NE')
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.microrregioes_por_mesorregiao' do
    context 'recebendo um array de IDs ([2303, 2304]) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_mesorregiao:2303|2304', erb: { param: '2303%7C2304' }) do
          IBGE::Microrregiao.microrregioes_por_mesorregiao([2303, 2304])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2303) como parâmetro' do
      subject do
        VCR.use_cassette('microrregiao/microrregioes_por_mesorregiao:2303', erb: { param: '2303' }) do
          IBGE::Microrregiao.microrregioes_por_mesorregiao(2303)
        end
      end

      it_has_behavior 'array'
    end
  end
end