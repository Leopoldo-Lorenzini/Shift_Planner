module ApplicationHelper
  def time_to_grid_position(time_str)
    hour, minute = time_str.split(':').map(&:to_i)
    ((hour - 7) * 2) + (minute / 30) + 2 # Adjust the row start position (7:00 should start at row 2)
  end

  def day_to_grid_column(day)
    days = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
    day_index = days.index(day)
    if day_index.nil?
      Rails.logger.warn "Invalid day value: #{day}"
      return 1 # Default column (could be adjusted based on your requirements)
    end
    day_index + 2
  end
end
