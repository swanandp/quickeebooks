require 'quickeebooks/online/model/id'

module Quickeebooks
  module Online
    module Model
      class EstimateLineItem < Quickeebooks::Online::Model::IntuitType
        xml_name 'Line'

        xml_accessor :id,       :from => 'Id',        :as => Integer
        xml_accessor :desc,     :from => 'Desc'
        xml_accessor :price,    :from => 'UnitPrice', :as => Float
        xml_accessor :amount,   :from => 'Amount',    :as => Float
        xml_accessor :item_id,  :from => 'ItemId',    :as => Quickeebooks::Online::Model::Id
        # Qty should be ideally Integer, but API document suggests otherwise
        xml_accessor :quantity, :from => 'Qty',       :as => Float
      end
    end
  end
end
