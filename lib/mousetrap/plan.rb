module Mousetrap
  class Plan < Resource
    attr_accessor \
      :code,
      :name,
      :items,
      :recurring_charge_amount

    def self.all
      response = get_resources plural_resource_name
      return [] unless response['plans']
      build_resources_from response
    end

    protected

    def self.plural_resource_name
      'plans'
    end

    def self.singular_resource_name
      'plan'
    end

    def self.attributes_from_api(attributes)
      {
        :code                    => attributes['code'],
        :name                    => attributes['name'],
        :items                   => attributes['items'],
        :recurring_charge_amount => attributes['recurringChargeAmount']
      }
    end
  end
end
