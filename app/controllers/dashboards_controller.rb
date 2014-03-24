class DashboardsController < ApplicationController

  def index
    @events = Event.ytd_attendance

    @chart_title = "YTD Attendance"
    respond_to do |format|
      format.html
      format.js
    end
  end

end
