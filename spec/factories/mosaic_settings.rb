FactoryBot.define do
  factory :mosaic_setting do
    color_scheme { "" }
    show_numbers { false }
    show_labels { false }
    show_upcoming_dates { false }
    show_skipped_days { false }
  end
end
