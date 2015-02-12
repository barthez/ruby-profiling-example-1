namespace :faker do

  desc "Generate fake employers (NUMBER=5)"
  task :employers => :environment do
    ENV.fetch('NUMBER', 5).to_i.times do
      Employer.create(
        name: Faker::Company.name,
        logo_url: Faker::Company.logo,
        catch_phrase: Faker::Company.catch_phrase
      )
    end
  end
end