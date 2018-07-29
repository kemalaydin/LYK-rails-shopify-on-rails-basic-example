class ApplicationController < ActionController::Base

    before_action :authenticate_user!
    ## multi lang desteği
    def default_url_options
        { locale: I18n.locale }
    end
end
