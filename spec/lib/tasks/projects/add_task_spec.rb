require 'spec_helper'
require 'tasks/projects/add_task'
require 'fileutils'

describe Projects::AddTask do
  let(:repo_url) { 'git@github.com:account/repo' }
  before  { Anvil::Config.send :init_base_path }

  subject { described_class.new('repo', 'account/repo') }

  describe '#task' do
    it 'clones the repo with proper arguments' do
      expect(subject).to receive(:clone_repo)
        .with(repo_url, 'repo')

      subject.task
    end
  end

  describe '#clone_repo', config: true do
    it 'clones the repo with Git' do
      expect(Git).to receive(:clone)

      subject.clone_repo(repo_url, 'repo')
    end
  end
end
