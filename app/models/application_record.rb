# frozen_string_literal: true
# Base class for ActiveRecord Models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
