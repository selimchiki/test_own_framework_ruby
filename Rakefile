namespace :db do
  desc "Run migrations"
  task :migrate do |t|
    puts "Migrating..."
    require "sequel"
    Sequel.extension :migration
    connexion = ENV["DATABASE_URL"] || File.read("db/configuration_development").chomp
    db = Sequel.connect(connexion)
    Sequel::Migrator.run(db, "db/migrations")
    puts "Done."
  end
end

namespace :css do
  desc "Build full.css"
  task :compile do |t|
    require_relative 'lib/application'
    puts "Building `full.css`..."
    IncludeCSS.new.full_build
    puts "Done."
  end
end