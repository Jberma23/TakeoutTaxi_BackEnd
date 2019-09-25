class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content
  belongs_to :reviewer, record_type: :user
  belongs_to :reviewed, recorder_type: :truck
end
