# -*- encoding: utf-8 -*-
require File.expand_path('../lib/i18n_lazy_lookup_generator/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors           = ["Kohei Hasegawa"]
  gem.email             = ["ameutau@gmail.com"]
  gem.summary           = %q{Generates I18n lazy lookup locale files for Rails 3}
  gem.description       = %q{A Rails generator plugin & gem that generates Rails I18n lazy lookup locale files.}
  gem.homepage          = 'https://github.com/banyan/i18n_lazy_lookup_generator'

  gem.rubyforge_project = 'i18n_lazy_lookup_generator'
  gem.files             = `git ls-files`.split($\)
  gem.executables       = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files        = gem.files.grep(%r{^(test|spec|features)/})
  gem.name              = "i18n_lazy_lookup_generator"
  gem.require_paths     = ["lib"]
  gem.licenses          = ['MIT']
  gem.version           = I18nLazyLookupGenerator::VERSION

  gem.add_development_dependency "rspec", "~> 2.9"
end
