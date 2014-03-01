class PagesController < ApplicationController
  skip_authorization_check
  layout false, only: :curu_main
end
