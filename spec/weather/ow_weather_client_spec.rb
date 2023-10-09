describe OwWeatherClient do
  subject(:client) { described_class.new }

  specify do
    stub_request(:get, 'https://api.openweathermap.org/data/2.5/weather?appid=6cbf61a8174de57cee45a76704a7f443&lat=51.11&lon=17.02').
      to_return({
        status: 200, body: {
          'clouds' => {'all' => 10},
          'main' => {'temp' => 295.0},
        }.to_json
      })

    expect(client.get_weather(51.11, 17.02)).to eq(
      Weather.new(cloud_cover: 10, temperature: 22.0)
    )
  end
end
