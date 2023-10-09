describe WeatherClientWithFallback do
  subject(:client) { described_class.new(primary_client, secondary_client) }
  let(:primary_client) { instance_double(WapiWeatherClient) }
  let(:secondary_client) { instance_double(WapiWeatherClient) }

  before do
    allow(primary_client).to receive(:get_weather).with(11.22, 33.44)
    allow(secondary_client).to receive(:get_weather).with(11.22, 33.44)
  end

  specify 'uses primary client first' do
    client.get_weather(11.22, 33.44)

    expect(primary_client).to have_received(:get_weather).once
    expect(secondary_client).not_to have_received(:get_weather)
  end

  specify 'uses fallback client if the primary client raises' do
    allow(primary_client).to receive(:get_weather).with(11.22, 33.44).and_raise(StandardError)

    client.get_weather(11.22, 33.44)

    expect(primary_client).to have_received(:get_weather).once
    expect(secondary_client).to have_received(:get_weather).once
  end
end
