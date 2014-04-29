module GlobalHelpers
  def file_fixture(filename)
    Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/attachments', filename))
  end
end