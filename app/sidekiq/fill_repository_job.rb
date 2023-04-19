class FillRepositoryJob
  include Sidekiq::Job

  def perform(*args)
    id = args[0]
    repository = Repository.find(id)
    boilerplate = repository.boilerplate
    tmp = Dir.mktmpdir

    # Clone the boilerplate
    Git.clone(boilerplate.git_link, tmp)

    # Remove the .git folder
    FileUtils.rm_rf("#{tmp}/.git")

    # Initialize a new git repository
    git = Git.init(tmp)
    git.config('user.name', 'kkpagaev')
    git.config('user.email', 'kapagaev111@gmail.com')

    # Add all files to the repository
    git.add(:all => true)

    # Commit the changes
    git.commit("init")

    git.add_remote("origin", repository.remote)
    git.push("origin", "main", {
      :push_option => "--set-upstream origin main",
      :config => [
        'core.sshCommand=ssh -i /home/kkpagaev/gitlab_test_rsa',
      ]
    })
  end
end
