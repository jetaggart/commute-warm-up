class Commute
  attr_reader :csv

  def initialize(csv)
    @csv = csv
  end

  def to_hash
    first_row = csv.first

    {
      first_row["Person"] => [
                              {
                                :week => first_row["Week"].to_i,
                                :day => first_row["Day"],
                                :mode => first_row["Mode"],
                                :inbound => first_row["Inbound"],
                                :outbound => first_row["Outbound"],
                                :distance => first_row["Distance"],
                              }
                             ]
    }
  end
end
