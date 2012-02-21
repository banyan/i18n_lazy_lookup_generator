# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'i18n_lazy_lookup_generator/version'

Gem::Specification.new do |s|
  s.name              = 'i18n_lazy_lookup_generator'
  s.version           = I18nLazyLookupGenerator::VERSION
  s.platform          = Gem::Platform::RUBY
  s.authors           = ['Kohei Hasegawa']
  s.email             = 'ameutau@gmail.com'
  s.homepage          = 'https://github.com/banyan/i18n_lazy_lookup_generator'
  s.summary           = 'Generates I18n lazy lookup locale files for Rails 3'
  s.description       = 'A Rails generator plugin & gem that generates Rails I18n lazy lookup locale files.'
  s.rubyforge_project = 'i18n_lazy_lookup_generator'
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths     = ['lib']
  s.licenses          = ['MIT']
end
