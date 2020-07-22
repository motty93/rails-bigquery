class Api::BigQueriesController < ApplicationController
  TABLES = [Category, User].freeze

  def index
    client = BigQuery::SyncTable.new(tables: TABLES)
    client.synchronize
  end

  def sync
    User.first.update(name: 'first')
    Category.third.update(name: 'third')
  end
end
