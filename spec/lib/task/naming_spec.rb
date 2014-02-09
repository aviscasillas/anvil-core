require 'spec_helper'
require 'alfred/task/naming'

describe Alfred::Task::Naming do
  let(:klass) { DummyTask }

  describe '#task_name' do
    it 'returns the correct task name' do
      expect(klass.task_name).to be_eql('dummy')
    end
  end

  describe '.from_name' do
    context 'without a namespace' do
      it 'finds the task class' do
        klass.from_name('dummy').should eq(DummyTask)
      end
    end

    context 'with a namespace' do
      it 'finds the namespaced tasks class' do
        klass.from_name('foo:dummy').should eq(Foo::DummyTask)
      end
    end
  end
end
