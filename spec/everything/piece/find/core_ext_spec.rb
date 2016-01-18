describe Everything::Piece do
  let(:piece) do
    described_class.new('anything-at-all')
  end

  it 'has a method #find' do
    expect(piece).to respond_to(:find)
  end
end
