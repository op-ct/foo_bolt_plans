begin
  require 'bolt_spec/plans'
  # BoltSpec::Plans.init
rescue LoadError => e
  warn e.message
  warn '=== bolt tests will not run; ensure bolt gem is installed (requires Puppet 6+)'
end
