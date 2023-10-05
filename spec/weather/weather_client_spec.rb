describe WeatherClient do
  subject(:client) { described_class.new }

  specify do
    stub_request(:get, 'http://api.weatherapi.com/v1/current.json?key=efa873646d8043d39c5153004232609&q=51.11,17.02').
      to_return({status: 200, body: {'current' => {'cloud' => 10, 'temp_c' => 22.0}}.to_json})

    expect(client.get_weather(51.11, 17.02)).to eq(
      Weather.new(cloud_cover: 10, temperature: 22.0)
    )
  end
end
