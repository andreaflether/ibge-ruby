describe IBGE::UF do
  shared_examples_for 'array' do |tamanho|
    it 'deve retornar um Array<IBGE::UF>' do
      aggregate_failures do
        is_expected.to be_an Array
        expect(subject.first).to be_an IBGE::UF
      end
    end

    it "deve possuir o tamanho #{tamanho}" do
      expect(subject.size).to eq(tamanho)
    end
  end

  shared_examples_for 'objeto' do
    it 'deve retornar um objeto IBGE::UF' do
      is_expected.to be_an IBGE::UF
    end
    
    it 'deve retornar o ID 23' do
      expect(subject.id).to eq(23)
    end

    it 'deve retornar o nome Ceará' do
      expect(subject.nome).to eq('Ceará')
    end

    it 'deve retornar a sigla CE' do
      expect(subject.sigla).to eq('CE')
    end

    it 'deve retornar a região, que é um objeto IBGE::Regiao' do
      expect(subject.regiao).to be_an IBGE::Regiao
    end
  end

  describe '.obter_ufs' do
    subject do
      VCR.use_cassette('uf/obter_ufs') do
        IBGE::UF.obter_ufs
      end
    end

    it_has_behavior 'array', 27
  end

  describe '.ufs_por_identificador' do
    context 'recebendo um array de siglas (["BA", "CE"]) como parâmetro' do
      subject do
        VCR.use_cassette('uf/ufs_por_identificador:BA|CE', erb: { param: 'BA%7CCE' }) do
          IBGE::UF.ufs_por_identificador(%w(BA CE))
        end
      end

      it_has_behavior 'array', 2
    end

    context 'recebendo um array de IDs ([29, 23]) como parâmetro' do
      subject do
        VCR.use_cassette('uf/ufs_por_identificador:BA|CE', erb: { param: '29%7C23' }) do
          IBGE::UF.ufs_por_identificador([29, 23])
        end
      end

      it_has_behavior 'array', 2
    end
    
    context 'recebendo uma sigla (CE) como parâmetro' do
      subject do
        VCR.use_cassette('uf/ufs_por_identificador:CE', erb: { param: 'CE' }) do
          IBGE::UF.ufs_por_identificador('CE')
        end
      end

      it_has_behavior 'objeto'
    end

    context 'recebendo um ID (29) como parâmetro' do
      subject do
        VCR.use_cassette('uf/ufs_por_identificador:CE', erb: { param: 29 }) do
          IBGE::UF.ufs_por_identificador(29)
        end
      end

      it_has_behavior 'objeto'
    end
  end

  describe '.ufs_por_regiao' do
    context 'recebendo um array de siglas (["N", "NE"]) como parâmetro' do
      subject do
        VCR.use_cassette('uf/ufs_por_regiao:N|NE', erb: { param: 'N%7CNE' }) do
          IBGE::UF.ufs_por_regiao(%w(N NE))
        end
      end

      it_has_behavior 'array', 16
    end

    context 'recebendo um array de IDs ([1, 2]) como parâmetro' do
      subject do
        VCR.use_cassette('uf/ufs_por_regiao:N|NE', erb: { param: '1%7C2' }) do
          IBGE::UF.ufs_por_regiao([1, 2])
        end
      end

      it_has_behavior 'array', 16
    end

    context 'recebendo um ID (1) como parâmetro' do
      subject do
        VCR.use_cassette('uf/ufs_por_regiao:N', erb: { param: 1 }) do
          IBGE::UF.ufs_por_regiao(1)
        end
      end

      it_has_behavior 'array', 7
    end

    context 'recebendo uma sigla (N) como parâmetro' do
      subject do
        VCR.use_cassette('uf/ufs_por_regiao:N', erb: { param: 'N' }) do
          IBGE::UF.ufs_por_regiao('N')
        end
      end

      it_has_behavior 'array', 7
    end    
  end
end