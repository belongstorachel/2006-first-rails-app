require_dependency "search_system"

class SearchController < ApplicationController
    layout "search" , :except => [:rss, :description]
    
    def index 
        search
    end

    #-----------------------------------------------------------------------
    # search through the index, get the ActiveRecord's that match and
    # return those to the caller
    #-----------------------------------------------------------------------
    def search
        @search_config = YAML.load(File.open(File.join(RAILS_ROOT,"config","search.yml")))

        if @params['search_terms'].nil? then
            @search_terms = @search_config['default_search_terms']
        else 
            @search_terms = @params['search_terms'].split
        end

        @count        = @params['count'].to_i || -1
  
        self.send("#{@search_config['search_backend']}_search")
    end

    def simple_search

        empty_contents = MockContents.new

        index_filename = File.join(RAILS_ROOT,@search_config['simple_backend']['index_filename'])

        if not File.exists?(index_filename) then
            raise "content index file (#{File.expand_path(index_filename)}) does not exist.  Did you run scripts/indexer ?"
        end

        simple_index = Search::Simple::Searcher.load(empty_contents,index_filename)

        # what to return to the caller
        @results = Array.new

        search_results = simple_index.find_words(@search_terms)

        if search_results.contains_matches then
            search_results.results.sort.each do |result|
                (classname,pk_id,column) = result.name.split(".")
                classvar = eval(classname)
                @results << classvar.find(pk_id)
                break if @count > 0 and @results.size >= @count 
            end
        end

        @results.uniq!
    end


    def description
        @headers["Content-Type"] = "text/xml"
        render 'opensearch/description'
    end
    def rss
        @headers["Content-Type"] = "text/xml"
        search
        render 'opensearch/rss'
    end
end
