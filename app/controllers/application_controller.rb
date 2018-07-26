class ApplicationController < ActionController::Base

    ## multi lang desteği
    def default_url_options
        { locale: I18n.locale }
    end
end
