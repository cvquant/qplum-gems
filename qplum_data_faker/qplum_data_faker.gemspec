lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name = %q{qplum_data_faker}
  s.version = "0.0.0"
  s.date = %q{2011-09-29}
  s.summary = %q{Wrapper gem over faker to fake qplum related data}
  s.files = Dir[
    'lib/*.rb',
    'lib/*/*.rb'
  ]
  s.authors     = ["Karun"]
  s.require_paths = ["lib"]
  s.add_dependency 'faker'
  s.add_dependency 'activesupport'
end
