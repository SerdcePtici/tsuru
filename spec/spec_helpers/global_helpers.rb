module GlobalHelpers
  def file_fixture_path(filename)
    Rails.root.join('spec/factories/attachments', filename)
  end

  def file_fixture(filename)
    Rack::Test::UploadedFile.new(file_fixture_path(filename))
  end
end