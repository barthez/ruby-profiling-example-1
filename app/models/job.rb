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

  field :ontology_job_ids, type: Array

  slug :title

  belongs_to :employer, counter_cache: true
  has_and_belongs_to_many :ontology_jobs, class_name: 'Ontology::Job'

  scope :faster, -> { only(:title, :slugs, :ontology_job_ids).includes(:ontology_jobs) }
end