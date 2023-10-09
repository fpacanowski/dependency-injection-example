describe CachedWeatherClient do
  subject(:cached_client) { described_class.new(client, cache, ttl) }
  let(:client) { instance_double(WapiWeatherClient) }
  let(:cache) { ActiveSupport::Cache::MemoryStore.new }
  let(:ttl) { 1.seconds }

  before do
    allow(client).to receive(:get_weather).with(11.22, 33.44).and_return(Weather.new(cloud_cover: 10, temperature: 22.0))
  end

  specify do
    cached_client.get_weather(11.22, 33.44)
    expect(client).to have_received(:get_weather).once
  end

  specify do
    cached_client.get_weather(11.22, 33.44)
    cached_client.get_weather(11.22, 33.44)
    expect(client).to have_received(:get_weather).once
  end

  specify do
    cached_client.get_weather(11.22, 33.44)
    sleep(ttl)
    cached_client.get_weather(11.22, 33.44)
    expect(client).to have_received(:get_weather).twice
  end
end
