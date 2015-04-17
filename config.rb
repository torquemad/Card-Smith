require 'active_record'

# ActiveRecord::Base.establish_connection(
#   :adapter => 'postgresql',
#   # :database => 'cardgenerator'
# )



local_db = {
  :adapter => 'postgresql',
  :database => 'cardgenerator'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || local_db )
