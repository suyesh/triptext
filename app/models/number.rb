class Number < ActiveRecord::Base
  belongs_to :message
  belongs_to :contact
end
