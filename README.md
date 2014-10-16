# .configure

Easily add configuration options to classes, modules, and object instances.

## Installation

Add this line to your application's Gemfile:

    gem 'dot_configure'

And then execute:

    $ bundle

## Usage

#####Extend DotConfigure to provide Class and Module level options

    class TestClass
      extend DotConfigure
    end

`TestClass` will now have a configure method and options!

    TestClass.configure do |config|
      config.dot_configure_rules = true
    end
    
    => #<DotConfigure::Options dot_configure_rules=true>

The resulting options are now available at `TestClass.options`

#####Include DotConfigure to provide instance level options
When you `include` dotconfigure, rather than extend, you get all the Class/Module level options, but also get seperate instance-level options objects.

    class TestClass
      include DotConfigure
    end

    > `TestClass.new.options`
    => #<DotConfigure::Options>
  
Class/Module and instance level options are completely separate so each individual object can have it's own information.

#####DotConfigure::Options
The options returned are an [OpenStruct](http://www.ruby-doc.org/stdlib-2.0/libdoc/ostruct/rdoc/OpenStruct.html) that has been extended in `dot_configure/options.rb` to allow for specific monkey-patching if desired.  OpenStructs allow for hash, string and dot access to any values.

    > `TestClass.options.dot_configure_rules`
    => true
    
    > `TestClass.options[:dot_configure_rules]`
    => true
    
    > `TestClass.options['dot_configure_rules']`
    => true

#####Locking
When calling `configure` can also pass in `lock: true` to prevent further write access to the options.  Once configured with the lock setting, any subsequent attempts to call `.configure` will fail.  Also, calls to `.options` will return a cloned options hash so modifications will not be saved.

To call a locking configure method simply set the keyword argument:

    TestClass.configure(lock: true) do |config|
      config.dot_configure_rules = true
    end

## Contributing

1. Fork it ( https://github.com/jlorich/dot_configure/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request