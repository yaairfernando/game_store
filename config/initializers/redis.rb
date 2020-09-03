# require 'redis'
# Redis.current = Redis.new(:host => ENV["REDIS_HOST"], :port => ENV["REDIS_PORT"])


# Sidekiq.configure_server do |config|
#   config.redis = { url: ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" } }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" } }
# end