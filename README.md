# I18n lazy lookup generator (for Rails 3)

## WTF?

"Lazy Lookup" which gives us a convenient way to look up the locale inside views.

When you have the following yaml:

    es:
      books:
        index:
          title: "Foo"

you can look up the books.index.title value inside

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

## Example

## TODO
