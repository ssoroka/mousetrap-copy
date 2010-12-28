module Mousetrap
  class Invoice < Resource
    attr_accessor \
      :id,
      :number,
      :billing_date,
      :created_at

    def initialize(hash = {})
      super(self.class.attributes_from_api(hash))
    end

    protected

    def self.plural_resource_name
      'invoices'
    end

    def self.singular_resource_name
      'invoice'
    end

    def attributes
      {
        :id           => id,
        :number       => number,
        :billing_date => billing_date,
        :created_at   => created_at
      }
    end

    def self.attributes_from_api(attributes)
      {
        :id           => attributes['id'],
        :number       => attributes['number'],
        :billing_date => attributes['billingDatetime'],
        :created_at   => attributes['createdDatetime']
      }
    end
  end
end