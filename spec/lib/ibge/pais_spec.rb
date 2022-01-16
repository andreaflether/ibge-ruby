describe IBGE::Pais do
  shared_examples_for 'pais' do
    it 'deve retornar o nome Brasil' do
      expect(subject.first.nome).to eq('Brasil')
    end

    it 'deve retornar o ID (M49) 76' do
      expect(subject.first.id['M49']).to eq(76)
    end

    it 'deve retornar a sigla (ISO-ALPHA-2) BR' do
      expect(subject.first.id['ISO-ALPHA-2']).to eq('BR')
    end

    it 'deve retornar América do sul como região intermediária' do
      expect(subject.first.regiao_intermediaria['nome']).to eq('América do sul')
    end
  end

  shared_examples_for 'array' do
    it 'deve retornar um Array<IBGE::Pais>' do
      aggregate_failures do
        is_expected.to be_an Array
        expect(subject.first).to be_an IBGE::Pais
      end
    end
  end

  describe '.obter_paises' do
    subject do
      VCR.use_cassette('pais/obter_paises') do
        IBGE::Pais.obter_paises
      end
    end

    it_has_behavior 'array'
  end

  describe '.paises_por_identificador' do
    context 'recebendo um array de IDs ([76, 300]) como parâmetro' do
      subject do
        VCR.use_cassette('pais/paises_por_identificador:76|300', erb: { param: '76%7C300' }) do
          IBGE::Pais.paises_por_identificador([76, 300])
        end
      end

      it_has_behavior 'array'
      it_has_behavior 'pais'
    end

    context 'recebendo um ID (76) como parâmetro' do
      subject do
        VCR.use_cassette('pais/paises_por_identificador:76', erb: { param: 76 }) do
          IBGE::Pais.paises_por_identificador(76)
        end
      end

      it_has_behavior 'array'
      it_has_behavior 'pais'
    end
  end
end