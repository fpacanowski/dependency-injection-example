describe WeatherService do
  subject(:service) { described_class.new(client) }

  let(:client) { instance_double(WeatherClient) }

  specify do
    allow(client).to receive(:get_weather).with(51.11,17.02).and_return(
      {'current' => {'cloud' => 10, 'temp_c' => 22.0}}
    )
    allow(client).to receive(:get_weather).with(52.23,21.01).and_return(
      {'current' => {'cloud' => 30, 'temp_c' => 23.0}}
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
      {'current' => {'cloud' => 10, 'temp_c' => 22.0}}
    )

    expect(service.call([['Wroclaw', [51.11, 17.02]]])).to eq([
      "Weather in Wroclaw: the sky is clear (10% clouds) and the temperature is 22.0 C",
    ])
  end
end
