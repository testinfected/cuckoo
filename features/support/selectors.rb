module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  #   When /^(.+) within (.+)$/ do |step, scope|
  #
  # step definitions in web_steps.rb
  #
  def selector_for(locator)
    case locator

      when "the page"
        "html > body"

      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #  when /^the (notice|error|info) flash$/
      #    ".flash.#{$1}"

      # You can also return an array to use a different selector
      # type, like:
      #
      #  when /the header/
      #    [:xpath, "//header"]

      # This allows you to provide a selector as the scope
      # for "within" steps as was previously the default for the
      # web steps:
      else
        locator
    end
  end
end

World(HtmlSelectorsHelpers)
