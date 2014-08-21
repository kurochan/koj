web: bundle exec ruby app/web.rb -p $PORT -e production
worker: bundle exec resque work -q judge -r app/jobs/jobs.rb
