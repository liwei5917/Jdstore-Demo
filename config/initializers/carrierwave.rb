CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],      # 你的 key


      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],      # 你的 secret key


      region:                'ap-northeast-1' # 你的 S3 bucket 的 Region 位置


    }
    config.storage :fog
    config.fog_directory  = ENV["AWS_BUCKET_NAME"] # 你设定的 bucket name



  else
    config.storage :file
  end
end
module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
