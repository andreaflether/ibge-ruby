describe IBGE::Regiao do
  describe 'Regiao::obter_regioes' do
    subject do
      VCR.use_cassette('regiao:obter_regioes') do
        IBGE::Regiao.obter_regioes
      end
    end

    it 'deve retornar um Array não vazio' do
      aggregate_failures do
        is_expected.to be_an Array
        is_expected.not_to be_empty
      end
    end
  end

  describe 'Regiao::regioes_por_identificador' do
    shared_examples_for 'um array' do
      it 'deve retornar um Array' do
        is_expected.to be_an Array
      end

      it 'deve possuir o tamanho 2' do
        expect(subject.size).to eq(2)
      end

      it 'deve retornar as siglas NE e N' do
        expect(subject.map(&:sigla)).to eq(['N', 'NE'])
      end
    end

    context 'recebendo um array de siglas (["N", "NE"]) como parâmetro' do
      subject do
        VCR.use_cassette('regiao:regioes_por_identificador:N|NE', erb: { param: 'N%7CNE' }) do
          IBGE::Regiao.regioes_por_identificador(%w(N NE))
        end
      end

      it_behaves_like 'um array'
    end

    context 'recebendo um array de IDs ([1, 2]) como parâmetro' do
      subject do
        VCR.use_cassette('regiao:regioes_por_identificador:N|NE', erb: { param: '1%7C2' }) do
          IBGE::Regiao.regioes_por_identificador([1, 2])
        end
      end

      it_behaves_like 'um array'
    end

    shared_examples_for 'um objeto' do
      it 'deve retornar um objeto IBGE::Regiao' do
        is_expected.to be_an IBGE::Regiao
      end

      it 'deve retornar o nome Nordeste' do
        expect(subject.nome).to eq('Nordeste')
      end

      it 'deve retornar o ID 2' do
        expect(subject.id).to eq(2)
      end

      it 'deve retornar a sigla NE' do
        expect(subject.sigla).to eq('NE')
      end
    end
    
    context 'recebendo uma sigla (NE) como parâmetro' do
      subject do
        VCR.use_cassette('regiao:regioes_por_identificador:NE', erb: { param: 'NE' }) do
          IBGE::Regiao.regioes_por_identificador('NE')
        end
      end

      it_behaves_like 'um objeto'
    end

    context 'recebendo um ID (2) como parâmetro' do
      subject do
        VCR.use_cassette('regiao:regioes_por_identificador:NE', erb: { param: 2 }) do
          IBGE::Regiao.regioes_por_identificador(2)
        end
      end

      it_behaves_like 'um objeto'
    end
  end
end