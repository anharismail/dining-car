# frozen_string_literal: true

class Recipe < ApplicationRecord
  paginates_per 16

  belongs_to :user
  belongs_to :course, optional: true
  belongs_to :cuisine, optional: true

  validates :title, presence: true

  scope :by_title, -> { order(title: :asc) }
  scope :by_created_at, -> { order(created_at: :desc) }
  scope :with_public, -> { where(public: true) }
  scope :with_course, -> (course_id) { where(course_id: course_id) }
  scope :with_cuisine, -> (cuisine_id) { where(cuisine_id: cuisine_id) }
  scope :search_for, -> (search) { where('title ilike ?', "%#{search}%") }
end
