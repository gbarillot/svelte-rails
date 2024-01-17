module Attachable
  def attach_file!(base64_file, association)
    mime_type = base64_file.split(',').first.split(';').first.split(':').last
    base64_data = base64_file.split(',').last
    decoded_base64 = Base64.decode64(base64_data)
    extension = Rack::Mime::MIME_TYPES.invert[mime_type]
    filename = [SecureRandom.uuid, extension].join

    self.send(association).attach(
      io: StringIO.new(decoded_base64),
      filename: filename,
      content_type: mime_type
    )
  end
end