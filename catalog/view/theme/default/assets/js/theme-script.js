var vertical_menu_height = $('#box-vertical-megamenus .box-vertical-megamenus').innerHeight();

$(window).load(function() {
    auto_width_megamenu();
});

$(window).resize(function(){
    auto_width_megamenu();
    remove_menu_ontop();
})

function auto_width_megamenu(){
    var full_width = $('.container').innerWidth();
    //full_width = $( document ).width();

    var menu_width = $('.vertical-menu-content').actual('width');
    $('.vertical-menu-content').find('.vertical-dropdown-menu').each(function(){
        $(this).width((full_width-menu_width)-2);
    });

}
function remove_menu_ontop(){
    var width = $(window).width();
    if(width < 768){
        $('#nav-top-menu').removeClass('nav-ontop');
        if($('body').hasClass('home')){
            if(width > 1024)
                $('#nav-top-menu').find('.vertical-menu-content').show();
            else{
                $('#nav-top-menu').find('.vertical-menu-content').hide();
            }
        }
        ///
        $('#shopping-cart-box-ontop .cart-block').appendTo('#cart-block');
        $('#shopping-cart-box-ontop').fadeOut();
        $('#user-info-opntop #user-info-top').appendTo('.top-header .container');
        $('#form-search-opntop form').appendTo('#header .header-search-box');
    }
}
$(window).scroll(function() {
    var h = $(window).scrollTop();

    var max_h = $('#header').height() + $('#top-banner').height();

    var width = $(window).width();

    if(width > 767){

        if( h > (max_h + vertical_menu_height)-50){
            // fix top menu
            $('#nav-top-menu').addClass('nav-ontop');
            //$('#nav-top-menu').find('.vertical-menu-content').hide();
            //$('#nav-top-menu').find('.title').removeClass('active');

            // add cart box on top menu
            $('#cart-block .cart-block').appendTo('#shopping-cart-box-ontop .shopping-cart-box-ontop-content');
            $('#shopping-cart-box-ontop').fadeIn();
            $('#user-info-top').appendTo('#user-info-opntop');
            $('#header .header-search-box form').appendTo('#form-search-opntop');
        }else{

            $('#nav-top-menu').removeClass('nav-ontop');

            if($('body').hasClass('home')){
                $('#nav-top-menu').find('.vertical-menu-content').removeAttr('style');
                if(width > 1024)
                    $('#nav-top-menu').find('.vertical-menu-content').show();
                else{
                    $('#nav-top-menu').find('.vertical-menu-content').hide();
                }
                 $('#nav-top-menu').find('.vertical-menu-content').removeAttr('style');
            }

            ///
            $('#shopping-cart-box-ontop .cart-block').appendTo('#cart-block');
            $('#shopping-cart-box-ontop').fadeOut();
            $('#user-info-opntop #user-info-top').appendTo('.top-header .container');
            $('#form-search-opntop form').appendTo('#header .header-search-box');
        }
    }
    

    
});


jQuery(document).ready(function(){
    if($('#product-zoom').length >0){
        $('#product-zoom').elevateZoom({
            zoomType: "inner",
            cursor: "crosshair",
            zoomWindowFadeIn: 500,
            zoomWindowFadeOut: 750,
            gallery:'gallery_01'
        }); 
    }
    if($('#size_chart').length >0){
        $('#size_chart').fancybox();
    }
    
    

    /** OWL CAROUSEL**/
    $(".owl-carousel").each(function(index, el) {
      $this = jQuery(el);
      config = $(this).data();
      
      config.navText = ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'];
      
      config.smartSpeed="300";
      if($(this).hasClass('owl-style2')){
        config.animateOut="fadeOut";
        config.animateIn="fadeIn";    
      }
      $this.owlCarousel(config);
    });
    $(".owl-carousel-vertical").each(function(index, el) {
      $this = jQuery(el);
      config = $(this).data();
      
      config.navText = ['<span class="icon-up"></spam>','<span class="icon-down"></span>'];
      
      config.smartSpeed="900";
      config.animateOut="fadeInUp";
        config.animateIn="fadeInUp";
      $this.owlCarousel(config);
    });

    /** COUNT DOWN**/
    $('[data-countdown]').each(function() {
       var $this = $(this), finalDate = $(this).data('countdown');
       $this.countdown(finalDate, function(event) {
         var fomat ='<span>%H</span><b></b><span>%M</span><b></b><span>%S</span>';
         $this.html(event.strftime(fomat));
       });
    });
    if($('.countdown-lastest').length >0){
        var labels = ['Years', 'Months', 'Weeks', 'Days', 'Hrs', 'Mins', 'Secs'];
        var layout = '<span class="box-count"><span class="number">{dnn}</span> <span class="text">Days</span></span><span class="box-count"><span class="number">{hnn}</span> <span class="text">Hrs</span></span><span class="box-count"><span class="number">{mnn}</span> <span class="text">Mins</span></span><span class="box-count"><span class="number">{snn}</span> <span class="text">Secs</span></span>';
        $('.countdown-lastest').each(function() {

        
        var austDay = new Date($(this).data('y'),$(this).data('m') - 1,$(this).data('d'),$(this).data('h'),$(this).data('i'),$(this).data('s'));
        $(this).countdown({
            until: austDay,
            labels: labels, 
            layout: layout
        });
    });
    }
    
        
        
    
    $(document).on('click','.btn-close',function(){
        $(this).closest('.top-banner').animate({ height: 0, opacity: 0 },1000);

    })
        
    /** SELECT CATEGORY **/
    $('.header-search-box .select-category').select2();
    
    
    

    $(document).on('click','.toggle-menu',function(){
        $(this).closest('.nav-menu').find('.navbar-collapse').toggle();
    })
    
    /** HOME SLIDE**/
    $('#contenhomeslider').bxSlider(
        {
            nextText:'<i class="fa fa-angle-right"></i>',
            prevText:'<i class="fa fa-angle-left"></i>'
        }
    );
    
    $('a.btn-elevator').on('click',function (e) {
	    e.preventDefault();
        
	    var target = this.hash;
        if($(document).find(target).length <=0){
            return false;
        }

	    var $target = $(target);
	    $('html, body').stop().animate({
	        'scrollTop': $target.offset().top-50
	    }, 500);
	});
    
    // scroll top
    $('.scroll_top').click(function(){
        $('body,html').animate({scrollTop:0},400);
        return false;
    })
    // Ẩn hiện scroll top
    $(window).scroll(function(){
        if( $(window).scrollTop() == 0 ) {
            $('.scroll_top').stop(false,true).fadeOut(600);
        }else{
            $('.scroll_top').stop(false,true).fadeIn(600);
        }
    });

    /** #brand-showcase **/
    $(document).on('click','.brand-showcase-logo li',function(){
        var id = $(this).data('tab');
        $(this).closest('.brand-showcase-logo').find('li').each(function(){
            $(this).removeClass('active');
        });
        $(this).closest('li').addClass('active');
        $('.brand-showcase-content').find('.brand-showcase-content-tab').each(function(){
            $(this).removeClass('active');
        })
        $('#'+id).addClass('active');
    })

    /** /#brand-showcase **/
    /** FOOTER **/
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
       // newly activated tab
       var tabActive = $(this).attr('href');
       $(tabActive).addClass('animated fadeIn');
    })
    $('a[data-toggle="tab"]').on('hidden.bs.tab', function (e) {
       // newly activated tab
       var tabActive = $(this).attr('href');
       $(tabActive).removeClass('animated fadeIn');
    })

    // CATEGORY FILTER 
    $('.slider-range-price').each(function(){
        var min             = $(this).data('min');
        var max             = $(this).data('max');
        var unit            = $(this).data('unit');
        var value_min       = $(this).data('value-min');
        var value_max       = $(this).data('value-max');
        var label_reasult   = $(this).data('label-reasult');
        var t               = $(this);
        $( this ).slider({
          range: true,
          min: min,
          max: max,
          values: [ value_min, value_max ],
          slide: function( event, ui ) {
            
            var result = label_reasult +" "+ unit + ui.values[ 0 ] +' - '+ unit +ui.values[ 1 ];
            console.log(t);
            t.closest('.slider-range').find('.amount-range-price').html(result);
          }
        });
    })

    
    
})

jQuery(function($){

    /** ALL CAT**/
    $(document).on('click','.open-cate',function(){
        $(this).closest('.vertical-menu-content').find('li.cat-link-orther').each(function(){
            $(this).slideDown();
        });

        $(this).addClass('colse-cate').removeClass('open-cate').html('Close');
    })

    $(document).on('click','.colse-cate',function(){
        $(this).closest('.vertical-menu-content').find('li.cat-link-orther').each(function(){
            $(this).slideUp();
        });
        $(this).addClass('open-cate').removeClass('colse-cate').html('All Categories');
    })

    // bar ontop click
    $(document).on('click','.vertical-megamenus-ontop-bar',function(){
        $('#vertical-megamenus-ontop').find('.box-vertical-megamenus').slideToggle();
        $('#vertical-megamenus-ontop').toggleClass('active');
    })


    $(document).on('click','.display-product-option .view-as-grid',function(){
        $(this).closest('.display-product-option').find('li').removeClass('selected');
        $(this).addClass('selected');
        $(this).closest('#view-product-list').find('.product-list').removeClass('list').addClass('grid');
    })
    $(document).on('click','.display-product-option .view-as-list',function(){
        $(this).closest('.display-product-option').find('li').removeClass('selected');
        $(this).addClass('selected');
        $(this).closest('#view-product-list').find('.product-list').removeClass('grid').addClass('list');
    })

    /// tre menu

    $(document).on('click','.tree-menu li span',function(){
        $(this).closest('li').children('ul').slideToggle();
        if($(this).closest('li').haschildren('ul')){
            $(this).toggleClass('open');
        }
        
    })

    $(document).on('click','.btn-open-mobile',function(){
        var width = $(window).width();
        if(width >1024){
            if($('body').hasClass('home')){
                if($('#nav-top-menu').hasClass('nav-ontop')){
                    
                }else{
                    return;
                }
            }
        }

        $(this).closest('.box-vertical-megamenus').find('.vertical-menu-content').slideToggle();
        $(this).closest('.title').toggleClass('active');
    })

    $(document).on('click','.btn-plus-down',function(){

        var value = $('#option-product-qty').val();
        value = parseInt(value) -1;
        if(value <=0) return false;
        $('#option-product-qty').val(value);
        return false;
    })
    $(document).on('click','.btn-plus-up',function(){

        var value = $('#option-product-qty').val();
        value = parseInt(value) +1;
        if(value <=0) return false;
        $('#option-product-qty').val(value);
        return false;
    })

    $(document).click(function (e){
        var container = $("#box-vertical-megamenus");

        if (!container.is(e.target) && container.has(e.target).length === 0){
            if($('body').hasClass('home')){
                if($('#nav-top-menu').hasClass('nav-ontop')){

                }else{
                    return;
                }
            }
            container.find('.vertical-menu-content').hide();
            container.find('.title').removeClass('active');
        }
    });
})
