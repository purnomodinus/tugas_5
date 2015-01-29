class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :title, presence: true,

                            length: { minimum: 5 }

        validates :content, presence: true,

                            length: { minimum: 10 }

    def self.to_csv(option = {})
    	CSV.generate do |csv|
    		csv << column_names
    		all.each do |article|
    			csv << article.attributes.values_at(*column_names)

    	end
    end
    end
end
