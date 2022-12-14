# Copyright (C) 2012-2022 Zammad Foundation, https://zammad-foundation.org/

module Gql::Mutations::Concerns::HandlesCoreWorkflow
  extend ActiveSupport::Concern

  included do
    def set_core_workflow_information(params, klass, screen = 'create')
      return if params[:screen].present?
      return if klass.included_modules.exclude?(ChecksCoreWorkflow)

      params[:screen] = screen

      true
    end
  end
end
