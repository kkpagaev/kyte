class Repository < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :project
  belongs_to :boilerplate

  before_save :create_gilab_project!

  private

  def create_gilab_project!
    project = Gitlab.create_project(name)
    remote_id = project.id
  end
end
