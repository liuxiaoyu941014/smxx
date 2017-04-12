module AppAPI
  module Entities
    class ShoppingCart < Base

      # public attributes
      expose_id
      expose :amount, documentation: { desc: '产品数量', type: Integer }
      expose :price, documentation: { desc: '产品价格', type: Float }
      expose :product, using: AppAPI::Entities::Product, if: lambda { |instance, options| (options[:includes] || []).include?(:product) }
    end
  end
end
