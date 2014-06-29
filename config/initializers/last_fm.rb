# Set LAST_FM_API_KEY environment variable for production

if Rails.env != "production"
  ENV["LAST_FM_API_KEY"] = YAML.load_file("#{Rails.root}/config/last_fm.yml")[Rails.env]["api_key"]
end
