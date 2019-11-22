require 'spec_helper'

return unless defined?(BoltSpec::Plans) # puppet 5 pipelines can't include bolt

describe 'foo::do_the_things' do
  BoltSpec::Plans.init
  include BoltSpec::Plans # <-- needed to make `run_plan` available in examples
  it 'returns' do
    puts '', '=' * 80, "modulepath:\n#{modulepath}", '=' * 80, ''
    puts '', '=' * 80, "config.modulepath:\n#{config.modulepath}", '=' * 80, ''
    puts '', "==== modulepath == config.modulepath: '#{modulepath == config.modulepath}'"
    modulepath.each do |path|
      file = File.join(path, 'foo', 'do_the_things.pp')
      puts "!!!! Found #{file}\n!!!! modulepath: #{modulepath}" if File.exist?(file)
    end
    allow_task('my_task').always_return('result_key' => 10)
    expect(run_plan('foo::do_the_things', 'param1' => 10)).to be_ok
  end
end
