class SalesReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform
    SalesReport.refresh
  end
end