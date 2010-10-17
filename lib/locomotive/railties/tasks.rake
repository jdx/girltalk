# Re-definitions are appended to existing tasks

namespace :locomotive do
  namespace :jobs do
    desc "Clear the delayed_job queue."
    task :clear => :environment do
      Delayed::Job.delete_all
    end

    desc "Start a delayed_job worker."
    task :work => :environment do
      puts "Delayed::Job.new = #{Delayed::Job.new.inspect}"
      ::Delayed::Worker.new(:min_priority => ENV['MIN_PRIORITY'], :max_priority => ENV['MAX_PRIORITY']).start
    end
  end
end