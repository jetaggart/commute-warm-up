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

  it "groups a single person together" do
    csv = [{
             "Person" => "Emily",
             "Week" => "4",
             "Day" => "Monday",
             "Mode" => "Walk",
             "Inbound" => 12,
             "Outbound" => 15,
             "Distance" => 0.65
           }, {
             "Person" => "Emily",
             "Week" => "5",
             "Day" => "Tuesday",
             "Mode" => "Walk",
             "Inbound" => 24,
             "Outbound" => 16,
             "Distance" => 1
           }, {
             "Person" => "John",
             "Week" => "7",
             "Day" => "Tuesday",
             "Mode" => "Walk",
             "Inbound" => 10,
             "Outbound" => 10,
             "Distance" => 2
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
                                     }, {
                                       :week => 5,
                                       :day => "Tuesday",
                                       :mode => "Walk",
                                       :inbound => 24,
                                       :outbound => 16,
                                       :distance => 1
                                     }
                                    ],
                         "John" => [
                                     {
                                       :week => 7,
                                       :day => "Tuesday",
                                       :mode => "Walk",
                                       :inbound => 10,
                                       :outbound => 10,
                                       :distance => 2
                                     }
                                   ]
                       })
  end
end
