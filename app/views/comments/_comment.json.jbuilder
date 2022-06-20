json.extract! comment, :id, :commenter_id, :offering_id, :body, :private, :created_at, :updated_at
json.url comment_url(comment, format: :json)
