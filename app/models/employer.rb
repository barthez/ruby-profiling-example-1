class Employer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :_id, type: String, default: -> { name.parameterize }
  field :catch_phrase, type: String
  field :logo_url, type: String

  field :jobs_count, type: Integer, default: 0

  has_many :jobs

  def cache_key
    time = jobs.pluck(:updated_at, :deleted_at).map { |t| t.compact.max }.max.utc.nsec
    [id, time]
  end
end