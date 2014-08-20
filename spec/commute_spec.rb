require "spec_helper"

describe Commute do
  it "returns a simple array with that user's data" do
    csv = [{
             "Person" => "Emily",
             "Week" => "4",
             "Day" => "Monday",
             "Mode" => "Walk",
             "Inbound" => 12,
             "Outbound" => 15,
             "Distance" => 0.65
           }]

    hash = Commute.new(csv).to_hash

    expect(hash).to eq({
                         "Emily" => [
                                     {
                                       :week => 4,
                                       :day => "Monday",
                                       :mode => "Walk",
                                       :inbound => 12,
                                       :outbound => 15,
                                       :distance => 0.65
                                     }
                                    ]
                       })
  end
end
