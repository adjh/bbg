Ultrasphinx::Search.client_options['ignore_missing_records'] = true
# ultrasphinx high-light setting
Ultrasphinx::Search.excerpting_options = HashWithIndifferentAccess.new({
  :before_match => '<font color=red>', 
  :after_match => '</font>',
  :chunk_separator => "...",
  :limit => 256,
  :around => 3,
  :content_methods => [['name','tags'],['title','content']]
})

# define full search module and inject to AR::Base
module FullSearch
  
  def search(options = {})
    options.delete_if {|key, value| value.nil? } 
    options[:class_names] = self.name unless options[:class_names]
    options[:per_page] = 10 unless options[:per_page]
    options[:sort_mode] = 'descending' unless options[:sort_mode]
    options[:sort_by] = 'created_at' unless options[:sort_by]
    excerpt = options.delete(:excerpt) || true
    rs = Ultrasphinx::Search.new(options)
    excerpt ? rs.excerpt : rs.run
  end

end

ActiveRecord::Base.send :extend, FullSearch