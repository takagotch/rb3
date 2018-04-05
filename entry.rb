class Entry < ActiveRecord::Base
  belongs_to :blog
end

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


