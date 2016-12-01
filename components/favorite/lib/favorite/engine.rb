module Favorite
  class Engine < ::Rails::Engine
    isolate_namespace Favorite
    require 'cells'
    require 'cells-rails'
    require 'cells-slim'

    config.cells.with_assets = ["favorite/base_cell"]

    require 'favorite/acts_as_favoriteable'
    require 'favorite/has_many_favorites'
    require 'favorite/helpers'
    require 'favorite/routes'
    initializer "favorite.initialize" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, Favorite::ActsAsFavoriteable)
      end
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, Favorite::HasManyFavorites
      end
    end
  end
end
