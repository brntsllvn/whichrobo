class Book < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :book_store

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |book|
        csv << book.attributes.values_at(*column_names)
      end
    end
  end
end
