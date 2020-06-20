require "google/cloud/bigquery"

module BigQuery
  class Auth
    attr_reader :bigquery, :dataset, :table, :table_name

    DEFAULT_DATASET = 'test'

    def initialize(args={})
      @bigquery = set_creadential
      @dataset = set_dataset(args[:dataset] || DEFAULT_DATASET)
      post_initialize(args)
    end

    def post_initialize(args)
      nil
    end

    private

      def set_creadential
        keyfile = ENV['BQ_CREDENTIAL_PATH']
        creds = Google::Cloud::Bigquery::Credentials.new(keyfile)
        Google::Cloud::Bigquery.new(
          project_id: ENV['GCP_PROJECT_ID'],
          credentials: creds
        )
      end

      def set_dataset(name)
        return bigquery.dataset(name) if bigquery.datasets.map(&:dataset_id).include?(name)

        bigquery.create_dataset(name, name: name)
      end
  end
end
