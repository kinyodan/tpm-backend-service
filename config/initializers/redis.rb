# frozen_string_literal: true

Redis.current = Redis.new(url:  ENV['REDIS_URL'],
                          port: ENV['REDIS_PORT'],
                          db:   ENV['REDIS_DB'])
p "redis server started "
p Redis.current