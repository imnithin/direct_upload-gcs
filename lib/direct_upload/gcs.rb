require 'direct_upload/gcs/version'
require 'direct_upload/gcs/version'

module DirectUpload
  class Gcs

    def initialize(method, file_name, expires_in, content_type = '', gc_keyfile_json, bucket)
      @method = method || 'put'
      @file_name = file_name
      @expires_in = expires_in || 5.minutes
      @content_type = content_type
      @gc_keyfile_json = gc_keyfile_json
      @bucket = bucket || ENV.fetch('GOOGLE_CLOUD_STORAGE_BUCKET')
    end

    def signed_url
      full_path = "/#{bucket}/#{name}"
      signature = [method.to_s.upcase, '', content_type, expires_in.to_i, full_path].join("\n")
      digest = OpenSSL::Digest::SHA256.new
      signer = OpenSSL::PKey::RSA.new(storage_configuration['private_key'])
      signature = Base64.strict_encode64(signer.sign(digest, signature))
      signature = CGI.escape(signature)
      "#{storage_url}#{full_path}"
    end

    def storage_configuration
      @keyfile ||= JSON.parse(ENV.fetch('GOOGLE_CLOUD_KEYFILE_JSON'))
    end

    private

    def storage_url
      'https://storage.googleapis.com'
    end

    def query_params
      "?GoogleAccessId=#{storage_configuration['client_email']}&Expires=#{expires.to_i}&Signature=#{signature}"
    end

  end
end

# DirectUpload::Gcs.new('put', 'abc.jpeg', 20.minutes, )
