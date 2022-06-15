module Blorgh
  class ReportsController < ApplicationController
    def index
      user = main_app.scope.current_user
      @reports = Report.where(user_id: user.id)
    end

    def download
      report = Report.find_by(id: params[:id])
      file_name = report.created_at.strftime("%B %I:%M Report")
      send_file(
        report.file_url,
        filename: "#{file_name}.csv",
        type: "text/csv",
      )
    end
  end
end
