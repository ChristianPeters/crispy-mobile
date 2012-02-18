Gem::Specification.new do |s|
  # Release Specific Information
  s.version = "0.0.1"
  s.date = "2012-02-18"

  # Gem Details
  s.name = "crispy-mobile"
  s.authors = ["Christian Peters"]
  s.summary = %q{Crispy Mobile tells you which device requests your Rails page. Be responsive on the server side!}
  s.description = %q{CSS Media Requeries are a nice idea but don't cut down payload size. Serve only what is needed for each device. This gem lets you access device information in a Rails controller/view. Now be really responsive!}
  s.email = "info@c-peters.net"
  s.homepage = "https://github.com/ChristianPeters/crispy-mobile"

  # Gem Files
  s.files = %w(README.md MIT-LICENSE)
  s.files += Dir.glob("lib/**/*.*")

  # Gem Dependencies
  s.rubygems_version = %q{1.3.6}
  s.add_dependency 'wurfl-lite-middleware', '~> 1.0.6'
end

