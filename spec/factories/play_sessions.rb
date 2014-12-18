FactoryGirl.define do
  factory :play_session do
    name "Test Play Session"
    start_time "08:00:00"
    end_time "12:00:00"
    monday true
    tuesday false
    wednesday true
    thursday false
    friday true
    saturday false
    sunday false
    capacity 30
  end
end
