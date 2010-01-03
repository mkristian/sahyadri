class PhrasesController < ApplicationController

skip_before_filter :guard, :authenticate

include Ixtlan::Controllers::TextsController

end
