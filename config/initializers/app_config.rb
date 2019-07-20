require 'yaml'

API_KEY ||= YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env].to_hash

