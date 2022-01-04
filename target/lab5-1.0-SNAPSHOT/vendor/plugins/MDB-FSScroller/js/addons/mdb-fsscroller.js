/*!
 * jQuery Mousewheel 3.1.13
 *
 * Copyright 2015 jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */
!(function (a) {
  "function" == typeof define && define.amd ?
    define(["jquery"], a) :
    "object" == typeof exports ?
      (module.exports = a) :
      a(jQuery);
})(function (a) {
  function b(b) {
    var g = b || window.event,
      h = i.call(arguments, 1),
      j = 0,
      l = 0,
      m = 0,
      n = 0,
      o = 0,
      p = 0;
    if (
      ((b = a.event.fix(g)),
      (b.type = "mousewheel"),
      "detail" in g && (m = -1 * g.detail),
      "wheelDelta" in g && (m = g.wheelDelta),
      "wheelDeltaY" in g && (m = g.wheelDeltaY),
      "wheelDeltaX" in g && (l = -1 * g.wheelDeltaX),
      "axis" in g && g.axis === g.HORIZONTAL_AXIS && ((l = -1 * m), (m = 0)),
      (j = 0 === m ? l : m),
      "deltaY" in g && ((m = -1 * g.deltaY), (j = m)),
      "deltaX" in g && ((l = g.deltaX), 0 === m && (j = -1 * l)),
      0 !== m || 0 !== l)
    ) {
      if (1 === g.deltaMode) {
        var q = a.data(this, "mousewheel-line-height");
        (j *= q), (m *= q), (l *= q);
      } else if (2 === g.deltaMode) {
        var r = a.data(this, "mousewheel-page-height");
        (j *= r), (m *= r), (l *= r);
      }
      if (
        ((n = Math.max(Math.abs(m), Math.abs(l))),
        (!f || f > n) && ((f = n), d(g, n) && (f /= 40)),
        d(g, n) && ((j /= 40), (l /= 40), (m /= 40)),
        (j = Math[j >= 1 ? "floor" : "ceil"](j / f)),
        (l = Math[l >= 1 ? "floor" : "ceil"](l / f)),
        (m = Math[m >= 1 ? "floor" : "ceil"](m / f)),
        k.settings.normalizeOffset && this.getBoundingClientRect)
      ) {
        var s = this.getBoundingClientRect();
        (o = b.clientX - s.left), (p = b.clientY - s.top);
      }
      return (
        (b.deltaX = l),
        (b.deltaY = m),
        (b.deltaFactor = f),
        (b.offsetX = o),
        (b.offsetY = p),
        (b.deltaMode = 0),
        h.unshift(b, j, l, m),
        e && clearTimeout(e),
        (e = setTimeout(c, 200)),
        (a.event.dispatch || a.event.handle).apply(this, h)
      );
    }
  }

  function c() {
    f = null;
  }

  function d(a, b) {
    return (
      k.settings.adjustOldDeltas && "mousewheel" === a.type && b % 120 === 0
    );
  }
  var e,
    f,
    g = ["wheel", "mousewheel", "DOMMouseScroll", "MozMousePixelScroll"],
    h =
    "onwheel" in document || document.documentMode >= 9 ? ["wheel"] : ["mousewheel", "DomMouseScroll", "MozMousePixelScroll"],
    i = Array.prototype.slice;
  if (a.event.fixHooks)
    for (var j = g.length; j;) a.event.fixHooks[g[--j]] = a.event.mouseHooks;
  var k = (a.event.special.mousewheel = {
    version: "3.1.12",
    setup: function () {
      if (this.addEventListener)
        for (var c = h.length; c;) this.addEventListener(h[--c], b, !1);
      else this.onmousewheel = b;
      a.data(this, "mousewheel-line-height", k.getLineHeight(this)),
      a.data(this, "mousewheel-page-height", k.getPageHeight(this));
    },
    teardown: function () {
      if (this.removeEventListener)
        for (var c = h.length; c;) this.removeEventListener(h[--c], b, !1);
      else this.onmousewheel = null;
      a.removeData(this, "mousewheel-line-height"),
      a.removeData(this, "mousewheel-page-height");
    },
    getLineHeight: function (b) {
      var c = a(b),
        d = c["offsetParent" in a.fn ? "offsetParent" : "parent"]();
      return (
        d.length || (d = a("body")),
        parseInt(d.css("fontSize"), 10) || parseInt(c.css("fontSize"), 10) || 16
      );
    },
    getPageHeight: function (b) {
      return a(b).height();
    },
    settings: {
      adjustOldDeltas: !0,
      normalizeOffset: !0
    }
  });
  a.fn.extend({
    mousewheel: function (a) {
      return a ? this.bind("mousewheel", a) : this.trigger("mousewheel");
    },
    unmousewheel: function (a) {
      return this.unbind("mousewheel", a);
    }
  });
});

/*
 * =================================================
 * viewscroller
 * Copyright (c) 2016 Marcin Gierczak
 * =================================================
 */
(function ($) {
  $.fn.fullScreenScroller = function (params) {
    // User's settings of this plugin

    params = $.extend({
      // Animation
      animSpeedMainView: 700, // Animation speed of mainviews: 0 - fastest
      animSpeedSubView: 700, // Animation speed of subviews: 0 - fastest
      animEffectMainView: "easeInOutCubic", // Animation effect of mainviews change - jQuery (easing)
      animEffectSubView: "easeInOutCubic", // Animation effect of subviews change - jQuery (easing)
      animEffectMainViewCss3: "ease", // Animation effect of mainviews change - CSS3 (easing)
      animEffectSubViewCss3: "ease", // Animation effect of subviews change - CSS3 (easing)

      // Steering
      useKeyboard: true, // Use keyboard to change views
      useScrollbar: false, // Use scrollbar to change views
      changeWhenAnim: true, // Change views when they are changing
      loopMainViews: false, // Change horizontal views (mainviews) in loop mode
      loopSubViews: false, // Change vertical views (subviews) in loop mode
      fitToView: true, // Will the browser fit to the closest view (works if the useScrollbar option is true)
      timeToFit: 1000, // Time between stop scrolling and start fitting to the closest view

      // Mainbag dimension
      fixedWidth: 0, // (in px) width of the mainbag - if 0 - then width = 100% of window (in px) = .mainbag { width: XXX }
      spaceMainBag: 0, // (in px) a total value of the right and the left CSS margin dimensions of the .mainbag, for example: if .mainbag { left: XXX, right: YYY} then spaceMainBag = XXX + YYY

      // Callbacks
      beforeChange: null, // Callback which is called before views change
      afterChange: null, // Callback which is called after views change
      beforeResize: null, // Callback which is called before browser window resize
      afterResize: null, // Callback which is called after browser window resize

      // Views size
      viewsHeight: [] // Array of mainviews height
    },
    params
    );

    // Main functions
    $.fn.fullScreenScroller.setAnimSpeedMainView = function (val) {
      var animSpeedMainView = 700;

      params.animSpeedMainView = parseInt(val, 10) || animSpeedMainView;
    };

    $.fn.fullScreenScroller.setAnimSpeedSubView = function (val) {
      var animSpeedSubView = 700;

      params.animSpeedSubView = parseInt(val, 10) || animSpeedSubView;
    };

    $.fn.fullScreenScroller.setAnimEffectMainView = function (effectName) {
      params.animEffectMainView = effectName;
    };

    $.fn.fullScreenScroller.setAnimEffectSubView = function (effectName) {
      params.animEffectSubView = effectName;
    };

    $.fn.fullScreenScroller.setAnimEffectMainViewCss3 = function (effectName) {
      params.animEffectMainViewCss3 = effectName;
    };

    $.fn.fullScreenScroller.setAnimEffectSubViewCss3 = function (effectName) {
      params.animEffectSubViewCss3 = effectName;
    };

    $.fn.fullScreenScroller.setUseKeyboard = function (isActive) {
      params.useKeyboard = isActive;
    };

    $.fn.fullScreenScroller.setChangeWhenAnim = function (isActive) {
      params.changeWhenAnim = isActive;
    };

    $.fn.fullScreenScroller.setLoopMainViews = function (isActive) {
      params.loopMainViews = isActive;
    };

    $.fn.fullScreenScroller.setLoopSubViews = function (isActive) {
      params.loopSubViews = isActive;
    };

    $.fn.fullScreenScroller.setFitToView = function (isActive) {
      params.fitToView = isActive;
    };

    $.fn.fullScreenScroller.setTimeToFit = function (val) {
      var timeToFit = 1000;

      params.timeToFit = parseInt(val, 10) || timeToFit;
    };

    $.fn.fullScreenScroller.setUseScrollbar = function (isActive) {
      params.useScrollbar = isActive;
      changeView(allBagObjs[0], allBagObjs[0].viewsData.views[0], false, false);
      changeCssOnScrollbarVisible();
      onResize(false, false, false);
    };

    $.fn.fullScreenScroller.setFixedWidth = function (val) {
      params.fixedWidth = parseInt(val, 10) || 0;
      setMainbagDimWhenFixed();
      calcViewsDimensions();
      onResize(false, true, false);
    };

    $.fn.fullScreenScroller.setSpaceMainBag = function (val) {
      params.spaceMainBag = parseInt(val, 10) || 0;
      calcViewsDimensions();
      onResize(false, true, false);
    };

    $.fn.fullScreenScroller.showMainView = function (dir) {
      dir === "next" ?
        showMainView(direction.NEXT) :
        showMainView(direction.PREV);
    };

    $.fn.fullScreenScroller.showSubView = function (bagNbr, dir) {
      dir === "next" ?
        showSubView(bagNbr, direction.NEXT) :
        showSubView(bagNbr, direction.PREV);
    };

    $.fn.fullScreenScroller.showView = function (anchor) {
      setHash(anchor, false);
    };

    $.fn.fullScreenScroller.getCurrentBagNbr = function () {
      return getCurrBagNbr();
    };

    // Main classes
    var mainbag_sel = ".full-screen-scroller"; // mainbag class
    var subbag_sel = ".fss-subview"; // subbag class
    var mainview_sel = ".fss-mainview"; // mainview class
    var subview_sel = ".fss-subview-item"; // subview class
    var anchor_sel = ".fss-nav-item"; // Any anchor class
    var active_sel = ".fss-active"; // Active view class
    var center_sel = ".fss-center"; // Any content class inside a view
    var subviewprev_sel = ".fss-subview-prev"; // Class for the element which changes current subview to the previous subview
    var subviewnext_sel = ".fss-subview-next"; // Class for the element which changes current subview to the next subview
    var mainviewprev_sel = ".fss-mainview-prev"; // Class for the element which changes current mainview to the previous mainview
    var mainviewnext_sel = ".fss-mainview-next"; // Class for the element which changes current mainview to the next mainview
    var getallmainviews_sel = mainbag_sel + ">" + mainview_sel; // Select all mainviews from the mainbag
    var getallsubviews_sel = subbag_sel + ">" + subview_sel; // Select all subviews from the subbag

    // Types of bags (container for views)
    var bagType = {
      MAINBAG: 0, // Bag type for mainviews
      SUBBAG: 1 // Bag type for subviews
    };

    // DO NOT CHANGE!!! Shows view direction
    var direction = {
      NEXT: 1,
      PREV: -1
    };

    var timeoutId = 0; // DO NOT CHANGE!!! setTimeout of bindHash function
    var timeouts = []; // DO NOT CHANGE!!! Array of setTimeouts for scrolling
    var times = 0; // DO NOT CHANGE!!! How many times beforeChange event has been fired
    var allBagObjs = []; // DO NOT CHANGE!!! Array of all bag objects (one mainbag and all subbags)
    var byAnchor = false; // DO NOT CHANGE!!! Is this first time when views are changing by anchor
    var currentMainView = ""; // DO NOT CHANGE!!! Name of current view
    var stopHashEvent = false; // DO NOT CHANGE!!!
    var $window = $(window); // DO NOT CHANGE!!!
    var $document = $(document); // DO NOT CHANGE!!!
    var windowHeight = $window.height(); // DO NOT CHANGE!!!
    var windowWidth = $window.width(); // DO NOT CHANGE!!!
    var isChanging = false; // DO NOT CHANGE!!!
    var isStart = false; // DO NOT CHANGE!!! Declare hidden scrolling effect
    var startTime = Date.now(); // DO NOT CHANGE!!! For mousewheel events handling
    var stepViaX = 10; // Step to start scrolling a page by X axis (in px) - for touch only!
    var stepViaY = 50; // Step to start scrolling a page by Y axis (in px) - for touch only!
    var correctHeight = true; // Corrects height of each view when mobile browser's toolbar has been hidden/shown (this generates visual skip effect)

    // ----------------------------------------
    // START SELECTOR CACHE
    // ----------------------------------------

    // Selector cache function
    function SelectorCache() {
      var collection = {};

      function getFromCache(selector) {
        if (undefined === collection[selector]) {
          collection[selector] = $(selector);
        }

        return collection[selector];
      }

      return {
        get: getFromCache
      };
    }

    // Creates cache object
    var sel = new SelectorCache();

    // ----------------------------------------
    // START VIEWS LOGIC
    // ----------------------------------------

    // Adds indexOf function for IE8 only (polyfill)
    var addIndexOf = function () {
      var len;

      if (!Array.prototype.indexOf) {
        // IE8 only - add indexOf function
        Array.prototype.indexOf = function (viewsData, start) {
          len = this.length;

          for (var i = start || 0, j = len; i < j; i++) {
            if (this[i] === viewsData) {
              return i;
            }
          }

          return -1;
        };
      }
    };

    // Adds includes function to IE (polyfill) - ECMAScript 6
    var addIncludes = function () {
      if (!String.prototype.includes) {
        String.prototype.includes = function () {
          "use strict";

          return String.prototype.indexOf.apply(this, arguments) !== -1;
        };
      }
    };

    // Checks if resize event is fired during mobile orientation change
    var isMobile = function () {
      if (typeof window.orientation !== "undefined") {
        // Smartphones usually support this property but not desktop browsers
        return true;
      }

      return false;
    };

    // Checks if orientation has been changed
    var isMobileOrientation = function () {
      var currWindowHeight = $window.height();
      var currWindowWidth = $window.width();

      if (Math.abs(windowHeight - currWindowHeight) > 100) {
        windowHeight = currWindowHeight;
        return true;
      }

      if (Math.abs(windowWidth - currWindowWidth) > 100) {
        windowWidth = currWindowWidth;
        return true;
      }

      return false;
    };

    // Gets view name
    var getViewName = function (mainViewNbr, view) {
      var viewId = "#" + view.attr("fss-anchor");

      if (viewId === "#undefined") {
        viewId = "";
      }

      return mainViewNbr + viewId;
    };

    // Gets all mainviews from the mainbag
    var getAllMainViews = function () {
      var mainViews = [];

      sel.get(getallmainviews_sel).each(function (mainViewNbr) {
        mainViews.push(getViewName(mainViewNbr, $(this)));
      });

      return mainViews;
    };

    // Gets all subviews from specified mainview
    var getAllSubViews = function (mainViewNbr) {
      var subViews = [];
      var subViewNbr = 0;
      var subViewsLength;
      // Gets specified (based on mainViewNbr) mainview from mainbag
      var getSpecifiedMainView = sel
        .get(getallmainviews_sel)
        .slice(mainViewNbr, mainViewNbr + 1);

      // Gets all subviews from specified mainview
      getSpecifiedMainView
        .find(sel.get(getallsubviews_sel))
        .each(function (subViewNbr) {
          subViews.push(getViewName(subViewNbr, $(this)));
        });

      subViewsLength = subViews.length;

      while (subViewNbr < subViewsLength) {
        subViewNbr++;
      }

      return subViews;
    };

    // Gets bag number which includes the view
    var getBagNbr = function (viewName) {
      for (
        var bagObjNbr = 0, len = allBagObjs.length; bagObjNbr < len; bagObjNbr++
      ) {
        for (
          var viewNbr = 0, len2 = allBagObjs[bagObjNbr].viewsData.views.length; viewNbr < len2; viewNbr++
        ) {
          if (
            allBagObjs[bagObjNbr].viewsData.views[viewNbr].split("#")[1] ===
            viewName
          ) {
            return bagObjNbr;
          }
        }
      }

      return -1;
    };

    // Gets current bag number for the viewname from url
    var getCurrBagNbr = function () {
      if (window.location.hash.indexOf("#") > -1) {
        urlViewName = window.location.hash.replace("#", "");
        var subviews = [],
          anchor_sel =
          "div[fss-anchor=" +
          urlViewName +
          "], section[fss-anchor=" +
          urlViewName +
          "], article[fss-anchor=" +
          urlViewName +
          "]";
        sel
          .get(anchor_sel)
          .find(sel.get(getallsubviews_sel))
          .each(function (idx) {
            subviews.push($(this).attr("fss-anchor"));
          });

        if (subviews.length > 0) {
          return getBagNbr(subviews[0]);
        } else if (subviews.length === 0) {
          sel
            .get(anchor_sel)
            .parents(sel.get(subbag_sel))
            .each(function (idx) {
              subviews.push($(this).attr("class"));
            });
          if (subviews.length > 0) {
            if (subviews[0].includes(subbag_sel.replace(".", ""))) {
              return getBagNbr(urlViewName);
            }
          }
        }

        return -1;
      } else {
        return 0;
      }
    };

    // Sets hash in the URL
    var setHash = function (id, addHash) {
      if (addHash === true) {
        stopHashEvent = true;
      } else {
        stopHashEvent = false;
      }

      var ffsNavItemHrefToId = ".fss-nav-item[href='#" + id + "']";

      $(ffsNavItemHrefToId).parent().find(".fss-nav-item").removeClass("active");
      $(ffsNavItemHrefToId).addClass("active");
      window.location.hash = id;
    };

    // Creates bag object
    var createBagObj = function (container, views, bagType) {
      var newBagObj = new bagObject();

      newBagObj.setBagObj(container, views, bagType);

      return newBagObj;
    };

    // Creates bag objects for all subviews inside each mainview
    var createBagObjsForAllSubViews = function (mainViews) {
      var subViews = [];
      var mainViewName = "";
      var mainViewNbr = 0;
      var subViewNbr = 0;
      var len = mainViews.length;

      while (mainViewNbr < len) {
        subViews = getAllSubViews(mainViewNbr);
        mainViewName = mainViews[mainViewNbr].split("#")[1];

        if (subViews.length > 0) {
          allBagObjs.push(
            createBagObj(
              subbag_sel +
              "|" +
              subViewNbr +
              "|" +
              mainViewName +
              "|" +
              mainViewNbr,
              subViews,
              bagType.SUBBAG
            )
          );
          subViewNbr++;
        }

        mainViewNbr++;
      }
    };

    // Creates bag objects for all views
    var createBagObjsForAllViews = function () {
      var mainViews = getAllMainViews();

      allBagObjs.push(createBagObj(mainbag_sel, mainViews, bagType.MAINBAG));
      createBagObjsForAllSubViews(mainViews);
    };

    // Changes view on the hash change
    var changeViewOnHashChange = function () {
      var id;
      var viewData;

      if (stopHashEvent === false && window.location.hash.indexOf("#") > -1) {
        id = window.location.hash.replace("#", "");
        viewData = getViewDataForID(id);

        if (typeof viewData !== "undefined" && viewData.length > 0) {
          changeView(allBagObjs[viewData[0]], viewData[1], false, false);
        }
      }

      stopHashEvent = false;
    };

    // Looks for anchor id among all views in all bag objects and return the view data which has the same id
    var getViewDataForID = function (id) {
      var viewData = [];
      var views;
      var bagType;

      for (
        var subObjNbr = 0, len = allBagObjs.length; subObjNbr < len; subObjNbr++
      ) {
        views = allBagObjs[subObjNbr].viewsData.views;
        bagType = allBagObjs[subObjNbr].viewsData.bagType;

        for (var viewNbr = 0, len2 = views.length; viewNbr < len2; viewNbr++) {
          if (views[viewNbr].indexOf("#") > -1) {
            if (views[viewNbr].split("#")[1] === id) {
              viewData.push(subObjNbr, views[viewNbr], bagType);
              return viewData;
            }
          }
        }
      }
    };

    // Gets view number
    var getViewNbr = function (bagObj, direction) {
      var nbr =
        bagObj.viewsData.views.indexOf(bagObj.viewsData.activeView) + direction;

      if (
        (params.loopSubViews &&
          typeof bagObj.viewsData.views[nbr] === "undefined" &&
          bagObj.viewsData.container.includes(subbag_sel)) ||
        (params.loopMainViews &&
          typeof bagObj.viewsData.views[nbr] === "undefined" &&
          bagObj.viewsData.container.includes(mainbag_sel))
      ) {
        nbr = nbr < 0 ? bagObj.viewsData.views.length - 1 : 0;
      }

      return nbr;
    };

    // Adds styles to the bag selectors when useScrollbar option is enabled
    var changeCssOnScrollbarVisible = function () {
      sel.get("body").css("overflow-y", "hidden"); // Needed due to Firefox when useScrollbar = false, not required in other browsers
      sel.get("html").css("overflow-y", "hidden");

      if (params.useScrollbar) {
        sel.get(".full-screen-scroller").css("overflow-y", "scroll");
      } else {
        sel.get(".full-screen-scroller").css("overflow-y", "hidden");
      }
    };

    // Checks if window has been resized
    var checkIfResize = function (animSpeed, isResize) {
      var resizeWindowTime = 1;

      return isResize ? resizeWindowTime : animSpeed;
    };

    // Sets views position
    var calcViewsPos = function (bagObj) {
      var isValidVHA;

      bagObj.viewsData.viewsPos.length = 0;
      isValidVHA = isValidViewsHeightArray();

      for (
        var viewNbr = 0, len = bagObj.viewsData.views.length; viewNbr < len; viewNbr++
      ) {
        bagObj.viewsData.bagType === bagType.SUBBAG ?
          setSubViewsPos(bagObj, viewNbr) :
          setMainViewsPos(bagObj, viewNbr, isValidVHA);
      }
    };

    // Sets subviews position
    var setSubViewsPos = function (bagObj, viewNbr) {
      var width = sel.get(mainbag_sel).width();

      windowWidth = $window.width();
      params.fixedWidth === 0 ?
        (width = windowWidth - params.spaceMainBag) :
        (width = params.fixedWidth);
      bagObj.viewsData.viewsPos.push(width * viewNbr);
    };

    // Sets mainviews position
    var setMainViewsPos = function (bagObj, viewNbr, isValidVHA) {
      windowHeight = $window.height();

      if (viewNbr === 0) {
        bagObj.viewsData.viewsPos.push(0);
      } else if (
        viewNbr > 0 &&
        isValidVHA &&
        params.viewsHeight.length >= viewNbr &&
        params.viewsHeight[viewNbr - 1] !== 0
      ) {
        bagObj.viewsData.viewsPos.push(
          bagObj.viewsData.viewsPos[viewNbr - 1] +
          params.viewsHeight[viewNbr - 1]
        ); // Sets view size defined by a user
      } else if (viewNbr > 0) {
        bagObj.viewsData.viewsPos.push(
          bagObj.viewsData.viewsPos[viewNbr - 1] + windowHeight
        ); // Sets default view size (100% vh/vw)
      }
    };

    // Calculates which view is closer to the current scroll position
    var calcViewPos = function (viewsPosArr) {
      var currPos = $window.scrollTop();
      var prevDiffPos = 0;
      var diffPos = 0;
      var getArrNbr = 0;

      for (
        var viewPosNbr = 0, len = viewsPosArr.length; viewPosNbr < len; viewPosNbr++
      ) {
        diffPos = Math.abs(viewsPosArr[viewPosNbr] - currPos);

        if (diffPos < prevDiffPos) {
          getArrNbr = viewPosNbr;
        }

        prevDiffPos = diffPos;
      }

      return getArrNbr; // Returns view number which includes the closest value to the current scroll position
    };

    // Sets width and height css properties for mainviews and subviews
    var calcViewsDimensions = function () {
      var width = sel.get(mainbag_sel).width(),
        height = $window.height();

      params.fixedWidth === 0 ?
        (width = $window.width() - params.spaceMainBag) :
        (width = params.fixedWidth);
      sel.get(mainbag_sel).css("width", width + "px");
      sel.get(mainview_sel).css("height", height + "px");

      if (isValidViewsHeightArray()) {
        setViewHeight(height);
      }

      sel.get(subview_sel).css("width", width + "px");
      sel.get(subbag_sel).each(function (idx) {
        $(this).css("width", width * $(this).find(subview_sel).length + "px"); // How many subviews are placed inside the subbag
      });
    };

    // Sets mainviews height
    var setViewHeight = function (height) {
      var currViewHeight;

      Array.prototype.forEach.call(params.viewsHeight, function (
        viewHeight,
        viewNbr
      ) {
        currViewHeight = parseInt(viewHeight, 10);

        if (currViewHeight === 0) {
          currViewHeight = height;
        }

        viewNbr++;
        sel
          .get(mainview_sel + ":nth-child(" + viewNbr + ")")
          .css("height", currViewHeight + "px");
      });
    };

    // Checks if viewsHeight array is valid
    var isValidViewsHeightArray = function () {
      Array.prototype.forEach.call(params.viewsHeight, function (viewHeight) {
        if (isNaN(viewHeight) || parseInt(viewHeight, 10) < 0) {
          return false;
        }
      });

      return true;
    };

    // Adds own classes with subbag number
    var addClassesForSubBags = function () {
      sel.get(subbag_sel).each(function (subBagNbr) {
        $(this).addClass(subbag_sel.replace(".", "") + "-" + subBagNbr);
      });
    };

    // Adds wrappers for subbags (generates tag: <div style="..."'>subbag</div>
    var addWrappersForSubBags = function () {
      sel
        .get(subbag_sel)
        .wrap(
          '<div style="overflow: hidden; height: 100%; width: 100%;"></div>'
        );
    };

    // Sets dimension of mainbag includes rooms for menu right or left
    var setStartDimension = function () {
      params.fixedWidth === 0 ?
        sel
          .get(mainbag_sel)
          .css(
            "width",
            sel.get(mainbag_sel).width() - params.spaceMainBag + "px"
          ) :
        sel.get(mainbag_sel).css("width", params.fixedWidth + "px");
    };

    // Sets mainbag's position on absolute when its width is fixed
    var setMainbagDimWhenFixed = function () {
      if (params.fixedWidth > 0) {
        sel.get(mainbag_sel).css({
          position: "absolute"
        });
      }
    };

    // Sets active view (for fss-active class)
    var setActiveView = function () {
      sel
        .get(mainbag_sel)
        .find(sel.get(active_sel))
        .each(function (viewNbr) {
          if (viewNbr === 0) {
            setHash($(this).attr("fss-anchor"));
          }
        });
    };

    // Shows next or prev subview
    var showSubView = function (currBagNbr, dir) {
      if (currBagNbr > -1) {
        // Prevent views from scrolling when they are still animate
        if (params.changeWhenAnim || (!params.changeWhenAnim && !isChanging)) {
          changeView(allBagObjs[currBagNbr], "", false, false, dir);
        }
      }
    };

    // Shows next or prev mainview
    var showMainView = function (dir) {
      // Prevent views from scrolling when they are still animate
      if (params.changeWhenAnim || (!params.changeWhenAnim && !isChanging)) {
        changeView(allBagObjs[0], "", false, false, dir);
      }
    };

    // Scrolls views on x or y axis - via jQuery
    var animatejQuery = function (
      elem,
      viewPos,
      isResize,
      orientation,
      callback
    ) {
      if (orientation === "x") {
        elem.stop().animate({
          scrollLeft: viewPos
        },
        checkIfResize(params.animSpeedSubView, isResize),
        params.animEffectSubView,
        function () {
          // Calls when jQuery animation is over
          if (typeof callback === "function") {
            callback();
          }
        }
        );
      } else {
        elem.stop().animate({
          scrollTop: viewPos
        },
        checkIfResize(params.animSpeedMainView, isResize),
        params.animEffectMainView,
        function () {
          // Calls when jQuery animation is over
          if (typeof callback === "function") {
            callback();
          }
        }
        );
      }
    };

    // Shows specified view - this function manage of views change
    var changeView = function (bagObj, viewName, isResize, isScroll, direction) {
      var indexOfView;
      var viewPosition;
      var viewType;
      var viewSelector;
      var container;
      var containerNbr;
      var elem;

      if (typeof direction !== "undefined") {
        // Show next or previous view
        viewName = bagObj.viewsData.views[getViewNbr(bagObj, direction)];
      }

      if (
        bagObj.viewsData.views.length > 0 &&
        typeof viewName !== "undefined"
      ) {
        indexOfView = bagObj.viewsData.views.indexOf(viewName);
        viewPosition = bagObj.viewsData.viewsPos[indexOfView];
        viewType = bagObj.viewsData.bagType;
        viewSelector = bagObj.viewsData.container;
        scrollPos = 0;

        if (
          isStart ||
          (byAnchor === false &&
            ((typeof isResize === "undefined" && isScroll === false) ||
              (bagObj.viewsData.activeView !== viewName && isResize === false)))
        ) {
          callFuncBeforeChange();
        }

        if (viewSelector === mainbag_sel) {
          currentMainView = viewName.split("#")[1];
        } else {
          if (!isStart) {
            if (!isResize && currentMainView !== viewSelector.split("|")[2]) {
              byAnchor = true; // Informs that changing view is fired by anchor
              changeView(
                allBagObjs[0],
                viewSelector.split("|")[3] + "#" + viewSelector.split("|")[2],
                false,
                false
              ); // Change view when anchor is changed
            }

            currentMainView = viewSelector.split("|")[2];
          }
        }

        if (!isResize && !isStart) {
          if (window.location.hash !== viewName.split("#")[1]) {
            setHash(viewName.split("#")[1], true); // Also changes hash to the current view, ex. view-2
          }
        }

        if (viewType === bagType.SUBBAG) {
          container = viewSelector.split("|")[0];
          containerNbr = viewSelector.split("|")[1];
          viewSelector = sel.get(container + "-" + containerNbr); // Gets subbag container from the DOM
        } else {
          viewSelector = sel.get(viewSelector);
        }

        elem = viewSelector; // Get current view container
        isChanging = true; // Prevent of scrolling views when they are still animate

        if (viewType === bagType.SUBBAG) {
          animatejQuery(elem.parent(), viewPosition, isResize, "x", function () {
            animationDone(isScroll, bagObj, viewName);
          });
        } else {
          if (!isScroll) {
            unbindWheel();
          }

          unbindScroll();
          animatejQuery(elem, viewPosition, isResize, "y", function () {
            animationDone(isScroll, bagObj, viewName);
          });

          if (!params.useScrollbar) {
            bindWheel();
          }
        }

        if (!isStart) {
          bagObj.viewsData.activeView = viewName; // Sets name of the current view, for example: 1#view-2
          byAnchor = false;
        }
      }
    };

    // Calls when jQuery or CSS3 animation is over
    var animationDone = function (isScroll, bagObj, viewName) {
      callFuncAfterChange();

      if (!params.useScrollbar && !isScroll) {} else {
        stopHashEvent = false;
        unbindResize();
        recalcWindowHeight();
        changeViewHeightOnMobileToolbar();
        bindResize();
        bindScroll();
      }

      isChanging = false; // Prevent of scrolling views when they are changing
      isStart = false; // Clear hidden scrolling effect
    };

    // Recalculates window height property
    var recalcWindowHeight = function () {
      if ($window.height() !== windowHeight) {
        onResize(false, false, false);
        windowHeight = $window.height();
      }
    };

    // This code changes view's height if mobile browser is hiding/showing toolbar
    var changeViewHeightOnMobileToolbar = function () {
      if (allBagObjs[0].viewsData.viewsPos.length > 1) {
        if (
          correctHeight &&
          isMobile() &&
          $window.height() !==
          Math.abs(
            allBagObjs[0].viewsData.viewsPos[0] -
            allBagObjs[0].viewsData.viewsPos[1]
          )
        ) {
          calcViewsDimensions();

          for (
            var bagObjNbr = 0, len = allBagObjs.length; bagObjNbr < len; bagObjNbr++
          ) {
            calcViewsPos(allBagObjs[bagObjNbr]);
            changeView(
              allBagObjs[bagObjNbr],
              allBagObjs[bagObjNbr].viewsData.activeView,
              true
            );
          }
        }
      }
    };

    // Calls function before change view
    var callFuncBeforeChange = function () {
      var stop = false;

      if (typeof params.beforeChange === "function") {
        stop = params.beforeChange();
      }

      times++;

      if (stop) {
        // Stop changing views if beforeChange function returns false
        return false;
      }
    };

    // Calls function after change view
    var callFuncAfterChange = function () {
      if (times > 0) {
        if (typeof params.afterChange === "function") {
          params.afterChange();
        }

        times -= 1; // This variable counts how many beforeChange callback has been invoked
      }
    };

    // ----------------------------------------
    // START REGION EVENTS
    // ----------------------------------------

    // Adds click event to all anchors with 'fss-anchor' class declared
    var bindAnchor = function () {
      // If user click on this element, application will search for id of the anchor among all views inside all bag objects and for this id change view
      sel.get(anchor_sel).on("click", onAnchor);
    };

    // Sets anchor
    var onAnchor = function (event) {
      var currHashId;
      var viewData;
      var id;

      event.preventDefault();
      id = $(this)
        .attr("href")
        .replace("#", "");
      viewData = getViewDataForID(id);
      currHashId = window.location.hash.substr(1);

      if (viewData && viewData.length > 0) {
        // Prevent of changing views when they are still animate
        if (
          params.changeWhenAnim ||
          (!params.changeWhenAnim && !isChanging) ||
          id !== currHashId
        ) {
          setHash(id);
        }
      }
    };

    // Adds hashchange event
    var bindHashChange = function () {
      $window.on("hashchange", changeViewOnHashChange);
    };

    // Removes hashchange event
    var unbindHashChange = function () {
      $window.off("hashchange", changeViewOnHashChange);
    };

    // Adds scroll event
    var bindScroll = function () {
      $window.on("scroll", onScroll);
    };

    // Removes scroll event
    var unbindScroll = function () {
      $window.off("scroll", onScroll);
    };

    // Scrolls the window
    var onScroll = function () {
      var idx;
      var go;
      var currPos;

      // Sets hash name and the current view
      idx = calcViewPos(allBagObjs[0].viewsData.viewsPos); // Calculates which view is closer to the current scroll position
      clearTimeout(timeoutId);
      unbindHashChange();

      if (
        window.location.hash !==
        "#" + allBagObjs[0].viewsData.views[idx].split("#")[1]
      ) {
        setHash(allBagObjs[0].viewsData.views[idx].split("#")[1], false); // Sets the hash to the closests view
        allBagObjs[0].viewsData.activeView = allBagObjs[0].viewsData.views[idx]; // Sets current view on mainbag
      }

      // Delays hash bind after hash change (there is very small timespan between hash change and hash bind)
      timeoutId = setTimeout(function () {
        bindHashChange();
      }, 10);

      // Fire the scroll
      Array.prototype.forEach.call(timeouts, function (elem) {
        clearTimeout(elem);
      });

      currPos = $window.scrollTop();
      timeouts.length = 0;
      timeouts.push(
        setTimeout(function () {
          if (params.fitToView) {
            // Let's scroll only when scrollTop position is other than current mainview's position
            go = true;

            Array.prototype.forEach.call(
              allBagObjs[0].viewsData.viewsPos,
              function (elem) {
                if (elem === currPos) {
                  go = false;
                }
              }
            );

            if (go) {
              isStart = true;
              changeView(
                allBagObjs[0],
                allBagObjs[0].viewsData.activeView,
                false,
                false
              );
            }
          }
        }, params.timeToFit)
      );
    };

    // Adds mousewheel event
    var bindWheel = function () {
      $window.on("mousewheel", onMouseWheel);
    };

    // Removes mousewheel event
    var unbindWheel = function () {
      $window.off("mousewheel", onMouseWheel);
    };

    // Changes view depending on the mouse wheel direction
    var onMouseWheel = function (event) {
      var wheelTime = Date.now();
      // Calculates time to prevent views from scrolling at the same time (especially on MAC OS)
      var timeDiff = wheelTime - startTime;
      startTime = wheelTime;

      // Prevents views from scrolling when ctrl key is pressed and when the time diff is less than 50 ms
      if (!event.ctrlKey && timeDiff > 50) {
        event.deltaY < 0 ?
          showMainView(direction.NEXT) :
          showMainView(direction.PREV);
      }
    };

    // Adds click event on elements with next or prev class
    var bindPrevNextClickEvent = function () {
      sel.get(subviewprev_sel).each(function (idx) {
        $(this).on("click", function () {
          currBagNbr = getCurrBagNbr();

          if (currBagNbr > -1) {
            showSubView(currBagNbr, direction.PREV);
          }
        });
      });

      sel.get(subviewnext_sel).each(function (idx) {
        $(this).on("click", function () {
          currBagNbr = getCurrBagNbr();

          if (currBagNbr > -1) {
            showSubView(currBagNbr, direction.NEXT);
          }
        });
      });

      sel.get(mainviewprev_sel).each(function (idx) {
        $(this).on("click", function () {
          showMainView(direction.PREV);
        });
      });

      sel.get(mainviewnext_sel).each(function (idx) {
        $(this).on("click", function () {
          showMainView(direction.NEXT);
        });
      });
    };

    // Adds touch event
    var bindTouch = function () {
      touchAttachEvents(window);
    };

    // Adds resize event to the window selector
    var bindResize = function () {
      $window.on("resize", onResize);
    };

    // Adds resize event to the window selector
    var unbindResize = function () {
      $window.off("resize", onResize);
    };

    // Changes view depending on the window size
    var onResize = function (e, isRoomChange, isCallback) {
      if (
        !isMobile() ||
        isRoomChange ||
        (isMobile() && isMobileOrientation())
      ) {
        // Releases beforeEvent
        if (
          typeof params.beforeResize === "function" &&
          typeof isCallback === "undefined"
        ) {
          params.beforeResize();
        }

        // Recalculates dimension of each view
        calcViewsDimensions();

        for (
          var bagObjNbr = 0, len = allBagObjs.length; bagObjNbr < len; bagObjNbr++
        ) {
          calcViewsPos(allBagObjs[bagObjNbr]);
          changeView(
            allBagObjs[bagObjNbr],
            allBagObjs[bagObjNbr].viewsData.activeView,
            true
          );
        }

        // Releases afterEvent
        if (
          typeof params.afterResize === "function" &&
          typeof isCallback === "undefined"
        ) {
          params.afterResize();
        }
      }
    };

    // Adds keyboard events
    var bindKeyboard = function () {
      $document.on("keydown", onKeyDown);
    };

    // Removes keyboard event
    var unbindKeyboard = function () {
      $document.off("keydown", onKeyDown);
    };

    // Changes views by keyboard
    var onKeyDown = function (e) {
      var UP_KEY_CODE = 38;
      var DOWN_KEY_CODE = 40;
      var LEFT_KEY_CODE = 37;
      var RIGHT_KEY_CODE = 39;
      var HOME_KEY_CODE = 36;
      var END_KEY_CODE = 35;
      var PAGEUP_KEY_CODE = 33;
      var PAGEDOWN_KEY_CODE = 34;
      var currBagNbr = 0;

      var getKey = function (e) {
        if (window.event) {
          return e.keyCode; // IE
        } else if (e.which) {
          return e.which; // Firefox/Opera
        }
      };

      var keynum = getKey(e);

      // Gets the current view id from the URL
      currBagNbr = getCurrBagNbr();

      if (params.useKeyboard) {
        switch (keynum) {
        case PAGEUP_KEY_CODE:
        case UP_KEY_CODE:
          if (!params.useScrollbar) {
            showMainView(direction.PREV);
          }
          break;
        case PAGEDOWN_KEY_CODE:
        case DOWN_KEY_CODE:
          if (!params.useScrollbar) {
            showMainView(direction.NEXT);
          }
          break;
        case RIGHT_KEY_CODE:
          if (currBagNbr === 0) currBagNbr = 1;
          if (currBagNbr > -1) {
            showSubView(currBagNbr, direction.NEXT);
          }
          break;
        case LEFT_KEY_CODE:
          if (currBagNbr === 0) currBagNbr = 1;
          if (currBagNbr > -1) {
            showSubView(currBagNbr, direction.PREV);
          }
          break;
        case HOME_KEY_CODE:
          if (!params.useScrollbar) {
            setHash(allBagObjs[0].viewsData.views[0].split("#")[1]);
          }
          break;
        case END_KEY_CODE:
          if (!params.useScrollbar) {
            setHash(
              allBagObjs[0].viewsData.views[
                allBagObjs[0].viewsData.views.length - 1
              ].split("#")[1]
            );
          }
          break;
        }
      }
    };

    // ----------------------------------------
    // START REGION TOUCHES
    // ----------------------------------------

    var touchable;
    var touches = []; // Includes all touches vectors
    var posXGlobal = 0; // Contains pointer position on the x axis
    var posYGlobal = 0; // Contains pointer position on the y axis

    // Cursor positions
    var cursorPos = {
      x: null,
      y: null
    };

    // Checks if your browser support touches
    var isTouchDevice = function () {
      return (
        "ontouchstart" in window ||
        navigator.MaxTouchPoints > 0 ||
        navigator.msMaxTouchPoints > 0
      );
    };

    // Binds touch events
    var touchAttachEvents = function (elem) {
      if (window.PointerEvent) {
        elem.addEventListener("pointermove", onCursorMove, false);
      }

      if (touchable) {
        elem.addEventListener("touchstart", onTouchStart, false);
        elem.addEventListener("touchmove", onCursorMove, false);
        elem.addEventListener("touchend", onTouchEnd, false);
      }
    };

    // Sets current touch position
    var touchesChange = function (event) {
      setPointerPosition(event);

      return cursorPos.x + "|" + cursorPos.y;
    };

    // Sets pointer position
    var setPointerPosition = function (event) {
      var touchesLength;

      if (touchable) {
        touches = event.touches;

        if (touches) {
          touchesLength = touches.length;

          for (var touchNbr = 0; touchNbr < touchesLength; touchNbr++) {
            var touch = touches[touchNbr];
            cursorPos.x = getCursorPosX(touch);
            cursorPos.y = getCursorPosY(touch);
          }
        }
      } else {
        cursorPos.x = getCursorPosX(event);
        cursorPos.y = getCursorPosY(event);
      }
    };

    // Gets coordinates of all touches
    var onTouchStart = function (event) {
      var pos = touchesChange(event).split("|");

      posXGlobal = parseInt(pos[0], 10);
      posYGlobal = parseInt(pos[1], 10);
    };

    // Changes views depending on touch direction
    var onTouchEnd = function (event) {
      var pos = touchesChange(event).split("|");
      var currBagNbr = 0;
      var stepX = stepViaX;
      var stepY = stepViaY;
      var afterPos0 = parseInt(pos[0], 10);
      var afterPos1 = parseInt(pos[1], 10);
      var beforePosXPrev = parseInt(posXGlobal + stepX, 10);
      var beforePosXNext = parseInt(posXGlobal - stepX, 10);
      var beforePosYPrev = parseInt(posYGlobal + stepY, 10);
      var beforePosYNext = parseInt(posYGlobal - stepY, 10);

      // Checks which direction takes to scroll
      if (Math.abs(afterPos0 - posXGlobal) < Math.abs(afterPos1 - posYGlobal)) {
        // Scroll vertically
        if (afterPos1 > beforePosYPrev) {
          // Scroll page up
          if (!params.useScrollbar) {
            showMainView(direction.PREV);
          }
        } else if (afterPos1 < beforePosYNext) {
          // Scroll page down
          if (!params.useScrollbar) {
            showMainView(direction.NEXT);
          }
        }
      } else {
        // Scroll horizontally
        currBagNbr = getCurrBagNbr();

        if (currBagNbr > -1) {
          if (afterPos0 > beforePosXPrev) {
            // Scroll page right
            showSubView(currBagNbr, direction.PREV);
          } else if (afterPos0 < beforePosXNext) {
            // Scroll page left
            showSubView(currBagNbr, direction.NEXT);
          }
        }
      }
    };

    // Sets current cursor position
    var onCursorMove = function (event) {
      if (!params.useScrollbar) {
        event.preventDefault ?
          event.preventDefault() :
          (event.returnValue = false); // preventDefault - other than IE8, returnValue - IE8
      }

      setPointerPosition(event);
    };

    // Gets x cursor position
    var getCursorPosX = function (obj) {
      return obj.clientX;
    };

    // Gets y cursor position
    var getCursorPosY = function (obj) {
      return obj.clientY;
    };

    // ----------------------------------------
    // START INIT FUNCTION
    // ----------------------------------------

    // Init function
    var init = function () {
      touchable = isTouchDevice();
      addIndexOf();
      addIncludes();
      setStartDimension();

      addClassesForSubBags();
      addWrappersForSubBags();
      calcViewsDimensions();
      changeCssOnScrollbarVisible();
      createBagObjsForAllViews();

      for (
        var bagObjNbr = 0, len = allBagObjs.length; bagObjNbr < len; bagObjNbr++
      ) {
        calcViewsPos(allBagObjs[bagObjNbr]);
      }

      // Corrects subviews position after first page load without any URL anchor and when the scrollbar is visible
      onResize(false, false, false);

      // Checks if scrolling by wheel is not activated
      if (!params.useScrollbar) {
        bindWheel();
      }

      setActiveView();
      // Sets appropriate view after page is loaded (based on hash name from URL)
      changeViewOnHashChange();
      bindAnchor();
      bindHashChange();
      bindScroll();
      bindResize();
      bindTouch();
      bindPrevNextClickEvent();

      // Checks if changing of views by keyboard is activated
      if (params.useKeyboard) {
        bindKeyboard();
      }

      setMainbagDimWhenFixed();
    };

    // ----------------------------------------
    // START MAIN BAG OBJECT
    // ----------------------------------------

    // Main bag object
    var bagObject = function () {
      // Views data
      var viewsData = {
        activeView: "", // Active view
        container: "", // Class name of the bag
        bagType: bagType.MAINBAG, // Type of bag (0 - mainbag or 1 - subbag) - important for scrolling
        views: [], // Names of views, for example: [0#view-1, 1#view-2. 2#view-3, 3#view-4, 4#view-5]
        viewsPos: [] // Positions of views
      };

      // Sets bag object
      var setBagObj = function (container, viewList, bagType) {
        viewsData.container = container;
        viewsData.views = viewList;
        viewsData.bagType = bagType;
        viewsData.activeView = viewsData.views[0];
      };

      return {
        setBagObj: setBagObj,
        viewsData: viewsData
      };
    };

    init();
  };
})(jQuery);
