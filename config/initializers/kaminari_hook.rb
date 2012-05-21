module Kaminari
  module Helpers
    class Paginator
    
      #def years
      #  @options[:years]
      #  @options[:current_year]
      #end

      def render(&block)
        instance_eval(&block) # if @options[:num_pages] > 1
        @output_buffer
      end

      class PageProxy
        def last?
          #since i want to always show pagination, first page can be last page also...
          @page == @options[:num_pages] or @options[:num_pages] == 0
        end
      end
      
    end
  end
end



