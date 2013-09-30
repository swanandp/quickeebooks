require "quickeebooks"
require "quickeebooks/online/model/id"
require "quickeebooks/online/model/meta_data"
require "quickeebooks/online/model/address"
require "quickeebooks/online/model/phone"
require "quickeebooks/online/model/web_site"
require "quickeebooks/online/model/email"
require "quickeebooks/online/model/open_balance"
# require "quickeebooks/online/model/estimate_line_item"

module Quickeebooks
  module Online
    module Model
      class EstimateHeader < Quickeebooks::Online::Model::IntuitType

        xml_convention :camelcase
        xml_accessor :id,               :from => 'Id',         :as => Quickeebooks::Online::Model::Id
        xml_accessor :sync_token,       :from => 'SyncToken',  :as => Integer
        xml_accessor :meta_data,        :from => 'MetaData',   :as => Quickeebooks::Online::Model::MetaData
        xml_accessor :note,             :from => 'Note'
        xml_accessor :status,           :from => 'Status'
        xml_accessor :message,          :from => 'Msg'
        xml_accessor :document_number,  :from => 'DocNumber'
        xml_accessor :transaction_date, :from => 'TxnDate'
        xml_accessor :customer_id,      :from => 'CustomerId', :as => Quickeebooks::Online::Model::Id
        xml_accessor :billing_address,  :from => 'BillAddr',   :as => Quickeebooks::Online::Model::Address
        xml_accessor :shipping_address, :from => 'ShipAddr',   :as => Quickeebooks::Online::Model::Address

      end
    end
  end
end
