class Entry < ActiveRecord::Base
  belongs_to :blog
end

class ActiveRecord::Base
  belongs_to :blog, :counter_cache => true
end


class Entry < ActiveRecord::Base
  has_many :taggings
  has_many :tags, :through => :taggings

  def tag_string=(tag_string)
    tag_names = tag_string.split(/\s/)
    self.tags = tag_names.map do |tag_name|
      Tag.find_or_initialize_by_name(tag_name)
    end
  end
end






/*
	entry = Entry.new(
		:title => "DB Columns",
		:content => "setter",
		:tag_stirng => "Rails ActiveRecord setter Tips")	
	entry.tags
*/




/*
	blog.entries.length 
	blog.entries.size 
	blog.entries.empty?

*/



/*
twenty_entries = Entry.limit(20)
twenty_entries.each do |entry|
  logger.debug(entry.blog.name)
end

  Entry Load(0.5ms) SELECT * FROM entries LIMIT 20
  Blog Load(0.3ms) SELECT * FROM blogs WHERE id = 1 LIMIT 1
  Blog Load(0.1ms) SELECT * FROM blogs WHERE id = 2 LIMIT 1
  Blog Load((0.2ms) SELECT * FROM blogs WHERE id = 2 LIMIT 1
  Blog Load(0.1ms) SELECT * FROM blogs WHERE id = 1 LIMIT 1
  Blog Load(0.2ms) SELECT * FROM blogs WHERE id = 1 LIMIT 1
  Blog Load(0.1ms) SELECT *  FROM blogs WHERE id = 1 LIMIT 1



ActiveRecord::Base.cache do
  twenty_entries = Entry.limit(20)
  twenty_entries.each do |entry|
    logger.debug(entry.blog.name)
  end
end


    Entry Load(0.3ms) SELECT * FROM entries ORDER BY created_at
    Blog Load(0.2ms) SELECT * FROM blogs WHERE id = 1 LIMIT 1
    Blog Load(0.1ms) SELECT * FROM blogs WHERE id = 2 LIMIT 1
    CACHE (0.0ms) SELECT * FROM blogs WHERE id = 2 LIMIT 1
    CACHE (0.0ms) SELECT * FROM blogs WHERE id = 1 LIMIT 1
    Blog Load(0.1ms) SELECT * FROM blogs WHERE id = 3 LIMIT 1
    CACHE (0.0ms) SELECT * FROM blogs WHERE id = 1 LIMIT 1
*/


