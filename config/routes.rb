Rails.application.routes.draw do
  scope :dashboard do
    get '/sales_report', action: :sales_report, controller: :dashboard
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
