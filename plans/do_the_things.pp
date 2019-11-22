# The $nodes parameter is a list of nodes to retrieve the facts for.
plan foo::do_the_things(TargetSpec $nodes) {
  $result_set = run_command('foo', $nodes)
  return $result_set
}
