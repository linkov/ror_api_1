require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.enable_processing = true


  config.storage = :fog
  config.fog_public     = true


  config.fog_directory  = 'efwfileupload'


    config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     'AKIAI5HAKTBZ4YHESJ3A',
        aws_secret_access_key: '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',
        region:                'eu-central-1'
    }

end
