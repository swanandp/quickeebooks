require 'quickeebooks'
require 'quickeebooks/windows/model/meta_data'
require 'quickeebooks/windows/model/tax_line'
require 'quickeebooks/windows/model/estimate_header'
require 'quickeebooks/windows/model/estimate_line_item'

module Quickeebooks
  module Windows
    module Model
      class Estimate < Quickeebooks::Windows::Model::IntuitType
        include ActiveModel::Validations

        XML_COLLECTION_NODE = 'Estimates'
        XML_NODE            = 'Estimate'
        # https://services.intuit.com/sb/estimate/v2/<realmID>
        REST_RESOURCE       = 'estimate'


        xml_accessor :id,            :from => 'Id',           :as => Quickeebooks::Windows::Model::Id
        xml_accessor :sync_token,    :from => 'SyncToken'
        xml_accessor :meta_data,     :from => 'MetaData',     :as => Quickeebooks::Windows::Model::MetaData
        xml_accessor :external_key,  :from => 'ExternalKey',  :as => Quickeebooks::Windows::Model::Id
        xml_accessor :synchronized,  :from => 'Synchronized'
        xml_accessor :custom_fields, :from => 'CustomField',  :as => [Quickeebooks::Windows::Model::CustomField]
        xml_accessor :draft,         :from => 'Draft'
        xml_accessor :object_state,  :from => 'ObjectState'
        xml_accessor :header,        :from => 'Header',       :as => Quickeebooks::Windows::Model::EstimateHeader
        xml_accessor :line_items,    :from => 'Line',         :as => [Quickeebooks::Windows::Model::EstimateLineItem]
        xml_accessor :tax_line,      :from => 'TaxLine',      :as => Quickeebooks::Windows::Model::TaxLine

        validates_length_of :line_items, :minimum => 1

        def initialize
          ensure_line_items_initialization
        end

        private

        def after_parse
        end

        def ensure_line_items_initialization
          self.line_items ||= []
        end

      end
    end
  end
end
