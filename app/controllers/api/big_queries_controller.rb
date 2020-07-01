class Api::BigQueriesController < ApplicationController
  TABLES = [Category, User].freeze

  def index
    client = BigQuery::SyncTable.new(tables: TABLES)
    client.synchronize
  end
end
