/* mdbCarousel 3d */
(function ($) {

  $.fn.mdbCarousel3d = function(options) {
    let settings = $.extend({
      vertical: false,
      interval: 5000,
      autoplay: true
    }, options);

    let $carousel = $(this);
    let $carouselInner = $(this).find('.carousel-3d-inner');
    let $items = $carouselInner.find('.carousel-3d-item');
    let cellCount = $items.length;
    let selectedIndex = 0;
    let rotateFn = settings.vertical ? 'rotateX' : 'rotateY';
    let radius, theta;

    function rotateCarousel() {
      let angle = theta * selectedIndex * -1;
      $carouselInner.css({'transform': 'translateZ(' + -radius + 'px) ' + 
        rotateFn + '(' + angle + 'deg)'});
    }
    
    let $prevButton = $(this).find('.prev-btn');
    $prevButton.on('click', function() {
      clearInterval(autoRotate);
      selectedIndex--;
      rotateCarousel();
      if (settings.autoplay) autoRotate = setInterval(next,settings.interval);
    });
    
    let $nextButton = $(this).find('.next-btn');
    $nextButton.on('click', function() {
      clearInterval(autoRotate);
      next();
      if (settings.autoplay) autoRotate = setInterval(next,settings.interval);
    });
    
    function next() {
      selectedIndex++;
      rotateCarousel();
    }

    function changeCarousel() {
      theta = 360 / cellCount;
      let cellWidth = $carouselInner.outerWidth();
      let cellHeight = $carouselInner.outerHeight();
      let cellSize = settings.vertical ? cellHeight : cellWidth;
      radius = Math.round( ( cellSize / 2) / Math.tan( Math.PI / cellCount ) );
      for ( let i=0; i < $items.length; i++ ) {
        let cell = $items[i];
        if ( i < cellCount ) {
          // visible cell
          cell.style.opacity = 1;
          let cellAngle = theta * i;
          cell.style.transform = rotateFn + '(' + cellAngle + 'deg) translateZ(' + radius + 'px)';
        } else {
          // hidden cell
          cell.style.opacity = 0;
          cell.style.transform = 'none';
        }
      }
      rotateCarousel();
    }
    
    function setCarousel() {
      rotateFn = settings.vertical ? 'rotateX' : 'rotateY';
      let carouselHeight = $carousel.outerHeight();
      let carouselWidth = $carousel.outerWidth();
      $items.css({'height': carouselHeight - 50});
      $items.css({'width': carouselWidth - 50});
      changeCarousel();
    }
    
    // set initials
    setCarousel();
  
    let autoRotate;
    if (settings.autoplay) autoRotate = setInterval(next,settings.interval);

    $(window).resize(setCarousel);

  };

}(jQuery));