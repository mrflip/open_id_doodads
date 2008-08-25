class OpenIdDoodadsGenerator < Rails::Generator::NamedBase
  attr_accessor :icon_size
  attr_accessor :open_id_icon_variant, :provider_icon_variant

  ICON_SIZE              = 32      # FIXME -- make this a generator param
  OPEN_ID_ICON_VARIANT    = 'fff'   # FIXME -- this too.
  PROVIDER_ICON_VARIANT  = 'sq'    # FIXME -- this too.
  # and not all the sizes/variants exist. look in the generator/.../templates/images dir.

  # generic :open_id handled separately
  PROVIDER_ICONS = [
    :aim,        :blogger, :livejournal, :wordpress,
    :technorati, :claimid, :myopenid,    :typekey, ]

  def manifest
    # choose files
    self.icon_size             = ICON_SIZE
    self.open_id_icon_variant   = OPEN_ID_ICON_VARIANT
    self.provider_icon_variant = PROVIDER_ICON_VARIANT
    images_dir = "public/images/open_id"

    # Template
    record do |m|

      # icons
      copy_open_id_icon(   m, images_dir)
      [16, icon_size].uniq.each do |size|
        copy_provider_icons(m, images_dir, size, provider_icon_variant)
      end
      # css
      #m.file 'open_id.css', File.join('public/stylesheets', 'open_id.css')
      # js
      #m.file 'open_id.js',  File.join('public/javascripts', 'open_id.js')
    end
  end

  def provider_icon_name prov, size=nil, variant=nil
    "%s.png" % [prov, size, variant].compact.join('-')
  end

  def copy_provider_icons m, dest_dir, size, var
    m.directory dest_dir
    src_dir   = "images/open_id-providers"
    full_path = File.dirname(__FILE__)+'/templates/'+src_dir+'/'
    PROVIDER_ICONS.each do |prov|
      src_file = provider_icon_name(prov, size, var)
      puts full_path+src_file
      if ! File.exist?(full_path+src_file)
        # you'll take what you can get and you'll like it, punk.
        src_file = Dir[full_path+provider_icon_name(prov, size, "*")].first or raise "Can't match #{prov} in size #{size}"
        src_file = File.basename(src_file)
        warn "Using #{src_file} for #{prov} in size #{size}"
        # next
      end
      dest_file = provider_icon_name(prov, size)
      m.file File.join(src_dir, src_file), File.join(dest_dir,dest_file)
    end
  end

  def copy_open_id_icon m, dest_dir
    src_dir  = "images/open_id-icon/variants"
    m.directory dest_dir
    [16, icon_size].uniq.each do |size|
      src_file  = "open_id-#{size}-#{open_id_icon_variant}.png"
      dest_file = "open_id-#{size}.png"
      m.file File.join(src_dir, src_file), File.join(dest_dir, dest_file)
    end
  end

end
