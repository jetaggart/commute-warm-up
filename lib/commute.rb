class Commute
  attr_reader :csv

  def initialize(csv)
    @csv = csv
  end

  def to_hash
    convert_to_hash.each_with_object({}) do |(key, val), hash|
      sorted_by_week = val.group_by { |a| a[:week] }.sort

      sorted_by_week_and_day = sorted_by_week.flat_map do |week| 
        week.last.sort { |a| day_value(a[:day]) }
      end

      hash[key] = sorted_by_week_and_day
    end
  end

  private

  def day_value(day)
    {
      "Monday" => 1,
      "Tuesday" => 2,
      "Wednesday" => 3,
      "Thursday" => 4,
      "Friday" => 5,
      "Saturday" => 6,
      "Sunday" => 7
    }[day]
  end

  def convert_to_hash
    csv.each_with_object({}) do |row, hash| 
      key = row["Person"]

      hash[key] ||= []

      hash[key].push(build_row(row))
    end
  end

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
