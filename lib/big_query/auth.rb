module BigQuery
  class Auth
    include Credential
    attr_reader :bigquery, :dataset, :table, :table_name
    DEFAULT_DATASET = 'db_test'

    def initialize(args = {})
      @bigquery = set_credential
      @dataset = set_dataset(args[:dataset] || DEFAULT_DATASET)
      post_initialize(args)
    end

    def post_initialize(args)
      nil
    end

    private

      def set_credential
        Google::Cloud::Bigquery.new(
          project_id: ENV['GCP_PROJECT_ID'],
          credentials: secret_key
        )
      end

      def set_dataset(name)
        return bigquery.dataset(name) if bigquery.datasets.map(&:dataset_id).include?(name)

        bigquery.create_dataset(name, name: name)
      end
  end
end
