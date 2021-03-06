
#require 'image_size.rb'

class Uploadfile < ActiveRecord::Base

   def self.save(id, upload)

    # skipping empty fields
    return false unless upload.blank?

    # The saved file name is composed of the unique id and original extension
    name =  id + "." + upload.original_filename.split(".").last 

    # target directory to save files
    directory = "public/fileuploads/"

    # create the file path
    path = File.join(directory, name)

    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }

    img = ImageSize.new(open(path))

    return {
      "width"     => img.get_width,
      "height"    => img.get_height,
      "filename"  => name
    }

  end
end
