# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
	#inflect.plural /([taeiou])([A-Z]|_|\$)/, '\1s\2'
  #inflect.plural /([rlnd])([A-Z]|_|$)/, '\1es\2'
  #inflect.singular /([taeiou])s([A-Z]|_|$)/, '\1\2'
  #inflect.singular /([rlnd])es([A-Z]|_|$)/, '\1\2'
  inflect.irregular "dispositivo", "dispositivos"
end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end

