require 'resque'

RESULTS_DIR = File.expand_path('../../../results', __FILE__)
Resque.logger.level = Logger::INFO

Dir[File.expand_path('..', __FILE__) << '/*.rb'].each do |file|
    require file
end
