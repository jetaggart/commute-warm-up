class Commute
  attr_reader :csv

  def initialize(csv)
    @csv = csv
  end

  def to_hash
    csv.each_with_object({}) do |row, hash| 
      key = row["Person"]

      hash[key] ||= []

      hash[key].push(build_row(row))
    end
  end

  private

  def build_row(row)
    {
      :week => row["Week"].to_i,
      :day => row["Day"],
      :mode => row["Mode"],
      :inbound => row["Inbound"],
      :outbound => row["Outbound"],
      :distance => row["Distance"]
    }
  end
end
