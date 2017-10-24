require 'direct_upload/gcs/version'
require 'active_support/time'
require 'json'

module DirectUpload
  class Gcs
    GCS_API_ENDPOINT = 'https://storage.googleapis.com'.freeze

    attr_reader :method, :file_name, :expires_in, :content_type, :bucket, :key_file

    def initialize(method, file_name, expires_in, content_type = '', bucket = ENV.fetch('GOOGLE_CLOUD_STORAGE_BUCKET'), key_file = ENV.fetch('GOOGLE_CLOUD_KEYFILE_JSON'))
      @method = method
      @file_name = file_name
      @expires_in = expires_in
      @content_type = content_type
      @bucket = bucket
      @key_file = key_file
    end

    def signed_url
      signature = [method.to_s.upcase, '', content_type, expires_in.to_i, full_path].join("\n")
      digest = OpenSSL::Digest::SHA256.new
      signer = OpenSSL::PKey::RSA.new(storage_configuration['private_key'])
      signature = Base64.strict_encode64(signer.sign(digest, signature))
      signature = CGI.escape(signature)
      "#{GCS_API_ENDPOINT}#{full_path}#{query_params(signature)}"
    end

    private

    def full_path
      "/#{bucket}/#{file_name}"
    end

    def storage_configuration
      @_storage_configuration ||= JSON.parse(File.read(key_file))
    end

    def query_params(signature)
      "?GoogleAccessId=#{storage_configuration['client_email']}&Expires=#{expires_in.to_i}&Signature=#{signature}"
    end

  end
end
