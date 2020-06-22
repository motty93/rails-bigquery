require 'google/cloud/bigquery'

module BigQuery
  module Credential
    def secret_key
      Google::Cloud::Bigquery::Credentials.new(ENV['BQ_CREDENTIAL_PATH'])
    end
  end
end
