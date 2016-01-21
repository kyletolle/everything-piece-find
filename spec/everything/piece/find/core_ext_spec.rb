describe Everything::Piece do
  it 'has a class method .find_by_name' do
    expect(described_class).to respond_to(:find_by_name)
  end

  it 'has a class method .find_by_name_recursive' do
    expect(described_class).to respond_to(:find_by_name_recursive)
  end
end
