# coding: utf-8

require 'active_record/hierarchical_query/cte/query'

module ActiveRecord
  module HierarchicalQuery
    module Adapters
      # @api private
      class PostgreSQL
        attr_reader :builder,
                    :table

        delegate :klass, :to => :builder

        # @param [ActiveRecord::HierarchicalQuery::Builder] builder
        def initialize(builder)
          @builder = builder
          @table = klass.arel_table
          @query = CTE::Query.new(builder)
        end

        def build_join(joined_to)
          @query.build_join(joined_to)
        end

        def prior
          @query.recursive_table
        end
      end # class PostgreSQL
    end # module Adapters
  end # module HierarchicalQuery
end # module ActiveRecord