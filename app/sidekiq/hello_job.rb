class HelloJob
  include Sidekiq::Job

  def perform(*args)
    sleep 5.seconds
    puts "Hello from HelloJob!"
  end
end
