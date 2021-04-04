class Reflection < ApplicationRecord
  REFLECTION_MOODS = %w[happy sad anxious angry].freeze
  has_rich_text :note
  
  belongs_to :account
  belongs_to :creator, class_name: "User"

  enum mood: REFLECTION_MOODS

  validates :mood, presence: true
  validates :completed, presence: true,
                        uniqueness: {
                          scope: :account,
                          message: "there should only be one reflection per day"
                        }
  validate :completed_cannot_be_in_the_future

  def completed_cannot_be_in_the_future
    return unless completed.present? && completed > Time.zone.today

    errors.add(:completed, "reflection cannot be in the future")
  end

  def self.select_from_collection(date, reflections)
    selection = reflections.select { |x| x.completed == date }

    return nil if selection.empty?

    selection.first
  end

  def self.display_classes_for(date, reflections)
    selection = select_from_collection(date, reflections)
    today = Time.zone.today

    display_classes = ["mood-block"]
    display_classes << "future-date" if date > today
    display_classes << "today" if date == today
    display_classes << "past-date" if date < today
    display_classes << selection.mood unless selection.nil?

    display_classes
  end

  def self.label_for(date, reflections)
    return if date > Time.zone.today

    # reflection = reflections.select { |x| x.completed = date }
    reflection = reflections.reject { |x| x.completed != date }

    return reflection[0][:mood].titleize if reflection.any?

    "No Record"
  end

  def self.present_on?(account, date)
    return false unless where(account: account, completed: date).exists?

    true
  end

  def self.get_id_on(account, date)
    where(account: account, completed: date).first.id
  end
end
