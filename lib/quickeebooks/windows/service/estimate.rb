require 'quickeebooks/windows/service/service_base'
require 'quickeebooks/windows/model/estimate'
require 'quickeebooks/windows/model/estimate_header'
require 'quickeebooks/windows/model/estimate_line_item'
require 'tempfile'

module Quickeebooks
  module Windows
    module Service
      class Estimate < Quickeebooks::Windows::Service::ServiceBase

        # Fetch a +Collection+ of +Estimate+ objects
        # Arguments:
        # filters: Array of +Filter+ objects to apply
        # page: +Fixnum+ Starting page
        # per_page: +Fixnum+ How many results to fetch per page
        # sort: +Sort+ object
        # options: +Hash+ extra arguments
        def list(filters = [], page = 1, per_page = 20, sort = nil, options = {})
          fetch_collection(Quickeebooks::Windows::Model::Estimate, nil, filters, page, per_page, sort, options)
        end

        def estimate_as_pdf(estimate_id, destination_file_name)
          raise NoMethodError, 'estimate_as_pdf is not implemented in Quickeebooks for Windows, only available in the Online adapter.'
        end

        def fetch_by_id(id, idDomain = 'QB', options = {})
          url = "#{url_for_resource(Quickeebooks::Windows::Model::Estimate::REST_RESOURCE)}/#{id}"
          fetch_object(Quickeebooks::Windows::Model::Estimate, url, {:idDomain => idDomain})
        end

        def create(estimate)
          # XML is a wrapped 'object' where the type is specified as an attribute
          #    <Object xsi:type="Estimate">
          xml_node = estimate.to_xml(:name => 'Object')
          xml_node.set_attribute('xsi:type', 'Estimate')
          xml = Quickeebooks::Shared::Service::OperationNode.new.add do |content|
            content << "<ExternalRealmId>#{self.realm_id}</ExternalRealmId>#{xml_node}"
          end
          perform_write(Quickeebooks::Windows::Model::Estimate, xml)
        end

        def update(estimate)
          # XML is a wrapped 'object' where the type is specified as an attribute
          #    <Object xsi:type="Estimate">

          # Intuit requires that some fields are unset / do not exist.
          estimate.meta_data = nil
          estimate.external_key = nil

          # unset Id fields in addresses
          if estimate.header.billing_address
            estimate.header.billing_address.id = nil
          end

          if estimate.header.shipping_address
            estimate.header.shipping_address.id = nil
          end

          xml_node = estimate.to_xml(:name => 'Object')
          xml_node.set_attribute('xsi:type', 'Estimate')
          xml = Quickeebooks::Shared::Service::OperationNode.new.mod do |content|
            content << "<ExternalRealmId>#{self.realm_id}</ExternalRealmId>#{xml_node}"
          end
          perform_write(Quickeebooks::Windows::Model::Estimate, xml)
        end

      end
    end
  end
end
