module Blorgh
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh
    config.active_job.queue_adapter = :sidekiq
  end
end
