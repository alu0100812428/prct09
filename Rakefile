require "bundler/gem_tasks"

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task :default => :spec

desc "Ejecutar espectativas"
task :spec do
    sh "rspec -I. spec/bib_spec.rb"
end

task :lista do
    sh "rspec -I. spec/lista_spec.rb"
end