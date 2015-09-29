require 'uk_mail/soap_service/collection'
require 'uk_mail/session'

module UKMail
  module Service
    class CollectionService < Base
      def soap_namespace
        SoapService::Collection
      end

      def soap_service
        soap_namespace::IUKMCollectionService
      end

      def book_collection(params = {})
        service.bookCollection(soap_namespace::BookCollection.new(soap_namespace::BookCollectionWebRequest.new(

          @session.auth_token,
          params[:username],
          params[:account_number],
          params[:closed_for_lunch],
          params[:earliest_time],
          params[:latest_time],
          params[:requested_collection_date],
          params[:special_instructions]

        ))).bookCollectionResult
      end
    end
  end
end
