class School < ApplicationRecord

  with_options presence: true do
    validates :school_name,   format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])/}, length: { minimum: 10 }
  end

end
