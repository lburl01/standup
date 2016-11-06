
class SchedulesController < ApplicationController

  def get_10_events
    calendar = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    render json: calendar.get_calendar('primary')
  end

end
