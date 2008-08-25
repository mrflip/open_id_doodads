module OpenIdDoodads

  #
  # Builds a list of notable websites that act as openid_providers
  #
  # Currently it's stolen from the one at Ma.gnolia.com
  # * AOL         http://openid.aol.com/#{user_name}
  # * Typekey     http://profile.typekey.com/#{user_name}
  # * LiveJournal http://#{your_username}.livejournal.com
  # * WordPress   http://#{your_blogname}.wordpress.com
  # * Blogger     http://#{your_blogname}.blogspot.com
  # * ClaimID     http://claimid.com/#{OpenIDName}
  # * MyOpenID.com  http://#{OpenIDName}.myopenid.com
  # * Technorati  http://technorati.com/people/technorati/#{username}
  # * Google
  # * Facebook
  # * Yahoo       opaque by default ( https://me.yahoo.com/a/#{gobbledygook} )
  # * *           https://me.yahoo.com/#{only if you went and set this up}
  # * Flickr      http://www.flickr.com/photos/#{username}
  # * *           but only if you set up your yahoo openid
  #
  def open_id_providers
    @open_id_providers ||= {
      "open_id"    => { :order => 0, :name => "OpenID",       :template => false, :desc => 'Your OpenID URL: #{http://SOMETHING.com/STUFF}',                                                 },
      "blogger"    => { :order => 1, :name => "Blogger",      :template => true,  :desc => 'http://#{your_blogname}.blogspot.com',                 :re => %r{([^\./]+).blogspot.com},                     },
      "wordpress"  => { :order => 2, :name => "WordPress",    :template => true,  :desc => 'http://#{your_blogname}.wordpress.com',                :re => %r{([^\./]+).wordpress.com},                    },
      "livejournal"=> { :order => 3, :name => "LiveJournal",  :template => true,  :desc => 'http://#{user_name}.livejournal.com',                  :re => %r{([^\./]+).livejournal.com},                  },
      "aim"        => { :order => 4, :name => "AOL/AIM",      :template => true,  :desc => 'http://openid.aol.com/#{user_name}',                   :re => %r{openid.aol.com/([^\./]+)},                   },
      "typekey"    => { :order => 5, :name => "TypeKey",      :template => true,  :desc => 'http://profile.typekey.com/#{user_name}',              :re => %r{profile.typekey.com/([^\./]+)},              },
      "technorati" => { :order => 6, :name => "Technorati",   :template => true,  :desc => 'http://technorati.com/people/technorati/#{user_name}', :re => %r{technorati.com/people/technorati/([^\./]+)}, },
      "claimid"    => { :order => 7, :name => "ClaimID.com",  :template => true,  :desc => 'http://claimid.com/#{OpenIDName}',                     :re => %r{claimid.com/([^\./]+)},                      },
      "myopenid"   => { :order => 8, :name => "MyOpenID.com", :template => true,  :desc => 'http://#{OpenIDName}.myopenid.com',                    :re => %r{([^\./]+).myopenid.com},                     },
    }
  end
end
