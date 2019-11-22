# The $nodes parameter is a list of nodes
plan foo::do_the_things(TargetSpec $targets) {
  $result_set = run_command('foo', $targets)
  return $result_set
}
