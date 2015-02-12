class Employer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :_id, type: String, default: -> { name.to_param }
  field :catch_phrase, type: String
  field :logo_url, type: String

  field :job_counts, type: Integer, default: 0

  has_many :jobs
end