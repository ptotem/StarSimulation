
require 'rubygems'
require 'zip'
class GameController < ApplicationController

  def simulate
    @game_info=Game.all
    uploaded_io = params[:picture]
    @name = params[:contact]
    @destination_path_name = params[:destination]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read);
      # @game = Game.create!(:name => @name )
      # @game.save!
    end
    # render :text => @name
    # return
    dest_file='public/uploads/'+uploaded_io.original_filename
    @destination_path='public/uploads/'+@destination_path_name
    @destination_path1='uploads/'+@destination_path_name+'/'+ uploaded_io.original_filename.rstrip+'/story.html'
    @zip=@destination_path1.gsub!('.zip', '')
    # render :text => @destination_path1
    # return
    @game = Game.create!(:name => @name,:description=>@zip )
    @game.save!
    Zip::File.open(dest_file) { |zip_file|
      zip_file.each { |f|
        f_path=File.join(@destination_path, f.name)
        # render :text => f.name
        # return
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      }
    }
  end

  def gamedata
    @game=Game.find(params[:id]);
    @iframe_url=@game.description;

  end
end
