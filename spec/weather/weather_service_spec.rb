describe WeatherService do
  subject(:service) { described_class.new(client, presenter) }

  let(:client) { instance_double(WapiWeatherClient) }
  let(:presenter) { WeatherPresenter.new }

  specify do
    allow(client).to receive(:get_weather).with(51.11,17.02).and_return(
      Weather.new(cloud_cover: 10, temperature: 22.0)
    )
    allow(client).to receive(:get_weather).with(52.23,21.01).and_return(
      Weather.new(cloud_cover: 30, temperature: 23.0)
    )

    expect(service.call([
      ['Wroclaw', [51.11, 17.02]],
      ['Warsaw', [52.23, 21.01]],
    ])).to eq([
      "Weather in Wroclaw: the sky is clear (10% clouds) and the temperature is 22.0 C",
      "Weather in Warsaw: the sky is partially clouded (30% clouds) and the temperature is 23.0 C",
    ])
  end

  specify do
    allow(client).to receive(:get_weather).with(51.11,17.02).and_return(
      Weather.new(cloud_cover: 10, temperature: 22.0)
    )

    expect(service.call([['Wroclaw', [51.11, 17.02]]])).to eq([
      "Weather in Wroclaw: the sky is clear (10% clouds) and the temperature is 22.0 C",
    ])
  end
end
