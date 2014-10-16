# .configure

Simple configuration options

## Installation

Add this line to your application's Gemfile:

    gem 'dot_configure'

And then execute:

    $ bundle

## Usage

Extend DotConfigure to provide Class and Module level options

    class TestClass
      extend DotConfigure
    end

`TestClass` will now have availalbe configuration blocks and options!

    TestClass.configure do |config|
      config.dot_configure_rules = true
    end
    
    => #<DotConfigure::Options dot_configure_rules=true>

The options are an [OpenStruct](http://www.ruby-doc.org/stdlib-2.0/libdoc/ostruct/rdoc/OpenStruct.html) that has been extended in `dot_configure/options.rb` to allow for customization (simple monkey-patch the DotCongiure::Options class)

    > `TestClass.options.dot_configure_rules`
    => true

You may also include DotConfigure to provide Class and Module level options as well as seperate instance-level options

    class TestClass
      include DotConfigure
    end

    > `TestClass.new.options`
    => #<DotConfigure::Options>
	
Class/Module and instance level options are completely separate so each individual object can have it's own information.

## Contributing

1. Fork it ( https://github.com/jlorich/dot_configure/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request