require 'sinatra'
require 'resque'
require 'redis'
require File.expand_path('../jobs', __FILE__) + '/jobs'

Resque.redis = Redis.new

get '/' do
  @info = Resque.info
  erb :index
end

post '/post' do
  Resque.enqueue(JavaJudgeJob, Time.now.strftime("%Y%m%d%H%M%S%L"))
  redirect "/"
end

__END__

@@ index
<html>
  <head><title>Resque Demo</title></head>
  <body>
    <p>
      There are <%= @info[:pending] %> pending and <%= @info[:processed] %> processed jobs across <%= @info[:queues] %> queues.
    </p>
    <form action='/post' method='POST'>
      <input type="submit" value="Create Judge Job"/>
    </form>
  </body>
</html>
