namespace :faker do
  desc "Generate fake employers (NUMBER=5)"
  task :employers => :environment do
    number = ENV.fetch('NUMBER', 5).to_i
    progress = ProgressBar.create(title: "Employer", total: number)
    number.times do
      Employer.create(
        name: Faker::Company.name,
        logo_url: "logos/small/color/#{1 + rand(11)}.png",
        catch_phrase: Faker::Company.catch_phrase
      )
      progress.increment
    end
  end

  desc "Generate fake ontology jobs (NUMBER=5)"
  task :ontology_jobs => :environment do
    number = ENV.fetch('NUMBER', 5).to_i
    progress = ProgressBar.create(title: "Ontology::Job", total: number)
    number.times do
      Ontology::Job.create(title: Faker::Name.title)
      progress.increment
    end
  end

  desc "Generate fake jobs (NUMBER=5)"
  task :jobs => :environment do
    number = ENV.fetch('NUMBER', 5).to_i
    progress = ProgressBar.create(title: "Job", total: number*Employer.count)
    Employer.all.each do |employer|
      number.times do
        cc = ISO3166::Country.all.sample.last
        country = ISO3166::Country[cc]
        html = <<-EOF
<h3>#{Faker::Lorem.sentence}</h3>
<p>#{Faker::Lorem.paragraph(5)}</p>
<h3>#{Faker::Lorem.sentence}</h3>
<ul>
  <li>#{Faker::Lorem.sentence}</li>
  <li>#{Faker::Lorem.sentence}</li>
  <li>#{Faker::Lorem.sentence}</li>
  <li>#{Faker::Lorem.sentence}</li>
  <li>#{Faker::Lorem.sentence}</li>
</ul>
EOF
        employer.jobs.create(
          title: Faker::Name.title,
          location: country.name,
          country_code: cc,
          locale: country.languages.sample,
          body: html,
          cleaned_body: html
        )
        progress.increment
      end
    end
  end


  desc "Match jobs and ontology jobs"
  task :match => :environment do
    oids = Ontology::Job.pluck(:id)
    progress = ProgressBar.create(title: "Job", total: Job.unscoped.count)
    Job.unscoped.each do |job|
      job.ontology_job_ids = oids.sample(5)
      job.save
      progress.increment
    end


  end
end