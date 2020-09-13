class SalesReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform
    sleep(5)
    SalesReport.refresh
  end
end