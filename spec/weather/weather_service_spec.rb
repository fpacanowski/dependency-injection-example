describe WeatherService do
  subject(:service) { described_class.new }

  specify do
    stub_request(:get, 'http://api.weatherapi.com/v1/current.json?key=efa873646d8043d39c5153004232609&q=51.11,17.02').
      to_return({status: 200, body: {current: {cloud: 10, temp_c: 22.0}}.to_json})
    stub_request(:get, 'http://api.weatherapi.com/v1/current.json?key=efa873646d8043d39c5153004232609&q=52.23,21.01').
      to_return({status: 200, body: {current: {cloud: 30, temp_c: 23.0}}.to_json})

    expect(service.call([
      ['Wroclaw', [51.11, 17.02]],
      ['Warsaw', [52.23, 21.01]],
    ])).to eq([
      "Weather in Wroclaw: the sky is clear (10% clouds) and the temperature is 22.0 C",
      "Weather in Warsaw: the sky is partially clouded (30% clouds) and the temperature is 23.0 C",
    ])
  end

  specify do
    stub_request(:get, 'http://api.weatherapi.com/v1/current.json?key=efa873646d8043d39c5153004232609&q=51.11,17.02').
      to_return({status: 200, body: {current: {cloud: 10, temp_c: 22}}.to_json})

    expect(service.call([['Wroclaw', [51.11, 17.02]]])).to eq([
      "Weather in Wroclaw: the sky is clear (10% clouds) and the temperature is 22.0 C",
    ])
  end
end
