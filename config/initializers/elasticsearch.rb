if ENV["BONSAI_URL"].present?
  url = ENV["BONSAI_URL"]
  transport_options = { request: { timeout: 250 } }
  options = { hosts: url, retry_on_failure: true, transport_options: transport_options }
  Searchkick.client = Elasticsearch::Client.new(options)
else
  Searchkick.client = OpenSearch::Client.new(host: ENV['ELASTICSEARCH_URL'])
end
