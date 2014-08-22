require 'rspec'
require_relative '../file_size'

describe Node do

  let(:options) { {name: 'name', size: 10} }

  subject { described_class.new(options, []) }

  it 'has name' do
    expect(subject.name).to eq('name')
  end

  it 'has children' do
    expect(subject.children).to eq([])
  end

  describe 'size' do

    it 'returns its value' do
      expect(subject.size).to eq(10)
    end

    context 'when has children' do

      let(:children1) { described_class.new({ name: '1', size: 100 }) }
      let(:children2) { described_class.new({ name: '2', size: 0}, [children3, children4]) }
      let(:children3) { described_class.new({ name: '3', size: 10 }) }
      let(:children4) { described_class.new({ name: '4', size: 10 }) }

      subject { described_class.new({name: 'dir'}, [ children1, children2 ])}

      it 'is children size sum' do
        expect(subject.size).to eq(120)
      end

    end
  end

end

describe TreeFileSystem do

  let(:path) { 'test_dir' }

  subject { described_class.new(path) }

  it 'creates tree from file system' do
    pending
    expect(subject.parent_root.name).to eq('test_dir')
  end

end
