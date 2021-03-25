class Reflection < ApplicationRecord
  REFLECTION_MOODS = %w[happy sad anxious angry].freeze

  belongs_to :account
  belongs_to :creator, class_name: "User"

  enum mood: REFLECTION_MOODS

  validates :mood, presence: true
  validates :completed, presence: true,
                        uniqueness: { scope: :account, message: "there should only be one reflection per day" }
  validate :completed_cannot_be_in_the_future

  def completed_cannot_be_in_the_future
    return unless completed.present? && completed > Date.today

    errors.add(:completed, "reflection cannot be in the future")
  end

  def self.display_classes_for(date, reflections)
    reflection = reflections.select { |x| x.completed = date }
    display_classes = ["mood-block"]
    display_classes << "future-date" if date > Date.today
    display_classes << "past-date" if date < Date.today
    display_classes << reflection[0][:mood] if reflection.any?

    display_classes
  end
end
