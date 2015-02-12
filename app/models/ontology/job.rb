module Ontology
  class Job
    include Mongoid::Document
    include Mongoid::Timestamps

    field :title, type: String
    field :job_ids, type: Array

    has_and_belongs_to_many :jobs, class_name: '::Job'
  end
end