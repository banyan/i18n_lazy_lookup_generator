# I18n lazy lookup generator (for Rails 3)

## WTF lazy lookup?

+ Rails has a way called "Lazy Lookup" in i18n.
+ it gives us a convenient way to look up the locale inside views.

See when you have the following yaml:

    es:
      books:
        index:
          title: "Foo"

You can look up the books.index.title value inside

    app/views/books/index.html.erb template like this (note the dot):
    <%= t '.title' %>

Also, Rails [recommends](http://guides.rubyonrails.org/i18n.html#organization-of-locale-files) to organize of locale files:

    |-views
    |---books
    |-----es.rb
    |-----en.rb
    |---users
    |-----es.rb
    |-----en.rb
    |---navigation
    |-----es.rb
    |-----en.rb

## Usage

`i18n_lazy_lookup:generate` generates files with controller name

    $ rails g i18n_lazy_lookup:generate
          create  config/locales/views
          create  config/locales/views/comments
          create  config/locales/views/comments/en.yml
          create  config/locales/views/comments/ja.yml
          create  config/locales/views/posts
          create  config/locales/views/posts/en.yml
          create  config/locales/views/posts/ja.yml

If file exists, it leaves.

    $ r g i18n_lazy_lookup:generate
           exist  config/locales/views
           exist  config/locales/views/comments
       identical  config/locales/views/comments/en.yml
       identical  config/locales/views/comments/ja.yml
           exist  config/locales/views/posts
       identical  config/locales/views/posts/en.yml
       identical  config/locales/views/posts/ja.yml

You can specify controller and action names with `i18n_lazy_lookup`

    $ r g i18n_lazy_lookup foo index show
       exist  config/locales/views
      create  config/locales/views/foo
      create  config/locales/views/foo/en.yml
      create  config/locales/views/foo/ja.yml

YAML will be like as below `config/locales/views/foo/ja.yml`

    ja:
      foo:
        index:
        show:

The default locale is `en`, but you can overide it in `config/application.rb`

    # Customize generators
    config.generators do |g|
      g.locales %w(en ja)
    end

## TODO

+ Create controller and scaffold hooks.
+ Add spec. also fixing code as well.

## License

i18n_lazy_lookup_generator is released under the MIT license.
