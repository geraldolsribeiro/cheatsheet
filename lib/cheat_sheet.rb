%w(
  json
  thread
  active_support/dependencies
).each { |lib| require lib }

Thread.abort_on_exception = true
Encoding.default_external = Encoding.find('UTF-8')

%w(
  gist_core
  gist_output
  gist_help
  gist_commands
).each { |name| require_dependency File.expand_path("../cheatsheet/#{name}", __FILE__) }
