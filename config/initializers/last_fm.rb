# Set LAST_FM_API_KEY environment variable for production

if Rails.env != "production"
  LAST_FM = YAML.load_file("#{Rails.root}/config/last_fm.yml")[Rails.env]
  LAST_FM_API_KEY = LAST_FM["api_key"]
end
