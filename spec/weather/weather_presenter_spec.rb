describe WeatherPresenter do
  subject(:presenter) { described_class.new }

  specify 'with clear sky' do
    expect(presenter.present('Wroclaw', Weather.new(cloud_cover: 20, temperature: 20.0))).to eq(
      "Weather in Wroclaw: the sky is clear (20% clouds) and the temperature is 20.0 C"
    )
  end

  specify 'with partially clouded sky' do
    expect(presenter.present('Wroclaw', Weather.new(cloud_cover: 70, temperature: 20.0))).to eq(
      "Weather in Wroclaw: the sky is partially clouded (70% clouds) and the temperature is 20.0 C"
    )
  end

  specify 'with partially clouded sky' do
    expect(presenter.present('Wroclaw', Weather.new(cloud_cover: 100, temperature: 20.0))).to eq(
      "Weather in Wroclaw: the sky is clouded (100% clouds) and the temperature is 20.0 C"
    )
  end
end
