require 'spec_helper'

return unless defined?(BoltSpec::Plans) # puppet 5 pipelines can't include bolt

describe 'foo::do_the_things' do
  it 'runs successfully with no targets' do
    puts '', '=' * 80, "modulepath:\n#{modulepath}", '=' * 80, ''
    puts '', '=' * 80, "config.modulepath:\n#{config.modulepath}", '=' * 80, ''
    puts '', "==== modulepath == config.modulepath: '#{modulepath == config.modulepath}'", ''
    expect(run_plan('foo::do_the_things', 'targets' => [])).to be_ok
  end

  it 'runs successfully with some targets' do
    allow_command('foo').always_return(stdout: 'foo has been done!')
    result = run_plan('foo::do_the_things', 'targets' => ['node1', 'node2'])
    expect(result).to be_ok
    expect(result.value.class).to eq(Bolt::ResultSet)
  end
end
