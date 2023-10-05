class Weather < Dry::Struct
  include Dry.Types()
  attribute :cloud_cover, Integer
  attribute :temperature, Float
end
