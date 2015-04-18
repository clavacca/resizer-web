
module Hardwired
  class Template

    def version_pairs_friendly
      @@version_friendly_names ||= {"all" => "All versions", "/docs/v3/" => "v3.X", "/docs/v4/" => "v4.X", "/docs/latest/" => "Development version"}
      version_pairs.map{|v| v.merge({title:  @@version_friendly_names[v[:id]]})}
    end
    def version_pairs
      versions = (meta.versions || []).map{|b| "/" + b.gsub(/\A\//,"").gsub(/\/\Z/,"") + "/"}
      current_version = versions.select{|b|path.start_with?(b)} .first
      
      return [{id: "all", path: path, active: true}] if current_version.nil?
    
      rel_path = path[current_version.length ..-1]

      versions.map{|v| {id: v, path: v + rel_path, active: v == current_version}}
    end

    def after_load
      #Evaluate all categories, assign meta.sidebar and meta.primary_category
      @@cats ||= Hardwired::Config.config.categories
      @@cats_by_tag ||= Hash[@@cats.map{ |c| [c.tag.to_s,c] }]

      matches = @@cats.select do |c|
        tag?(c.tag) || [c.include].flatten.select { |p| path.start_with?(p) }.length > 0
      end

      unless matches.empty? 
        #Join with existing category tags
        meta.categories = (meta.categories || []) | matches.map { |c| c.tag }

        #Select the first category from the union
        meta.category ||= meta.categories.first

        c = @@cats_by_tag[meta.category]

        #Clone all specified metadata, without overwriting anything
        @meta = RecursiveOpenStruct.new(c.meta.to_hash.merge((meta || {}).to_hash)) unless c.meta.nil?
    
        #p "Categorized #{path} as #{meta.categories * ','}  (primary #{meta.category})"

        #Add the primary category to the tags
        meta.tags = tags | [meta.category]
      end
        
    end
  end
end

