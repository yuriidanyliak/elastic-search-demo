require 'csv'

CSV.open('data_set.csv', headers: true).each_slice(250) do |rows|
  Text.insert_all(rows.map(&:to_h))
end

Text.reindex
