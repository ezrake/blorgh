module Blorgh
  class ReportsController < ApplicationController

    def index
      user = main_app.scope.current_user
      @reports = Report.where(user_id: user.id)
    end

    def download
      report = Report.find_by(id: params[:id])
      send_file(
        report.file_url,
        filename: "csv_report",
        type: "text/csv",
      )
    end

  end
end
