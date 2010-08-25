module Arel
  module Visitors
    ###
    # This class produces SQL for JOIN clauses but omits the "single-source"
    # part of the Join grammar:
    #
    #   http://www.sqlite.org/syntaxdiagrams.html#join-source
    #
    # This visitor is used in SelectManager#join_sql and is for backwards
    # compatibility with Arel V1.0
    class JoinSql < Arel::Visitors::ToSql
      def visit_Arel_Nodes_OuterJoin o
        "OUTER JOIN #{visit o.right} #{visit o.constraint}"
      end

      def visit_Arel_Nodes_InnerJoin o
        "INNER JOIN #{visit o.right} #{visit o.constraint if o.constraint}"
      end
    end
  end
end