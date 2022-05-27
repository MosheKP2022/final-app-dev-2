json.extract! offering, :id, :title, :description, :image, :min_age, :max_age, :address, :price, :date, :time, :video, :status, :seller_id, :comments_count, :labeled_offerings_count, :saves_count, :created_at, :updated_at
json.url offering_url(offering, format: :json)
