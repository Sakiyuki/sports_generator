# == Schema Information
#
# Table name: sports
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sport < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :description

  has_many :teams
end
