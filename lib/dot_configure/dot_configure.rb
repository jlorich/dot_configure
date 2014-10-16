require 'dot_configure/options'

# A configureable options implementation for any module
module DotConfigure
  def self.included(base)
    base.extend(DotConfigure)
  end

  # Memoizes the configuration
  def options
    @options ||= Options.new(default_options)

    @options.locked? ? @options.clone : @options
  end

  # Configure the options
  def configure(lock: false)
    fail 'You must specify a configuration block when calling configure' unless block_given?
    fail 'Configuration already set' if options.locked?
    yield(options)

    options.locked = lock
    options
  end

  private

  # Customizable default options
  def default_options
    {}
  end
end
