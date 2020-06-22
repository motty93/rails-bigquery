module BigQuery
  class Table < Auth

    def post_initialize(args)
      @table = exist_table
      @table_name = table_name
    end

    def add(**field_params)
      table.insert([field_params.merge(created_at: DateTime.now)])
    end

    def exist_table
      dataset.table(table_name) if dataset.tables.map(&:table_id).include?(table_name)
    end

    def create_table
      raise NotImplementedError, "This #{self.class} cannot respond to: "
    end

    def table_name
      self.class.name.demodulize.underscore
    end
  end
end
