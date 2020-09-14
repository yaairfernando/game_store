class SalesReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform
    sleep(5)
    puts "------------------------------"
    puts "------------------------------"
    puts "------------------------------"
    puts "---PERFORMING WORKER NOW------"
    SalesReport.refresh
    puts "------------------------------"
    puts "------------------------------"
    puts "------------------------------"
  end
end