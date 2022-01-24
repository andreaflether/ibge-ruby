describe IBGE::Subdistrito do
  shared_examples_for 'objeto' do
    it 'deve retornar o nome Mucuripe' do
      expect(subject.first.nome).to eq('Mucuripe')
    end

    it 'deve retornar o ID 23044000512' do
      expect(subject.first.id).to eq(23044000512)
    end

    it 'deve retornar o distrito, que é um objeto IBGE::Distrito' do
      expect(subject.first.distrito).to be_an IBGE::Distrito
    end
  end

  shared_examples_for 'array' do |tamanho|
    it 'deve retornar um Array<IBGE::Subdistrito>' do
      aggregate_failures do
        is_expected.to be_an Array
        expect(subject.first).to be_an IBGE::Subdistrito
      end
    end
  end

  describe '.obter_subdistritos' do
    subject do
      VCR.use_cassette('subdistrito/obter_subdistritos') do
        IBGE::Subdistrito.obter_subdistritos
      end
    end

    it_has_behavior 'array'
  end

  describe '.subdistritos_por_id' do
    context 'recebendo um array de IDs (["23044000512", "23044006511"]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_id:23044000512|23044006511', erb: { param: '23044000512%7C23044006511' }) do
          IBGE::Subdistrito.subdistritos_por_id(%w(23044000512 23044006511))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID ("23044000512") como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_id:23044000512', erb: { param: '23044000512' }) do
          IBGE::Subdistrito.subdistritos_por_id('23044000512')
        end
      end

      it_has_behavior 'objeto'
    end
  end

  describe '.subdistritos_por_uf' do
    context 'recebendo um array de siglas (["BA", "CE"]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_uf:BA|CE', erb: { param: 'BA%7CCE' }) do
          IBGE::Subdistrito.subdistritos_por_uf(%w(BA CE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([29, 23]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_uf:BA|CE', erb: { param: '29%7C23' }) do
          IBGE::Subdistrito.subdistritos_por_uf([29, 23])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (CE) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_uf:CE', erb: { param: 'CE' }) do
          IBGE::Subdistrito.subdistritos_por_uf('CE')
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_uf:CE', erb: { param: 23 }) do
          IBGE::Subdistrito.subdistritos_por_uf(23)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.subdistritos_por_regiao' do
    context 'recebendo um array de siglas (["N", "NE"]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_regiao:N|NE', erb: { param: 'N%7CNE' }) do
          IBGE::Subdistrito.subdistritos_por_regiao(%w(N NE))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um array de IDs ([1, 2]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_regiao:N|NE', erb: { param: '1%7C2' }) do
          IBGE::Subdistrito.subdistritos_por_regiao([1, 2])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_regiao:NE', erb: { param: 2 }) do
          IBGE::Subdistrito.subdistritos_por_regiao(2)
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo uma sigla (NE) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_regiao:NE', erb: { param: 'NE' }) do
          IBGE::Subdistrito.subdistritos_por_regiao('NE')
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.subdistritos_por_municipio' do
    context 'recebendo um array de IDs (["2304400", "2927408"]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_municipio:2304400|2927408', erb: { param: '2304400%7C2927408' }) do
          IBGE::Subdistrito.subdistritos_por_municipio(['2304400', '2927408'])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID ("2304400") como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_municipio:2304400', erb: { param: '2304400' }) do
          IBGE::Subdistrito.subdistritos_por_municipio('2304400')
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.subdistritos_por_mesorregiao' do
    context 'recebendo um array de IDs ([2303, 2304]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_mesorregiao:2303|2304', erb: { param: '2303%7C2304' }) do
          IBGE::Subdistrito.subdistritos_por_mesorregiao([2303, 2304])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (2303) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_mesorregiao:2303', erb: { param: '2303' }) do
          IBGE::Subdistrito.subdistritos_por_mesorregiao(2303)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.subdistritos_por_microrregiao' do
    context 'recebendo um array de IDs ([23016, 23017]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_microrregiao:23016|23017', erb: { param: '23016%7C23017' }) do
          IBGE::Subdistrito.subdistritos_por_microrregiao([23016, 23017])
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID (23016) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_microrregiao:23016', erb: { param: '23016' }) do
          IBGE::Subdistrito.subdistritos_por_microrregiao(23016)
        end
      end

      it_has_behavior 'array'
    end
  end

  describe '.subdistritos_por_distrito' do
    context 'recebendo um array de IDs (["230440005", "230370905"]) como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_distrito:230440005|230370905', erb: { param: '230440005%7C230370905' }) do
          IBGE::Subdistrito.subdistritos_por_distrito(%w(230440005 230370905))
        end
      end

      it_has_behavior 'array'
    end

    context 'recebendo um ID ("230440005") como parâmetro' do
      subject do
        VCR.use_cassette('subdistrito/subdistritos_por_distrito:230440005', erb: { param: '230440005' }) do
          IBGE::Subdistrito.subdistritos_por_distrito('230440005')
        end
      end

      it_has_behavior 'array'
    end
  end
end