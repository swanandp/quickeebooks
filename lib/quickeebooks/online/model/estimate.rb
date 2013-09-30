require "quickeebooks"
require "quickeebooks/online/model/estimate_header"
require "quickeebooks/online/model/estimate_line_item"

module Quickeebooks
  module Online
    module Model
      class Estimate < Quickeebooks::Online::Model::IntuitType
        XML_NODE      = "Estimate"
        REST_RESOURCE = "estimate"
        
        xml_accessor :header,     :from => 'Header', :as => Quickeebooks::Online::Model::EstimateHeader
        xml_accessor :line_items, :from => 'Line',   :as => [Quickeebooks::Online::Model::EstimateLineItem]

      end
    end
  end
end
