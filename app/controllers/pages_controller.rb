class PagesController < ApplicationController
  skip_authorization_check
  layout 'layout', except: :curu_main
end
