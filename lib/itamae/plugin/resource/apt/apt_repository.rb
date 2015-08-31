require 'itamae/resource/base'

module Itamae
  module Plugin
    module Resource
      class AptRepository < Itamae::Resource::Base
        define_attribute :action, default: :add
        define_attribute :name, type: String, default_name: true

        def run_action(action, options)
          case action
            when :add
              action_add
            when :remove
              action_remove
          end
        end

        def action_add
          run_command "add-apt-repository -y #{attributes.name}"
        end

        def action_remove
          run_command "add-apt-repository -y -r #{attributes.name}"
        end
      end
    end
  end
end
