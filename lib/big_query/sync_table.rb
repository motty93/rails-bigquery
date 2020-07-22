module BigQuery
  class SyncTable < Auth
    attr_accessor :tables

    def post_initialize(args)
      @tables = set_tables(args[:tables]) || [User]
    end

    def synchronize
      @tables.each do |table|
        sync_data = table.where(synchronized: false)
        next unless sync_data.present?

        table_name = table.table_name
        sync_data_attributes = sync_data.flat_map(&:attributes)
        delete_existing_data(sync_data, table_name)
        dataset.table(table_name).insert(sync_data_attributes)
        table.update_all(synchronized: true)
      end
    rescue Google::Cloud::InvalidArgumentError => e
      puts e.message
    end

    def table_data(table)
    end

    private

      def set_tables(tables)
        tables.select { |table| exist_table?(table.table_name) }
      end

      def exist_table?(table_name)
        dataset.tables.map(&:table_id).include?(table_name)
      end

      def delete_existing_data(data, table_name)
        job = dataset.query_job delete_sql(table_name, data)
        job.wait_until_done!
      end

      def join_ids(data)
        data.pluck(:id).join(',')
      end

      def delete_sql(table_name, data)
        # TODO: updateと要検討
        ids = join_ids(data)
        "DELETE FROM #{table_name} WHERE id in (#{ids})"
      end
  end
end
