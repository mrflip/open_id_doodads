
$(function() {
  // Elements to munge
  function open_id_prov() { return $('#open_id_provider') }
  function curr_prov()    { return open_id_prov().val() }
  function open_id_url()  { return $('#openid_url') }
  function curr_url()     { return open_id_url().val() }
  function open_id_gallery_icons() { return $('.open_id_provider_gallery img') }

  //
  // Set element values
  //  
  
  // Put some helper text below the login box:
  // the template with the user's input, or with a placeholder.
  function open_idHelperTextFromTemplate(open_id_provider, openid_url) {
    provider_url_template = open_id_providers[open_id_provider]['desc'];
    if (openid_url) { return provider_url_template.replace(/#\{[^\}]*\}/, openid_url); }
    else            { return provider_url_template;  }
  }
  open_id_helper_text_flashed = false;
  function open_idSetHelperText() {
    $('#open_id_helper_text').html( open_idHelperTextFromTemplate(curr_prov(), curr_url()) );
    if (! open_id_helper_text_flashed) { // only highlight once, it's annoying otherwise
      $('#open_id_helper_text').show("highlight", {color:'#ffffd0', duration: 0.3}, "normal")
    };
    open_id_helper_text_flashed = true;
  }
  function open_idSetProviderIcon() {
    $('#open_id_provider_icon').attr('src', "/images/open_id/"+curr_prov()+"-32.png");
  }
  function open_idGalleryClicked() {
    prov = this.id.replace(/open_id_gallery_(\w+)/, "$1");
    open_id_prov().val(prov);
    open_idProviderChanged();
  }

  //
  // Events
  //   
  function open_idProviderChanged(event) {
    open_idSetProviderIcon();
    open_idSetHelperText();
  };
  function open_idURLChanged(event) {
    open_idSetHelperText()
  };  
  open_id_prov().change(open_idProviderChanged);
  open_id_url( ).change(open_idURLChanged);
  open_id_gallery_icons().click(open_idGalleryClicked);
  $("#open_id_wtf_shower").click(function(event){ $("#open_id_wtf").toggle("highlight", {color:'#ffffd0', duration: 0.3}, "normal"); });
})


    // if (open_id_provider_url_flash) {
    //   new Effect.Highlight('open_id_provider_url',{startcolor:'#ffffd0', endcolor:'#ffffff', duration: 0.3});
    // } else {
    //   open_id_provider_url_flash = true;
    // }
    // ; //open_idProviderURLText(open_id_provider, openid_url);
    // 
    // 
    // 
    // document.observe('dom:loaded', function() {
    //   open_idProviderChanged();
    //   $('open_id_provider').observe('change', open_idProviderChanged);
    //   $('openid_url'     ).observe('change', open_idURLChanged);
    //   $('open_id_gallery_blogger').observe('click', function(){
    //     open_id_provider.select('blogger');
    //     alert('hi');
    //   });
    // });
