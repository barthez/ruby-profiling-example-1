class Job
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include Mongoid::Slug

  field :title, type: String
  field :location, type: String
  field :country_code, type: String
  field :locale, type: String
  field :employer_id, type: String

  field :body, type: String
  field :cleaned_body, type: String

  belongs_to :employer, counter_cache: true
end