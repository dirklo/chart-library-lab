require 'pry'

require_relative '../lib/song'
require_relative '../lib/artist'
require_relative '../lib/genre'
require_relative '../lib/arrangement'
require_relative '../lib/arranger'
require_relative '../lib/chart'

class AssociationTypeMismatchError < TypeError; end
