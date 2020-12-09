# frozen_string_literal: true

module Northwind::Cell
  class Layout < Trailblazer::Cell
    include ActionView::Helpers::CsrfHelper
    include ActionView::Helpers::CspHelper
    include Webpacker::Helper

    def content_security_policy?
      controller.send :content_security_policy?
    end
  end
end
