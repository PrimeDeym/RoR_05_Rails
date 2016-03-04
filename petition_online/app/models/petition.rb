class Petition < ActiveRecord::Base
  validates :title, :text, presence: true,
                    length: { minimum: 5 }
end
