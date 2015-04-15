#create a class to map to database table
class Card < ActiveRecord::Base

  #prevent user from submitted blank posts which creates empty data in table
  # validates :title,  :presence => true

  # belongs_to :category #singular because belongs_to means one

end

