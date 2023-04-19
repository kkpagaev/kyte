# module Gitlab
# def self.create_project(name)
# object = Object.new
# def object.id
# 123
# end
# object
# end
# end

class Repository < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :project
  belongs_to :boilerplate

  before_save :create_gilab_project

  after_create :fill_project_with_boilerplate

  after_destroy :delete_project

  def add_team_member(user)
    Gitlab.add_team_member(remote_id, user.gitlab_id, 40)

    users << user
  end

  def remove_team_member(user)
    Gitlab.remove_team_member(remote_id, user.gitlab_id)

    users.delete(user)
  end

  def remote_project
    Gitlab.project(@remote_id)
  end

  def delete_project
    Gitlab.delete_project(remote_id)
  end

  private

  def create_gilab_project
    project = Gitlab.create_project(name)
    self.remote_id = project.id
    self.remote = project.ssh_url_to_repo
    self.remote_url = project.http_url_to_repo
  end

  def fill_project_with_boilerplate
    FillRepositoryJob.perform_async(id)
  end
end
