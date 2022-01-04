/*! mdbFilter */
(function ($) {

  $.fn.mdbFilter = function(options) {
    let settings = $.extend({
      draggable: false,
      filterData: 'filter',
      filterTarget: 'category',
      fillGaps: false
    }, options)
  
    let filterFieldValue, searchFieldValue;
    let target = $(this)[0].querySelector('.filter-gallery');
    let gallery = new Muuri(target, {dragEnabled: settings.draggable, fillGaps: settings.fillGaps});
  
    function filter() {
      filterFieldValue = $(this).data(settings.filterData);
      $(this).parent().find('.active').removeClass('active');
      $(this).addClass('active');
      gallery.filter(function (item) {
        let element = item.getElement();
        let isSearchMatch = !searchFieldValue ? true : (element.getAttribute('data-title') || '').toLowerCase().indexOf(searchFieldValue) > -1;
        let isFilterMatch = !filterFieldValue ? true : (element.getAttribute('data-' + settings.filterTarget) || '') === filterFieldValue;
        return isSearchMatch && isFilterMatch;
      });
    }
  
    $(this).find('.filter-nav button').on('click', filter);
  }
  
  var initPhotoSwipeFromDOM = function(gallerySelector) {
  
    // parse slide data (url, title, size ...) from DOM elements 
    // (children of gallerySelector)
    var parseThumbnailElements = function(el) {
        var thumbElements = el.childNodes,
            numNodes = thumbElements.length,
            items = [],
            figureEl,
            linkEl,
            size,
            item;
  
        for(var i = 0; i < numNodes; i++) {
  
            figureEl = thumbElements[i]; // <figure> element
  
            // include only element nodes 
            if(figureEl.nodeType !== 1) {
                continue;
            }
  
            linkEl = figureEl.children[0].children[0]; // <a> element
  
            size = linkEl.getAttribute('data-size').split('x');
  
            // create slide object
            item = {
                src: linkEl.getAttribute('href'),
                w: parseInt(size[0], 10),
                h: parseInt(size[1], 10)
            };
  
  
  
            if(figureEl.children.length > 1) {
                // <figcaption> content
                item.title = figureEl.children[1].innerHTML; 
            }
  
            if(linkEl.children.length > 0) {
                // <img> thumbnail element, retrieving thumbnail url
                item.msrc = linkEl.children[0].getAttribute('src');
            } 
  
            item.el = figureEl; // save link to element for getThumbBoundsFn
            items.push(item);
        }
  
        return items;
    };
  
    // find nearest parent element
    var closest = function closest(el, fn) {
        return el && ( fn(el) ? el : closest(el.parentNode, fn) );
    };
  
    // triggers when user clicks on thumbnail
    var onThumbnailsClick = function(e) {
        e = e || window.event;
        e.preventDefault ? e.preventDefault() : e.returnValue = false;
  
        var eTarget = e.target || e.srcElement;
  
        // find root element of slide
        var clickedListItem = closest(eTarget, function(el) {
            return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
        });
  
        if(!clickedListItem) {
            return;
        }
  
        // find index of clicked item by looping through all child nodes
        // alternatively, you may define index via data- attribute
        var clickedGallery = clickedListItem.parentNode,
            childNodes = clickedListItem.parentNode.childNodes,
            numChildNodes = childNodes.length,
            nodeIndex = 0,
            index;
  
        for (var i = 0; i < numChildNodes; i++) {
            if(childNodes[i].nodeType !== 1) { 
                continue; 
            }
  
            if(childNodes[i] === clickedListItem) {
                index = nodeIndex;
                break;
            }
            nodeIndex++;
        }
  
  
  
        if(index >= 0) {
            // open PhotoSwipe if valid index found
            openPhotoSwipe( index, clickedGallery );
        }
        return false;
    };
  
    // parse picture index and gallery index from URL (#&pid=1&gid=2)
    var photoswipeParseHash = function() {
        var hash = window.location.hash.substring(1),
        params = {};
  
        if(hash.length < 5) {
            return params;
        }
  
        var vars = hash.split('&');
        for (var i = 0; i < vars.length; i++) {
            if(!vars[i]) {
                continue;
            }
            var pair = vars[i].split('=');  
            if(pair.length < 2) {
                continue;
            }           
            params[pair[0]] = pair[1];
        }
  
        if(params.gid) {
            params.gid = parseInt(params.gid, 10);
        }
  
        return params;
    };
  
    var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
        var pswpElement = document.querySelectorAll('.pswp')[0],
            gallery,
            options,
            items;
  
        items = parseThumbnailElements(galleryElement);
  
        // define options (if needed)
        options = {
  
            // define gallery index (for URL)
            galleryUID: galleryElement.getAttribute('data-pswp-uid'),
  
            getThumbBoundsFn: function(index) {
                // See Options -> getThumbBoundsFn section of documentation for more info
                var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                    pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                    rect = thumbnail.getBoundingClientRect(); 
  
                return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
            }
  
        };
  
        // PhotoSwipe opened from URL
        if(fromURL) {
            if(options.galleryPIDs) {
                // parse real index when custom PIDs are used 
                // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                for(var j = 0; j < items.length; j++) {
                    if(items[j].pid == index) {
                        options.index = j;
                        break;
                    }
                }
            } else {
                // in URL indexes start from 1
                options.index = parseInt(index, 10) - 1;
            }
        } else {
            options.index = parseInt(index, 10);
        }
  
        // exit if index not found
        if( isNaN(options.index) ) {
            return;
        }
  
        if(disableAnimation) {
            options.showAnimationDuration = 0;
        }
  
        // Pass data to PhotoSwipe and initialize it
        gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
        gallery.init();
    };
  
    // loop through all gallery elements and bind events
    var galleryElements = document.querySelectorAll( gallerySelector );
  
    for(var i = 0, l = galleryElements.length; i < l; i++) {
        galleryElements[i].setAttribute('data-pswp-uid', i+1);
        galleryElements[i].onclick = onThumbnailsClick;
    }
  
    // Parse URL and open gallery if it contains #&pid=3&gid=1
    var hashData = photoswipeParseHash();
    if(hashData.pid && hashData.gid) {
        openPhotoSwipe( hashData.pid ,  galleryElements[ hashData.gid - 1 ], true, true );
    }
  };
  
  // execute above function
  initPhotoSwipeFromDOM('.mdb-ligthbox');

}(jQuery));

/*! Hammer.JS - v2.0.8 - 2016-04-23
 * http://hammerjs.github.io/
 *
 * Copyright (c) 2016 Jorik Tangelder;
 * Licensed under the MIT license */
(function(window, document, exportName, undefined) {
  'use strict';

var VENDOR_PREFIXES = ['', 'webkit', 'Moz', 'MS', 'ms', 'o'];
var TEST_ELEMENT = document.createElement('div');

var TYPE_FUNCTION = 'function';

var round = Math.round;
var abs = Math.abs;
var now = Date.now;

/**
 * set a timeout with a given scope
 * @param {Function} fn
 * @param {Number} timeout
 * @param {Object} context
 * @returns {number}
 */
function setTimeoutContext(fn, timeout, context) {
    return setTimeout(bindFn(fn, context), timeout);
}

/**
 * if the argument is an array, we want to execute the fn on each entry
 * if it aint an array we don't want to do a thing.
 * this is used by all the methods that accept a single and array argument.
 * @param {*|Array} arg
 * @param {String} fn
 * @param {Object} [context]
 * @returns {Boolean}
 */
function invokeArrayArg(arg, fn, context) {
    if (Array.isArray(arg)) {
        each(arg, context[fn], context);
        return true;
    }
    return false;
}

/**
 * walk objects and arrays
 * @param {Object} obj
 * @param {Function} iterator
 * @param {Object} context
 */
function each(obj, iterator, context) {
    var i;

    if (!obj) {
        return;
    }

    if (obj.forEach) {
        obj.forEach(iterator, context);
    } else if (obj.length !== undefined) {
        i = 0;
        while (i < obj.length) {
            iterator.call(context, obj[i], i, obj);
            i++;
        }
    } else {
        for (i in obj) {
            obj.hasOwnProperty(i) && iterator.call(context, obj[i], i, obj);
        }
    }
}

/**
 * wrap a method with a deprecation warning and stack trace
 * @param {Function} method
 * @param {String} name
 * @param {String} message
 * @returns {Function} A new function wrapping the supplied method.
 */
function deprecate(method, name, message) {
    var deprecationMessage = 'DEPRECATED METHOD: ' + name + '\n' + message + ' AT \n';
    return function() {
        var e = new Error('get-stack-trace');
        var stack = e && e.stack ? e.stack.replace(/^[^\(]+?[\n$]/gm, '')
            .replace(/^\s+at\s+/gm, '')
            .replace(/^Object.<anonymous>\s*\(/gm, '{anonymous}()@') : 'Unknown Stack Trace';

        var log = window.console && (window.console.warn || window.console.log);
        if (log) {
            log.call(window.console, deprecationMessage, stack);
        }
        return method.apply(this, arguments);
    };
}

/**
 * extend object.
 * means that properties in dest will be overwritten by the ones in src.
 * @param {Object} target
 * @param {...Object} objects_to_assign
 * @returns {Object} target
 */
var assign;
if (typeof Object.assign !== 'function') {
    assign = function assign(target) {
        if (target === undefined || target === null) {
            throw new TypeError('Cannot convert undefined or null to object');
        }

        var output = Object(target);
        for (var index = 1; index < arguments.length; index++) {
            var source = arguments[index];
            if (source !== undefined && source !== null) {
                for (var nextKey in source) {
                    if (source.hasOwnProperty(nextKey)) {
                        output[nextKey] = source[nextKey];
                    }
                }
            }
        }
        return output;
    };
} else {
    assign = Object.assign;
}

/**
 * extend object.
 * means that properties in dest will be overwritten by the ones in src.
 * @param {Object} dest
 * @param {Object} src
 * @param {Boolean} [merge=false]
 * @returns {Object} dest
 */
var extend = deprecate(function extend(dest, src, merge) {
    var keys = Object.keys(src);
    var i = 0;
    while (i < keys.length) {
        if (!merge || (merge && dest[keys[i]] === undefined)) {
            dest[keys[i]] = src[keys[i]];
        }
        i++;
    }
    return dest;
}, 'extend', 'Use `assign`.');

/**
 * merge the values from src in the dest.
 * means that properties that exist in dest will not be overwritten by src
 * @param {Object} dest
 * @param {Object} src
 * @returns {Object} dest
 */
var merge = deprecate(function merge(dest, src) {
    return extend(dest, src, true);
}, 'merge', 'Use `assign`.');

/**
 * simple class inheritance
 * @param {Function} child
 * @param {Function} base
 * @param {Object} [properties]
 */
function inherit(child, base, properties) {
    var baseP = base.prototype,
        childP;

    childP = child.prototype = Object.create(baseP);
    childP.constructor = child;
    childP._super = baseP;

    if (properties) {
        assign(childP, properties);
    }
}

/**
 * simple function bind
 * @param {Function} fn
 * @param {Object} context
 * @returns {Function}
 */
function bindFn(fn, context) {
    return function boundFn() {
        return fn.apply(context, arguments);
    };
}

/**
 * let a boolean value also be a function that must return a boolean
 * this first item in args will be used as the context
 * @param {Boolean|Function} val
 * @param {Array} [args]
 * @returns {Boolean}
 */
function boolOrFn(val, args) {
    if (typeof val == TYPE_FUNCTION) {
        return val.apply(args ? args[0] || undefined : undefined, args);
    }
    return val;
}

/**
 * use the val2 when val1 is undefined
 * @param {*} val1
 * @param {*} val2
 * @returns {*}
 */
function ifUndefined(val1, val2) {
    return (val1 === undefined) ? val2 : val1;
}

/**
 * addEventListener with multiple events at once
 * @param {EventTarget} target
 * @param {String} types
 * @param {Function} handler
 */
function addEventListeners(target, types, handler) {
    each(splitStr(types), function(type) {
        target.addEventListener(type, handler, false);
    });
}

/**
 * removeEventListener with multiple events at once
 * @param {EventTarget} target
 * @param {String} types
 * @param {Function} handler
 */
function removeEventListeners(target, types, handler) {
    each(splitStr(types), function(type) {
        target.removeEventListener(type, handler, false);
    });
}

/**
 * find if a node is in the given parent
 * @method hasParent
 * @param {HTMLElement} node
 * @param {HTMLElement} parent
 * @return {Boolean} found
 */
function hasParent(node, parent) {
    while (node) {
        if (node == parent) {
            return true;
        }
        node = node.parentNode;
    }
    return false;
}

/**
 * small indexOf wrapper
 * @param {String} str
 * @param {String} find
 * @returns {Boolean} found
 */
function inStr(str, find) {
    return str.indexOf(find) > -1;
}

/**
 * split string on whitespace
 * @param {String} str
 * @returns {Array} words
 */
function splitStr(str) {
    return str.trim().split(/\s+/g);
}

/**
 * find if a array contains the object using indexOf or a simple polyFill
 * @param {Array} src
 * @param {String} find
 * @param {String} [findByKey]
 * @return {Boolean|Number} false when not found, or the index
 */
function inArray(src, find, findByKey) {
    if (src.indexOf && !findByKey) {
        return src.indexOf(find);
    } else {
        var i = 0;
        while (i < src.length) {
            if ((findByKey && src[i][findByKey] == find) || (!findByKey && src[i] === find)) {
                return i;
            }
            i++;
        }
        return -1;
    }
}

/**
 * convert array-like objects to real arrays
 * @param {Object} obj
 * @returns {Array}
 */
function toArray(obj) {
    return Array.prototype.slice.call(obj, 0);
}

/**
 * unique array with objects based on a key (like 'id') or just by the array's value
 * @param {Array} src [{id:1},{id:2},{id:1}]
 * @param {String} [key]
 * @param {Boolean} [sort=False]
 * @returns {Array} [{id:1},{id:2}]
 */
function uniqueArray(src, key, sort) {
    var results = [];
    var values = [];
    var i = 0;

    while (i < src.length) {
        var val = key ? src[i][key] : src[i];
        if (inArray(values, val) < 0) {
            results.push(src[i]);
        }
        values[i] = val;
        i++;
    }

    if (sort) {
        if (!key) {
            results = results.sort();
        } else {
            results = results.sort(function sortUniqueArray(a, b) {
                return a[key] > b[key];
            });
        }
    }

    return results;
}

/**
 * get the prefixed property
 * @param {Object} obj
 * @param {String} property
 * @returns {String|Undefined} prefixed
 */
function prefixed(obj, property) {
    var prefix, prop;
    var camelProp = property[0].toUpperCase() + property.slice(1);

    var i = 0;
    while (i < VENDOR_PREFIXES.length) {
        prefix = VENDOR_PREFIXES[i];
        prop = (prefix) ? prefix + camelProp : property;

        if (prop in obj) {
            return prop;
        }
        i++;
    }
    return undefined;
}

/**
 * get a unique id
 * @returns {number} uniqueId
 */
var _uniqueId = 1;
function uniqueId() {
    return _uniqueId++;
}

/**
 * get the window object of an element
 * @param {HTMLElement} element
 * @returns {DocumentView|Window}
 */
function getWindowForElement(element) {
    var doc = element.ownerDocument || element;
    return (doc.defaultView || doc.parentWindow || window);
}

var MOBILE_REGEX = /mobile|tablet|ip(ad|hone|od)|android/i;

var SUPPORT_TOUCH = ('ontouchstart' in window);
var SUPPORT_POINTER_EVENTS = prefixed(window, 'PointerEvent') !== undefined;
var SUPPORT_ONLY_TOUCH = SUPPORT_TOUCH && MOBILE_REGEX.test(navigator.userAgent);

var INPUT_TYPE_TOUCH = 'touch';
var INPUT_TYPE_PEN = 'pen';
var INPUT_TYPE_MOUSE = 'mouse';
var INPUT_TYPE_KINECT = 'kinect';

var COMPUTE_INTERVAL = 25;

var INPUT_START = 1;
var INPUT_MOVE = 2;
var INPUT_END = 4;
var INPUT_CANCEL = 8;

var DIRECTION_NONE = 1;
var DIRECTION_LEFT = 2;
var DIRECTION_RIGHT = 4;
var DIRECTION_UP = 8;
var DIRECTION_DOWN = 16;

var DIRECTION_HORIZONTAL = DIRECTION_LEFT | DIRECTION_RIGHT;
var DIRECTION_VERTICAL = DIRECTION_UP | DIRECTION_DOWN;
var DIRECTION_ALL = DIRECTION_HORIZONTAL | DIRECTION_VERTICAL;

var PROPS_XY = ['x', 'y'];
var PROPS_CLIENT_XY = ['clientX', 'clientY'];

/**
 * create new input type manager
 * @param {Manager} manager
 * @param {Function} callback
 * @returns {Input}
 * @constructor
 */
function Input(manager, callback) {
    var self = this;
    this.manager = manager;
    this.callback = callback;
    this.element = manager.element;
    this.target = manager.options.inputTarget;

    // smaller wrapper around the handler, for the scope and the enabled state of the manager,
    // so when disabled the input events are completely bypassed.
    this.domHandler = function(ev) {
        if (boolOrFn(manager.options.enable, [manager])) {
            self.handler(ev);
        }
    };

    this.init();

}

Input.prototype = {
    /**
     * should handle the inputEvent data and trigger the callback
     * @virtual
     */
    handler: function() { },

    /**
     * bind the events
     */
    init: function() {
        this.evEl && addEventListeners(this.element, this.evEl, this.domHandler);
        this.evTarget && addEventListeners(this.target, this.evTarget, this.domHandler);
        this.evWin && addEventListeners(getWindowForElement(this.element), this.evWin, this.domHandler);
    },

    /**
     * unbind the events
     */
    destroy: function() {
        this.evEl && removeEventListeners(this.element, this.evEl, this.domHandler);
        this.evTarget && removeEventListeners(this.target, this.evTarget, this.domHandler);
        this.evWin && removeEventListeners(getWindowForElement(this.element), this.evWin, this.domHandler);
    }
};

/**
 * create new input type manager
 * called by the Manager constructor
 * @param {Hammer} manager
 * @returns {Input}
 */
function createInputInstance(manager) {
    var Type;
    var inputClass = manager.options.inputClass;

    if (inputClass) {
        Type = inputClass;
    } else if (SUPPORT_POINTER_EVENTS) {
        Type = PointerEventInput;
    } else if (SUPPORT_ONLY_TOUCH) {
        Type = TouchInput;
    } else if (!SUPPORT_TOUCH) {
        Type = MouseInput;
    } else {
        Type = TouchMouseInput;
    }
    return new (Type)(manager, inputHandler);
}

/**
 * handle input events
 * @param {Manager} manager
 * @param {String} eventType
 * @param {Object} input
 */
function inputHandler(manager, eventType, input) {
    var pointersLen = input.pointers.length;
    var changedPointersLen = input.changedPointers.length;
    var isFirst = (eventType & INPUT_START && (pointersLen - changedPointersLen === 0));
    var isFinal = (eventType & (INPUT_END | INPUT_CANCEL) && (pointersLen - changedPointersLen === 0));

    input.isFirst = !!isFirst;
    input.isFinal = !!isFinal;

    if (isFirst) {
        manager.session = {};
    }

    // source event is the normalized value of the domEvents
    // like 'touchstart, mouseup, pointerdown'
    input.eventType = eventType;

    // compute scale, rotation etc
    computeInputData(manager, input);

    // emit secret event
    manager.emit('hammer.input', input);

    manager.recognize(input);
    manager.session.prevInput = input;
}

/**
 * extend the data with some usable properties like scale, rotate, velocity etc
 * @param {Object} manager
 * @param {Object} input
 */
function computeInputData(manager, input) {
    var session = manager.session;
    var pointers = input.pointers;
    var pointersLength = pointers.length;

    // store the first input to calculate the distance and direction
    if (!session.firstInput) {
        session.firstInput = simpleCloneInputData(input);
    }

    // to compute scale and rotation we need to store the multiple touches
    if (pointersLength > 1 && !session.firstMultiple) {
        session.firstMultiple = simpleCloneInputData(input);
    } else if (pointersLength === 1) {
        session.firstMultiple = false;
    }

    var firstInput = session.firstInput;
    var firstMultiple = session.firstMultiple;
    var offsetCenter = firstMultiple ? firstMultiple.center : firstInput.center;

    var center = input.center = getCenter(pointers);
    input.timeStamp = now();
    input.deltaTime = input.timeStamp - firstInput.timeStamp;

    input.angle = getAngle(offsetCenter, center);
    input.distance = getDistance(offsetCenter, center);

    computeDeltaXY(session, input);
    input.offsetDirection = getDirection(input.deltaX, input.deltaY);

    var overallVelocity = getVelocity(input.deltaTime, input.deltaX, input.deltaY);
    input.overallVelocityX = overallVelocity.x;
    input.overallVelocityY = overallVelocity.y;
    input.overallVelocity = (abs(overallVelocity.x) > abs(overallVelocity.y)) ? overallVelocity.x : overallVelocity.y;

    input.scale = firstMultiple ? getScale(firstMultiple.pointers, pointers) : 1;
    input.rotation = firstMultiple ? getRotation(firstMultiple.pointers, pointers) : 0;

    input.maxPointers = !session.prevInput ? input.pointers.length : ((input.pointers.length >
        session.prevInput.maxPointers) ? input.pointers.length : session.prevInput.maxPointers);

    computeIntervalInputData(session, input);

    // find the correct target
    var target = manager.element;
    if (hasParent(input.srcEvent.target, target)) {
        target = input.srcEvent.target;
    }
    input.target = target;
}

function computeDeltaXY(session, input) {
    var center = input.center;
    var offset = session.offsetDelta || {};
    var prevDelta = session.prevDelta || {};
    var prevInput = session.prevInput || {};

    if (input.eventType === INPUT_START || prevInput.eventType === INPUT_END) {
        prevDelta = session.prevDelta = {
            x: prevInput.deltaX || 0,
            y: prevInput.deltaY || 0
        };

        offset = session.offsetDelta = {
            x: center.x,
            y: center.y
        };
    }

    input.deltaX = prevDelta.x + (center.x - offset.x);
    input.deltaY = prevDelta.y + (center.y - offset.y);
}

/**
 * velocity is calculated every x ms
 * @param {Object} session
 * @param {Object} input
 */
function computeIntervalInputData(session, input) {
    var last = session.lastInterval || input,
        deltaTime = input.timeStamp - last.timeStamp,
        velocity, velocityX, velocityY, direction;

    if (input.eventType != INPUT_CANCEL && (deltaTime > COMPUTE_INTERVAL || last.velocity === undefined)) {
        var deltaX = input.deltaX - last.deltaX;
        var deltaY = input.deltaY - last.deltaY;

        var v = getVelocity(deltaTime, deltaX, deltaY);
        velocityX = v.x;
        velocityY = v.y;
        velocity = (abs(v.x) > abs(v.y)) ? v.x : v.y;
        direction = getDirection(deltaX, deltaY);

        session.lastInterval = input;
    } else {
        // use latest velocity info if it doesn't overtake a minimum period
        velocity = last.velocity;
        velocityX = last.velocityX;
        velocityY = last.velocityY;
        direction = last.direction;
    }

    input.velocity = velocity;
    input.velocityX = velocityX;
    input.velocityY = velocityY;
    input.direction = direction;
}

/**
 * create a simple clone from the input used for storage of firstInput and firstMultiple
 * @param {Object} input
 * @returns {Object} clonedInputData
 */
function simpleCloneInputData(input) {
    // make a simple copy of the pointers because we will get a reference if we don't
    // we only need clientXY for the calculations
    var pointers = [];
    var i = 0;
    while (i < input.pointers.length) {
        pointers[i] = {
            clientX: round(input.pointers[i].clientX),
            clientY: round(input.pointers[i].clientY)
        };
        i++;
    }

    return {
        timeStamp: now(),
        pointers: pointers,
        center: getCenter(pointers),
        deltaX: input.deltaX,
        deltaY: input.deltaY
    };
}

/**
 * get the center of all the pointers
 * @param {Array} pointers
 * @return {Object} center contains `x` and `y` properties
 */
function getCenter(pointers) {
    var pointersLength = pointers.length;

    // no need to loop when only one touch
    if (pointersLength === 1) {
        return {
            x: round(pointers[0].clientX),
            y: round(pointers[0].clientY)
        };
    }

    var x = 0, y = 0, i = 0;
    while (i < pointersLength) {
        x += pointers[i].clientX;
        y += pointers[i].clientY;
        i++;
    }

    return {
        x: round(x / pointersLength),
        y: round(y / pointersLength)
    };
}

/**
 * calculate the velocity between two points. unit is in px per ms.
 * @param {Number} deltaTime
 * @param {Number} x
 * @param {Number} y
 * @return {Object} velocity `x` and `y`
 */
function getVelocity(deltaTime, x, y) {
    return {
        x: x / deltaTime || 0,
        y: y / deltaTime || 0
    };
}

/**
 * get the direction between two points
 * @param {Number} x
 * @param {Number} y
 * @return {Number} direction
 */
function getDirection(x, y) {
    if (x === y) {
        return DIRECTION_NONE;
    }

    if (abs(x) >= abs(y)) {
        return x < 0 ? DIRECTION_LEFT : DIRECTION_RIGHT;
    }
    return y < 0 ? DIRECTION_UP : DIRECTION_DOWN;
}

/**
 * calculate the absolute distance between two points
 * @param {Object} p1 {x, y}
 * @param {Object} p2 {x, y}
 * @param {Array} [props] containing x and y keys
 * @return {Number} distance
 */
function getDistance(p1, p2, props) {
    if (!props) {
        props = PROPS_XY;
    }
    var x = p2[props[0]] - p1[props[0]],
        y = p2[props[1]] - p1[props[1]];

    return Math.sqrt((x * x) + (y * y));
}

/**
 * calculate the angle between two coordinates
 * @param {Object} p1
 * @param {Object} p2
 * @param {Array} [props] containing x and y keys
 * @return {Number} angle
 */
function getAngle(p1, p2, props) {
    if (!props) {
        props = PROPS_XY;
    }
    var x = p2[props[0]] - p1[props[0]],
        y = p2[props[1]] - p1[props[1]];
    return Math.atan2(y, x) * 180 / Math.PI;
}

/**
 * calculate the rotation degrees between two pointersets
 * @param {Array} start array of pointers
 * @param {Array} end array of pointers
 * @return {Number} rotation
 */
function getRotation(start, end) {
    return getAngle(end[1], end[0], PROPS_CLIENT_XY) + getAngle(start[1], start[0], PROPS_CLIENT_XY);
}

/**
 * calculate the scale factor between two pointersets
 * no scale is 1, and goes down to 0 when pinched together, and bigger when pinched out
 * @param {Array} start array of pointers
 * @param {Array} end array of pointers
 * @return {Number} scale
 */
function getScale(start, end) {
    return getDistance(end[0], end[1], PROPS_CLIENT_XY) / getDistance(start[0], start[1], PROPS_CLIENT_XY);
}

var MOUSE_INPUT_MAP = {
    mousedown: INPUT_START,
    mousemove: INPUT_MOVE,
    mouseup: INPUT_END
};

var MOUSE_ELEMENT_EVENTS = 'mousedown';
var MOUSE_WINDOW_EVENTS = 'mousemove mouseup';

/**
 * Mouse events input
 * @constructor
 * @extends Input
 */
function MouseInput() {
    this.evEl = MOUSE_ELEMENT_EVENTS;
    this.evWin = MOUSE_WINDOW_EVENTS;

    this.pressed = false; // mousedown state

    Input.apply(this, arguments);
}

inherit(MouseInput, Input, {
    /**
     * handle mouse events
     * @param {Object} ev
     */
    handler: function MEhandler(ev) {
        var eventType = MOUSE_INPUT_MAP[ev.type];

        // on start we want to have the left mouse button down
        if (eventType & INPUT_START && ev.button === 0) {
            this.pressed = true;
        }

        if (eventType & INPUT_MOVE && ev.which !== 1) {
            eventType = INPUT_END;
        }

        // mouse must be down
        if (!this.pressed) {
            return;
        }

        if (eventType & INPUT_END) {
            this.pressed = false;
        }

        this.callback(this.manager, eventType, {
            pointers: [ev],
            changedPointers: [ev],
            pointerType: INPUT_TYPE_MOUSE,
            srcEvent: ev
        });
    }
});

var POINTER_INPUT_MAP = {
    pointerdown: INPUT_START,
    pointermove: INPUT_MOVE,
    pointerup: INPUT_END,
    pointercancel: INPUT_CANCEL,
    pointerout: INPUT_CANCEL
};

// in IE10 the pointer types is defined as an enum
var IE10_POINTER_TYPE_ENUM = {
    2: INPUT_TYPE_TOUCH,
    3: INPUT_TYPE_PEN,
    4: INPUT_TYPE_MOUSE,
    5: INPUT_TYPE_KINECT // see https://twitter.com/jacobrossi/status/480596438489890816
};

var POINTER_ELEMENT_EVENTS = 'pointerdown';
var POINTER_WINDOW_EVENTS = 'pointermove pointerup pointercancel';

// IE10 has prefixed support, and case-sensitive
if (window.MSPointerEvent && !window.PointerEvent) {
    POINTER_ELEMENT_EVENTS = 'MSPointerDown';
    POINTER_WINDOW_EVENTS = 'MSPointerMove MSPointerUp MSPointerCancel';
}

/**
 * Pointer events input
 * @constructor
 * @extends Input
 */
function PointerEventInput() {
    this.evEl = POINTER_ELEMENT_EVENTS;
    this.evWin = POINTER_WINDOW_EVENTS;

    Input.apply(this, arguments);

    this.store = (this.manager.session.pointerEvents = []);
}

inherit(PointerEventInput, Input, {
    /**
     * handle mouse events
     * @param {Object} ev
     */
    handler: function PEhandler(ev) {
        var store = this.store;
        var removePointer = false;

        var eventTypeNormalized = ev.type.toLowerCase().replace('ms', '');
        var eventType = POINTER_INPUT_MAP[eventTypeNormalized];
        var pointerType = IE10_POINTER_TYPE_ENUM[ev.pointerType] || ev.pointerType;

        var isTouch = (pointerType == INPUT_TYPE_TOUCH);

        // get index of the event in the store
        var storeIndex = inArray(store, ev.pointerId, 'pointerId');

        // start and mouse must be down
        if (eventType & INPUT_START && (ev.button === 0 || isTouch)) {
            if (storeIndex < 0) {
                store.push(ev);
                storeIndex = store.length - 1;
            }
        } else if (eventType & (INPUT_END | INPUT_CANCEL)) {
            removePointer = true;
        }

        // it not found, so the pointer hasn't been down (so it's probably a hover)
        if (storeIndex < 0) {
            return;
        }

        // update the event in the store
        store[storeIndex] = ev;

        this.callback(this.manager, eventType, {
            pointers: store,
            changedPointers: [ev],
            pointerType: pointerType,
            srcEvent: ev
        });

        if (removePointer) {
            // remove from the store
            store.splice(storeIndex, 1);
        }
    }
});

var SINGLE_TOUCH_INPUT_MAP = {
    touchstart: INPUT_START,
    touchmove: INPUT_MOVE,
    touchend: INPUT_END,
    touchcancel: INPUT_CANCEL
};

var SINGLE_TOUCH_TARGET_EVENTS = 'touchstart';
var SINGLE_TOUCH_WINDOW_EVENTS = 'touchstart touchmove touchend touchcancel';

/**
 * Touch events input
 * @constructor
 * @extends Input
 */
function SingleTouchInput() {
    this.evTarget = SINGLE_TOUCH_TARGET_EVENTS;
    this.evWin = SINGLE_TOUCH_WINDOW_EVENTS;
    this.started = false;

    Input.apply(this, arguments);
}

inherit(SingleTouchInput, Input, {
    handler: function TEhandler(ev) {
        var type = SINGLE_TOUCH_INPUT_MAP[ev.type];

        // should we handle the touch events?
        if (type === INPUT_START) {
            this.started = true;
        }

        if (!this.started) {
            return;
        }

        var touches = normalizeSingleTouches.call(this, ev, type);

        // when done, reset the started state
        if (type & (INPUT_END | INPUT_CANCEL) && touches[0].length - touches[1].length === 0) {
            this.started = false;
        }

        this.callback(this.manager, type, {
            pointers: touches[0],
            changedPointers: touches[1],
            pointerType: INPUT_TYPE_TOUCH,
            srcEvent: ev
        });
    }
});

/**
 * @this {TouchInput}
 * @param {Object} ev
 * @param {Number} type flag
 * @returns {undefined|Array} [all, changed]
 */
function normalizeSingleTouches(ev, type) {
    var all = toArray(ev.touches);
    var changed = toArray(ev.changedTouches);

    if (type & (INPUT_END | INPUT_CANCEL)) {
        all = uniqueArray(all.concat(changed), 'identifier', true);
    }

    return [all, changed];
}

var TOUCH_INPUT_MAP = {
    touchstart: INPUT_START,
    touchmove: INPUT_MOVE,
    touchend: INPUT_END,
    touchcancel: INPUT_CANCEL
};

var TOUCH_TARGET_EVENTS = 'touchstart touchmove touchend touchcancel';

/**
 * Multi-user touch events input
 * @constructor
 * @extends Input
 */
function TouchInput() {
    this.evTarget = TOUCH_TARGET_EVENTS;
    this.targetIds = {};

    Input.apply(this, arguments);
}

inherit(TouchInput, Input, {
    handler: function MTEhandler(ev) {
        var type = TOUCH_INPUT_MAP[ev.type];
        var touches = getTouches.call(this, ev, type);
        if (!touches) {
            return;
        }

        this.callback(this.manager, type, {
            pointers: touches[0],
            changedPointers: touches[1],
            pointerType: INPUT_TYPE_TOUCH,
            srcEvent: ev
        });
    }
});

/**
 * @this {TouchInput}
 * @param {Object} ev
 * @param {Number} type flag
 * @returns {undefined|Array} [all, changed]
 */
function getTouches(ev, type) {
    var allTouches = toArray(ev.touches);
    var targetIds = this.targetIds;

    // when there is only one touch, the process can be simplified
    if (type & (INPUT_START | INPUT_MOVE) && allTouches.length === 1) {
        targetIds[allTouches[0].identifier] = true;
        return [allTouches, allTouches];
    }

    var i,
        targetTouches,
        changedTouches = toArray(ev.changedTouches),
        changedTargetTouches = [],
        target = this.target;

    // get target touches from touches
    targetTouches = allTouches.filter(function(touch) {
        return hasParent(touch.target, target);
    });

    // collect touches
    if (type === INPUT_START) {
        i = 0;
        while (i < targetTouches.length) {
            targetIds[targetTouches[i].identifier] = true;
            i++;
        }
    }

    // filter changed touches to only contain touches that exist in the collected target ids
    i = 0;
    while (i < changedTouches.length) {
        if (targetIds[changedTouches[i].identifier]) {
            changedTargetTouches.push(changedTouches[i]);
        }

        // cleanup removed touches
        if (type & (INPUT_END | INPUT_CANCEL)) {
            delete targetIds[changedTouches[i].identifier];
        }
        i++;
    }

    if (!changedTargetTouches.length) {
        return;
    }

    return [
        // merge targetTouches with changedTargetTouches so it contains ALL touches, including 'end' and 'cancel'
        uniqueArray(targetTouches.concat(changedTargetTouches), 'identifier', true),
        changedTargetTouches
    ];
}

/**
 * Combined touch and mouse input
 *
 * Touch has a higher priority then mouse, and while touching no mouse events are allowed.
 * This because touch devices also emit mouse events while doing a touch.
 *
 * @constructor
 * @extends Input
 */

var DEDUP_TIMEOUT = 2500;
var DEDUP_DISTANCE = 25;

function TouchMouseInput() {
    Input.apply(this, arguments);

    var handler = bindFn(this.handler, this);
    this.touch = new TouchInput(this.manager, handler);
    this.mouse = new MouseInput(this.manager, handler);

    this.primaryTouch = null;
    this.lastTouches = [];
}

inherit(TouchMouseInput, Input, {
    /**
     * handle mouse and touch events
     * @param {Hammer} manager
     * @param {String} inputEvent
     * @param {Object} inputData
     */
    handler: function TMEhandler(manager, inputEvent, inputData) {
        var isTouch = (inputData.pointerType == INPUT_TYPE_TOUCH),
            isMouse = (inputData.pointerType == INPUT_TYPE_MOUSE);

        if (isMouse && inputData.sourceCapabilities && inputData.sourceCapabilities.firesTouchEvents) {
            return;
        }

        // when we're in a touch event, record touches to  de-dupe synthetic mouse event
        if (isTouch) {
            recordTouches.call(this, inputEvent, inputData);
        } else if (isMouse && isSyntheticEvent.call(this, inputData)) {
            return;
        }

        this.callback(manager, inputEvent, inputData);
    },

    /**
     * remove the event listeners
     */
    destroy: function destroy() {
        this.touch.destroy();
        this.mouse.destroy();
    }
});

function recordTouches(eventType, eventData) {
    if (eventType & INPUT_START) {
        this.primaryTouch = eventData.changedPointers[0].identifier;
        setLastTouch.call(this, eventData);
    } else if (eventType & (INPUT_END | INPUT_CANCEL)) {
        setLastTouch.call(this, eventData);
    }
}

function setLastTouch(eventData) {
    var touch = eventData.changedPointers[0];

    if (touch.identifier === this.primaryTouch) {
        var lastTouch = {x: touch.clientX, y: touch.clientY};
        this.lastTouches.push(lastTouch);
        var lts = this.lastTouches;
        var removeLastTouch = function() {
            var i = lts.indexOf(lastTouch);
            if (i > -1) {
                lts.splice(i, 1);
            }
        };
        setTimeout(removeLastTouch, DEDUP_TIMEOUT);
    }
}

function isSyntheticEvent(eventData) {
    var x = eventData.srcEvent.clientX, y = eventData.srcEvent.clientY;
    for (var i = 0; i < this.lastTouches.length; i++) {
        var t = this.lastTouches[i];
        var dx = Math.abs(x - t.x), dy = Math.abs(y - t.y);
        if (dx <= DEDUP_DISTANCE && dy <= DEDUP_DISTANCE) {
            return true;
        }
    }
    return false;
}

var PREFIXED_TOUCH_ACTION = prefixed(TEST_ELEMENT.style, 'touchAction');
var NATIVE_TOUCH_ACTION = PREFIXED_TOUCH_ACTION !== undefined;

// magical touchAction value
var TOUCH_ACTION_COMPUTE = 'compute';
var TOUCH_ACTION_AUTO = 'auto';
var TOUCH_ACTION_MANIPULATION = 'manipulation'; // not implemented
var TOUCH_ACTION_NONE = 'none';
var TOUCH_ACTION_PAN_X = 'pan-x';
var TOUCH_ACTION_PAN_Y = 'pan-y';
var TOUCH_ACTION_MAP = getTouchActionProps();

/**
 * Touch Action
 * sets the touchAction property or uses the js alternative
 * @param {Manager} manager
 * @param {String} value
 * @constructor
 */
function TouchAction(manager, value) {
    this.manager = manager;
    this.set(value);
}

TouchAction.prototype = {
    /**
     * set the touchAction value on the element or enable the polyfill
     * @param {String} value
     */
    set: function(value) {
        // find out the touch-action by the event handlers
        if (value == TOUCH_ACTION_COMPUTE) {
            value = this.compute();
        }

        if (NATIVE_TOUCH_ACTION && this.manager.element.style && TOUCH_ACTION_MAP[value]) {
            this.manager.element.style[PREFIXED_TOUCH_ACTION] = value;
        }
        this.actions = value.toLowerCase().trim();
    },

    /**
     * just re-set the touchAction value
     */
    update: function() {
        this.set(this.manager.options.touchAction);
    },

    /**
     * compute the value for the touchAction property based on the recognizer's settings
     * @returns {String} value
     */
    compute: function() {
        var actions = [];
        each(this.manager.recognizers, function(recognizer) {
            if (boolOrFn(recognizer.options.enable, [recognizer])) {
                actions = actions.concat(recognizer.getTouchAction());
            }
        });
        return cleanTouchActions(actions.join(' '));
    },

    /**
     * this method is called on each input cycle and provides the preventing of the browser behavior
     * @param {Object} input
     */
    preventDefaults: function(input) {
        var srcEvent = input.srcEvent;
        var direction = input.offsetDirection;

        // if the touch action did prevented once this session
        if (this.manager.session.prevented) {
            srcEvent.preventDefault();
            return;
        }

        var actions = this.actions;
        var hasNone = inStr(actions, TOUCH_ACTION_NONE) && !TOUCH_ACTION_MAP[TOUCH_ACTION_NONE];
        var hasPanY = inStr(actions, TOUCH_ACTION_PAN_Y) && !TOUCH_ACTION_MAP[TOUCH_ACTION_PAN_Y];
        var hasPanX = inStr(actions, TOUCH_ACTION_PAN_X) && !TOUCH_ACTION_MAP[TOUCH_ACTION_PAN_X];

        if (hasNone) {
            //do not prevent defaults if this is a tap gesture

            var isTapPointer = input.pointers.length === 1;
            var isTapMovement = input.distance < 2;
            var isTapTouchTime = input.deltaTime < 250;

            if (isTapPointer && isTapMovement && isTapTouchTime) {
                return;
            }
        }

        if (hasPanX && hasPanY) {
            // `pan-x pan-y` means browser handles all scrolling/panning, do not prevent
            return;
        }

        if (hasNone ||
            (hasPanY && direction & DIRECTION_HORIZONTAL) ||
            (hasPanX && direction & DIRECTION_VERTICAL)) {
            return this.preventSrc(srcEvent);
        }
    },

    /**
     * call preventDefault to prevent the browser's default behavior (scrolling in most cases)
     * @param {Object} srcEvent
     */
    preventSrc: function(srcEvent) {
        this.manager.session.prevented = true;
        srcEvent.preventDefault();
    }
};

/**
 * when the touchActions are collected they are not a valid value, so we need to clean things up. *
 * @param {String} actions
 * @returns {*}
 */
function cleanTouchActions(actions) {
    // none
    if (inStr(actions, TOUCH_ACTION_NONE)) {
        return TOUCH_ACTION_NONE;
    }

    var hasPanX = inStr(actions, TOUCH_ACTION_PAN_X);
    var hasPanY = inStr(actions, TOUCH_ACTION_PAN_Y);

    // if both pan-x and pan-y are set (different recognizers
    // for different directions, e.g. horizontal pan but vertical swipe?)
    // we need none (as otherwise with pan-x pan-y combined none of these
    // recognizers will work, since the browser would handle all panning
    if (hasPanX && hasPanY) {
        return TOUCH_ACTION_NONE;
    }

    // pan-x OR pan-y
    if (hasPanX || hasPanY) {
        return hasPanX ? TOUCH_ACTION_PAN_X : TOUCH_ACTION_PAN_Y;
    }

    // manipulation
    if (inStr(actions, TOUCH_ACTION_MANIPULATION)) {
        return TOUCH_ACTION_MANIPULATION;
    }

    return TOUCH_ACTION_AUTO;
}

function getTouchActionProps() {
    if (!NATIVE_TOUCH_ACTION) {
        return false;
    }
    var touchMap = {};
    var cssSupports = window.CSS && window.CSS.supports;
    ['auto', 'manipulation', 'pan-y', 'pan-x', 'pan-x pan-y', 'none'].forEach(function(val) {

        // If css.supports is not supported but there is native touch-action assume it supports
        // all values. This is the case for IE 10 and 11.
        touchMap[val] = cssSupports ? window.CSS.supports('touch-action', val) : true;
    });
    return touchMap;
}

/**
 * Recognizer flow explained; *
 * All recognizers have the initial state of POSSIBLE when a input session starts.
 * The definition of a input session is from the first input until the last input, with all it's movement in it. *
 * Example session for mouse-input: mousedown -> mousemove -> mouseup
 *
 * On each recognizing cycle (see Manager.recognize) the .recognize() method is executed
 * which determines with state it should be.
 *
 * If the recognizer has the state FAILED, CANCELLED or RECOGNIZED (equals ENDED), it is reset to
 * POSSIBLE to give it another change on the next cycle.
 *
 *               Possible
 *                  |
 *            +-----+---------------+
 *            |                     |
 *      +-----+-----+               |
 *      |           |               |
 *   Failed      Cancelled          |
 *                          +-------+------+
 *                          |              |
 *                      Recognized       Began
 *                                         |
 *                                      Changed
 *                                         |
 *                                  Ended/Recognized
 */
var STATE_POSSIBLE = 1;
var STATE_BEGAN = 2;
var STATE_CHANGED = 4;
var STATE_ENDED = 8;
var STATE_RECOGNIZED = STATE_ENDED;
var STATE_CANCELLED = 16;
var STATE_FAILED = 32;

/**
 * Recognizer
 * Every recognizer needs to extend from this class.
 * @constructor
 * @param {Object} options
 */
function Recognizer(options) {
    this.options = assign({}, this.defaults, options || {});

    this.id = uniqueId();

    this.manager = null;

    // default is enable true
    this.options.enable = ifUndefined(this.options.enable, true);

    this.state = STATE_POSSIBLE;

    this.simultaneous = {};
    this.requireFail = [];
}

Recognizer.prototype = {
    /**
     * @virtual
     * @type {Object}
     */
    defaults: {},

    /**
     * set options
     * @param {Object} options
     * @return {Recognizer}
     */
    set: function(options) {
        assign(this.options, options);

        // also update the touchAction, in case something changed about the directions/enabled state
        this.manager && this.manager.touchAction.update();
        return this;
    },

    /**
     * recognize simultaneous with an other recognizer.
     * @param {Recognizer} otherRecognizer
     * @returns {Recognizer} this
     */
    recognizeWith: function(otherRecognizer) {
        if (invokeArrayArg(otherRecognizer, 'recognizeWith', this)) {
            return this;
        }

        var simultaneous = this.simultaneous;
        otherRecognizer = getRecognizerByNameIfManager(otherRecognizer, this);
        if (!simultaneous[otherRecognizer.id]) {
            simultaneous[otherRecognizer.id] = otherRecognizer;
            otherRecognizer.recognizeWith(this);
        }
        return this;
    },

    /**
     * drop the simultaneous link. it doesnt remove the link on the other recognizer.
     * @param {Recognizer} otherRecognizer
     * @returns {Recognizer} this
     */
    dropRecognizeWith: function(otherRecognizer) {
        if (invokeArrayArg(otherRecognizer, 'dropRecognizeWith', this)) {
            return this;
        }

        otherRecognizer = getRecognizerByNameIfManager(otherRecognizer, this);
        delete this.simultaneous[otherRecognizer.id];
        return this;
    },

    /**
     * recognizer can only run when an other is failing
     * @param {Recognizer} otherRecognizer
     * @returns {Recognizer} this
     */
    requireFailure: function(otherRecognizer) {
        if (invokeArrayArg(otherRecognizer, 'requireFailure', this)) {
            return this;
        }

        var requireFail = this.requireFail;
        otherRecognizer = getRecognizerByNameIfManager(otherRecognizer, this);
        if (inArray(requireFail, otherRecognizer) === -1) {
            requireFail.push(otherRecognizer);
            otherRecognizer.requireFailure(this);
        }
        return this;
    },

    /**
     * drop the requireFailure link. it does not remove the link on the other recognizer.
     * @param {Recognizer} otherRecognizer
     * @returns {Recognizer} this
     */
    dropRequireFailure: function(otherRecognizer) {
        if (invokeArrayArg(otherRecognizer, 'dropRequireFailure', this)) {
            return this;
        }

        otherRecognizer = getRecognizerByNameIfManager(otherRecognizer, this);
        var index = inArray(this.requireFail, otherRecognizer);
        if (index > -1) {
            this.requireFail.splice(index, 1);
        }
        return this;
    },

    /**
     * has require failures boolean
     * @returns {boolean}
     */
    hasRequireFailures: function() {
        return this.requireFail.length > 0;
    },

    /**
     * if the recognizer can recognize simultaneous with an other recognizer
     * @param {Recognizer} otherRecognizer
     * @returns {Boolean}
     */
    canRecognizeWith: function(otherRecognizer) {
        return !!this.simultaneous[otherRecognizer.id];
    },

    /**
     * You should use `tryEmit` instead of `emit` directly to check
     * that all the needed recognizers has failed before emitting.
     * @param {Object} input
     */
    emit: function(input) {
        var self = this;
        var state = this.state;

        function emit(event) {
            self.manager.emit(event, input);
        }

        // 'panstart' and 'panmove'
        if (state < STATE_ENDED) {
            emit(self.options.event + stateStr(state));
        }

        emit(self.options.event); // simple 'eventName' events

        if (input.additionalEvent) { // additional event(panleft, panright, pinchin, pinchout...)
            emit(input.additionalEvent);
        }

        // panend and pancancel
        if (state >= STATE_ENDED) {
            emit(self.options.event + stateStr(state));
        }
    },

    /**
     * Check that all the require failure recognizers has failed,
     * if true, it emits a gesture event,
     * otherwise, setup the state to FAILED.
     * @param {Object} input
     */
    tryEmit: function(input) {
        if (this.canEmit()) {
            return this.emit(input);
        }
        // it's failing anyway
        this.state = STATE_FAILED;
    },

    /**
     * can we emit?
     * @returns {boolean}
     */
    canEmit: function() {
        var i = 0;
        while (i < this.requireFail.length) {
            if (!(this.requireFail[i].state & (STATE_FAILED | STATE_POSSIBLE))) {
                return false;
            }
            i++;
        }
        return true;
    },

    /**
     * update the recognizer
     * @param {Object} inputData
     */
    recognize: function(inputData) {
        // make a new copy of the inputData
        // so we can change the inputData without messing up the other recognizers
        var inputDataClone = assign({}, inputData);

        // is is enabled and allow recognizing?
        if (!boolOrFn(this.options.enable, [this, inputDataClone])) {
            this.reset();
            this.state = STATE_FAILED;
            return;
        }

        // reset when we've reached the end
        if (this.state & (STATE_RECOGNIZED | STATE_CANCELLED | STATE_FAILED)) {
            this.state = STATE_POSSIBLE;
        }

        this.state = this.process(inputDataClone);

        // the recognizer has recognized a gesture
        // so trigger an event
        if (this.state & (STATE_BEGAN | STATE_CHANGED | STATE_ENDED | STATE_CANCELLED)) {
            this.tryEmit(inputDataClone);
        }
    },

    /**
     * return the state of the recognizer
     * the actual recognizing happens in this method
     * @virtual
     * @param {Object} inputData
     * @returns {Const} STATE
     */
    process: function(inputData) { }, // jshint ignore:line

    /**
     * return the preferred touch-action
     * @virtual
     * @returns {Array}
     */
    getTouchAction: function() { },

    /**
     * called when the gesture isn't allowed to recognize
     * like when another is being recognized or it is disabled
     * @virtual
     */
    reset: function() { }
};

/**
 * get a usable string, used as event postfix
 * @param {Const} state
 * @returns {String} state
 */
function stateStr(state) {
    if (state & STATE_CANCELLED) {
        return 'cancel';
    } else if (state & STATE_ENDED) {
        return 'end';
    } else if (state & STATE_CHANGED) {
        return 'move';
    } else if (state & STATE_BEGAN) {
        return 'start';
    }
    return '';
}

/**
 * direction cons to string
 * @param {Const} direction
 * @returns {String}
 */
function directionStr(direction) {
    if (direction == DIRECTION_DOWN) {
        return 'down';
    } else if (direction == DIRECTION_UP) {
        return 'up';
    } else if (direction == DIRECTION_LEFT) {
        return 'left';
    } else if (direction == DIRECTION_RIGHT) {
        return 'right';
    }
    return '';
}

/**
 * get a recognizer by name if it is bound to a manager
 * @param {Recognizer|String} otherRecognizer
 * @param {Recognizer} recognizer
 * @returns {Recognizer}
 */
function getRecognizerByNameIfManager(otherRecognizer, recognizer) {
    var manager = recognizer.manager;
    if (manager) {
        return manager.get(otherRecognizer);
    }
    return otherRecognizer;
}

/**
 * This recognizer is just used as a base for the simple attribute recognizers.
 * @constructor
 * @extends Recognizer
 */
function AttrRecognizer() {
    Recognizer.apply(this, arguments);
}

inherit(AttrRecognizer, Recognizer, {
    /**
     * @namespace
     * @memberof AttrRecognizer
     */
    defaults: {
        /**
         * @type {Number}
         * @default 1
         */
        pointers: 1
    },

    /**
     * Used to check if it the recognizer receives valid input, like input.distance > 10.
     * @memberof AttrRecognizer
     * @param {Object} input
     * @returns {Boolean} recognized
     */
    attrTest: function(input) {
        var optionPointers = this.options.pointers;
        return optionPointers === 0 || input.pointers.length === optionPointers;
    },

    /**
     * Process the input and return the state for the recognizer
     * @memberof AttrRecognizer
     * @param {Object} input
     * @returns {*} State
     */
    process: function(input) {
        var state = this.state;
        var eventType = input.eventType;

        var isRecognized = state & (STATE_BEGAN | STATE_CHANGED);
        var isValid = this.attrTest(input);

        // on cancel input and we've recognized before, return STATE_CANCELLED
        if (isRecognized && (eventType & INPUT_CANCEL || !isValid)) {
            return state | STATE_CANCELLED;
        } else if (isRecognized || isValid) {
            if (eventType & INPUT_END) {
                return state | STATE_ENDED;
            } else if (!(state & STATE_BEGAN)) {
                return STATE_BEGAN;
            }
            return state | STATE_CHANGED;
        }
        return STATE_FAILED;
    }
});

/**
 * Pan
 * Recognized when the pointer is down and moved in the allowed direction.
 * @constructor
 * @extends AttrRecognizer
 */
function PanRecognizer() {
    AttrRecognizer.apply(this, arguments);

    this.pX = null;
    this.pY = null;
}

inherit(PanRecognizer, AttrRecognizer, {
    /**
     * @namespace
     * @memberof PanRecognizer
     */
    defaults: {
        event: 'pan',
        threshold: 10,
        pointers: 1,
        direction: DIRECTION_ALL
    },

    getTouchAction: function() {
        var direction = this.options.direction;
        var actions = [];
        if (direction & DIRECTION_HORIZONTAL) {
            actions.push(TOUCH_ACTION_PAN_Y);
        }
        if (direction & DIRECTION_VERTICAL) {
            actions.push(TOUCH_ACTION_PAN_X);
        }
        return actions;
    },

    directionTest: function(input) {
        var options = this.options;
        var hasMoved = true;
        var distance = input.distance;
        var direction = input.direction;
        var x = input.deltaX;
        var y = input.deltaY;

        // lock to axis?
        if (!(direction & options.direction)) {
            if (options.direction & DIRECTION_HORIZONTAL) {
                direction = (x === 0) ? DIRECTION_NONE : (x < 0) ? DIRECTION_LEFT : DIRECTION_RIGHT;
                hasMoved = x != this.pX;
                distance = Math.abs(input.deltaX);
            } else {
                direction = (y === 0) ? DIRECTION_NONE : (y < 0) ? DIRECTION_UP : DIRECTION_DOWN;
                hasMoved = y != this.pY;
                distance = Math.abs(input.deltaY);
            }
        }
        input.direction = direction;
        return hasMoved && distance > options.threshold && direction & options.direction;
    },

    attrTest: function(input) {
        return AttrRecognizer.prototype.attrTest.call(this, input) &&
            (this.state & STATE_BEGAN || (!(this.state & STATE_BEGAN) && this.directionTest(input)));
    },

    emit: function(input) {

        this.pX = input.deltaX;
        this.pY = input.deltaY;

        var direction = directionStr(input.direction);

        if (direction) {
            input.additionalEvent = this.options.event + direction;
        }
        this._super.emit.call(this, input);
    }
});

/**
 * Pinch
 * Recognized when two or more pointers are moving toward (zoom-in) or away from each other (zoom-out).
 * @constructor
 * @extends AttrRecognizer
 */
function PinchRecognizer() {
    AttrRecognizer.apply(this, arguments);
}

inherit(PinchRecognizer, AttrRecognizer, {
    /**
     * @namespace
     * @memberof PinchRecognizer
     */
    defaults: {
        event: 'pinch',
        threshold: 0,
        pointers: 2
    },

    getTouchAction: function() {
        return [TOUCH_ACTION_NONE];
    },

    attrTest: function(input) {
        return this._super.attrTest.call(this, input) &&
            (Math.abs(input.scale - 1) > this.options.threshold || this.state & STATE_BEGAN);
    },

    emit: function(input) {
        if (input.scale !== 1) {
            var inOut = input.scale < 1 ? 'in' : 'out';
            input.additionalEvent = this.options.event + inOut;
        }
        this._super.emit.call(this, input);
    }
});

/**
 * Press
 * Recognized when the pointer is down for x ms without any movement.
 * @constructor
 * @extends Recognizer
 */
function PressRecognizer() {
    Recognizer.apply(this, arguments);

    this._timer = null;
    this._input = null;
}

inherit(PressRecognizer, Recognizer, {
    /**
     * @namespace
     * @memberof PressRecognizer
     */
    defaults: {
        event: 'press',
        pointers: 1,
        time: 251, // minimal time of the pointer to be pressed
        threshold: 9 // a minimal movement is ok, but keep it low
    },

    getTouchAction: function() {
        return [TOUCH_ACTION_AUTO];
    },

    process: function(input) {
        var options = this.options;
        var validPointers = input.pointers.length === options.pointers;
        var validMovement = input.distance < options.threshold;
        var validTime = input.deltaTime > options.time;

        this._input = input;

        // we only allow little movement
        // and we've reached an end event, so a tap is possible
        if (!validMovement || !validPointers || (input.eventType & (INPUT_END | INPUT_CANCEL) && !validTime)) {
            this.reset();
        } else if (input.eventType & INPUT_START) {
            this.reset();
            this._timer = setTimeoutContext(function() {
                this.state = STATE_RECOGNIZED;
                this.tryEmit();
            }, options.time, this);
        } else if (input.eventType & INPUT_END) {
            return STATE_RECOGNIZED;
        }
        return STATE_FAILED;
    },

    reset: function() {
        clearTimeout(this._timer);
    },

    emit: function(input) {
        if (this.state !== STATE_RECOGNIZED) {
            return;
        }

        if (input && (input.eventType & INPUT_END)) {
            this.manager.emit(this.options.event + 'up', input);
        } else {
            this._input.timeStamp = now();
            this.manager.emit(this.options.event, this._input);
        }
    }
});

/**
 * Rotate
 * Recognized when two or more pointer are moving in a circular motion.
 * @constructor
 * @extends AttrRecognizer
 */
function RotateRecognizer() {
    AttrRecognizer.apply(this, arguments);
}

inherit(RotateRecognizer, AttrRecognizer, {
    /**
     * @namespace
     * @memberof RotateRecognizer
     */
    defaults: {
        event: 'rotate',
        threshold: 0,
        pointers: 2
    },

    getTouchAction: function() {
        return [TOUCH_ACTION_NONE];
    },

    attrTest: function(input) {
        return this._super.attrTest.call(this, input) &&
            (Math.abs(input.rotation) > this.options.threshold || this.state & STATE_BEGAN);
    }
});

/**
 * Swipe
 * Recognized when the pointer is moving fast (velocity), with enough distance in the allowed direction.
 * @constructor
 * @extends AttrRecognizer
 */
function SwipeRecognizer() {
    AttrRecognizer.apply(this, arguments);
}

inherit(SwipeRecognizer, AttrRecognizer, {
    /**
     * @namespace
     * @memberof SwipeRecognizer
     */
    defaults: {
        event: 'swipe',
        threshold: 10,
        velocity: 0.3,
        direction: DIRECTION_HORIZONTAL | DIRECTION_VERTICAL,
        pointers: 1
    },

    getTouchAction: function() {
        return PanRecognizer.prototype.getTouchAction.call(this);
    },

    attrTest: function(input) {
        var direction = this.options.direction;
        var velocity;

        if (direction & (DIRECTION_HORIZONTAL | DIRECTION_VERTICAL)) {
            velocity = input.overallVelocity;
        } else if (direction & DIRECTION_HORIZONTAL) {
            velocity = input.overallVelocityX;
        } else if (direction & DIRECTION_VERTICAL) {
            velocity = input.overallVelocityY;
        }

        return this._super.attrTest.call(this, input) &&
            direction & input.offsetDirection &&
            input.distance > this.options.threshold &&
            input.maxPointers == this.options.pointers &&
            abs(velocity) > this.options.velocity && input.eventType & INPUT_END;
    },

    emit: function(input) {
        var direction = directionStr(input.offsetDirection);
        if (direction) {
            this.manager.emit(this.options.event + direction, input);
        }

        this.manager.emit(this.options.event, input);
    }
});

/**
 * A tap is ecognized when the pointer is doing a small tap/click. Multiple taps are recognized if they occur
 * between the given interval and position. The delay option can be used to recognize multi-taps without firing
 * a single tap.
 *
 * The eventData from the emitted event contains the property `tapCount`, which contains the amount of
 * multi-taps being recognized.
 * @constructor
 * @extends Recognizer
 */
function TapRecognizer() {
    Recognizer.apply(this, arguments);

    // previous time and center,
    // used for tap counting
    this.pTime = false;
    this.pCenter = false;

    this._timer = null;
    this._input = null;
    this.count = 0;
}

inherit(TapRecognizer, Recognizer, {
    /**
     * @namespace
     * @memberof PinchRecognizer
     */
    defaults: {
        event: 'tap',
        pointers: 1,
        taps: 1,
        interval: 300, // max time between the multi-tap taps
        time: 250, // max time of the pointer to be down (like finger on the screen)
        threshold: 9, // a minimal movement is ok, but keep it low
        posThreshold: 10 // a multi-tap can be a bit off the initial position
    },

    getTouchAction: function() {
        return [TOUCH_ACTION_MANIPULATION];
    },

    process: function(input) {
        var options = this.options;

        var validPointers = input.pointers.length === options.pointers;
        var validMovement = input.distance < options.threshold;
        var validTouchTime = input.deltaTime < options.time;

        this.reset();

        if ((input.eventType & INPUT_START) && (this.count === 0)) {
            return this.failTimeout();
        }

        // we only allow little movement
        // and we've reached an end event, so a tap is possible
        if (validMovement && validTouchTime && validPointers) {
            if (input.eventType != INPUT_END) {
                return this.failTimeout();
            }

            var validInterval = this.pTime ? (input.timeStamp - this.pTime < options.interval) : true;
            var validMultiTap = !this.pCenter || getDistance(this.pCenter, input.center) < options.posThreshold;

            this.pTime = input.timeStamp;
            this.pCenter = input.center;

            if (!validMultiTap || !validInterval) {
                this.count = 1;
            } else {
                this.count += 1;
            }

            this._input = input;

            // if tap count matches we have recognized it,
            // else it has began recognizing...
            var tapCount = this.count % options.taps;
            if (tapCount === 0) {
                // no failing requirements, immediately trigger the tap event
                // or wait as long as the multitap interval to trigger
                if (!this.hasRequireFailures()) {
                    return STATE_RECOGNIZED;
                } else {
                    this._timer = setTimeoutContext(function() {
                        this.state = STATE_RECOGNIZED;
                        this.tryEmit();
                    }, options.interval, this);
                    return STATE_BEGAN;
                }
            }
        }
        return STATE_FAILED;
    },

    failTimeout: function() {
        this._timer = setTimeoutContext(function() {
            this.state = STATE_FAILED;
        }, this.options.interval, this);
        return STATE_FAILED;
    },

    reset: function() {
        clearTimeout(this._timer);
    },

    emit: function() {
        if (this.state == STATE_RECOGNIZED) {
            this._input.tapCount = this.count;
            this.manager.emit(this.options.event, this._input);
        }
    }
});

/**
 * Simple way to create a manager with a default set of recognizers.
 * @param {HTMLElement} element
 * @param {Object} [options]
 * @constructor
 */
function Hammer(element, options) {
    options = options || {};
    options.recognizers = ifUndefined(options.recognizers, Hammer.defaults.preset);
    return new Manager(element, options);
}

/**
 * @const {string}
 */
Hammer.VERSION = '2.0.8';

/**
 * default settings
 * @namespace
 */
Hammer.defaults = {
    /**
     * set if DOM events are being triggered.
     * But this is slower and unused by simple implementations, so disabled by default.
     * @type {Boolean}
     * @default false
     */
    domEvents: false,

    /**
     * The value for the touchAction property/fallback.
     * When set to `compute` it will magically set the correct value based on the added recognizers.
     * @type {String}
     * @default compute
     */
    touchAction: TOUCH_ACTION_COMPUTE,

    /**
     * @type {Boolean}
     * @default true
     */
    enable: true,

    /**
     * EXPERIMENTAL FEATURE -- can be removed/changed
     * Change the parent input target element.
     * If Null, then it is being set the to main element.
     * @type {Null|EventTarget}
     * @default null
     */
    inputTarget: null,

    /**
     * force an input class
     * @type {Null|Function}
     * @default null
     */
    inputClass: null,

    /**
     * Default recognizer setup when calling `Hammer()`
     * When creating a new Manager these will be skipped.
     * @type {Array}
     */
    preset: [
        // RecognizerClass, options, [recognizeWith, ...], [requireFailure, ...]
        [RotateRecognizer, {enable: false}],
        [PinchRecognizer, {enable: false}, ['rotate']],
        [SwipeRecognizer, {direction: DIRECTION_HORIZONTAL}],
        [PanRecognizer, {direction: DIRECTION_HORIZONTAL}, ['swipe']],
        [TapRecognizer],
        [TapRecognizer, {event: 'doubletap', taps: 2}, ['tap']],
        [PressRecognizer]
    ],

    /**
     * Some CSS properties can be used to improve the working of Hammer.
     * Add them to this method and they will be set when creating a new Manager.
     * @namespace
     */
    cssProps: {
        /**
         * Disables text selection to improve the dragging gesture. Mainly for desktop browsers.
         * @type {String}
         * @default 'none'
         */
        userSelect: 'none',

        /**
         * Disable the Windows Phone grippers when pressing an element.
         * @type {String}
         * @default 'none'
         */
        touchSelect: 'none',

        /**
         * Disables the default callout shown when you touch and hold a touch target.
         * On iOS, when you touch and hold a touch target such as a link, Safari displays
         * a callout containing information about the link. This property allows you to disable that callout.
         * @type {String}
         * @default 'none'
         */
        touchCallout: 'none',

        /**
         * Specifies whether zooming is enabled. Used by IE10>
         * @type {String}
         * @default 'none'
         */
        contentZooming: 'none',

        /**
         * Specifies that an entire element should be draggable instead of its contents. Mainly for desktop browsers.
         * @type {String}
         * @default 'none'
         */
        userDrag: 'none',

        /**
         * Overrides the highlight color shown when the user taps a link or a JavaScript
         * clickable element in iOS. This property obeys the alpha value, if specified.
         * @type {String}
         * @default 'rgba(0,0,0,0)'
         */
        tapHighlightColor: 'rgba(0,0,0,0)'
    }
};

var STOP = 1;
var FORCED_STOP = 2;

/**
 * Manager
 * @param {HTMLElement} element
 * @param {Object} [options]
 * @constructor
 */
function Manager(element, options) {
    this.options = assign({}, Hammer.defaults, options || {});

    this.options.inputTarget = this.options.inputTarget || element;

    this.handlers = {};
    this.session = {};
    this.recognizers = [];
    this.oldCssProps = {};

    this.element = element;
    this.input = createInputInstance(this);
    this.touchAction = new TouchAction(this, this.options.touchAction);

    toggleCssProps(this, true);

    each(this.options.recognizers, function(item) {
        var recognizer = this.add(new (item[0])(item[1]));
        item[2] && recognizer.recognizeWith(item[2]);
        item[3] && recognizer.requireFailure(item[3]);
    }, this);
}

Manager.prototype = {
    /**
     * set options
     * @param {Object} options
     * @returns {Manager}
     */
    set: function(options) {
        assign(this.options, options);

        // Options that need a little more setup
        if (options.touchAction) {
            this.touchAction.update();
        }
        if (options.inputTarget) {
            // Clean up existing event listeners and reinitialize
            this.input.destroy();
            this.input.target = options.inputTarget;
            this.input.init();
        }
        return this;
    },

    /**
     * stop recognizing for this session.
     * This session will be discarded, when a new [input]start event is fired.
     * When forced, the recognizer cycle is stopped immediately.
     * @param {Boolean} [force]
     */
    stop: function(force) {
        this.session.stopped = force ? FORCED_STOP : STOP;
    },

    /**
     * run the recognizers!
     * called by the inputHandler function on every movement of the pointers (touches)
     * it walks through all the recognizers and tries to detect the gesture that is being made
     * @param {Object} inputData
     */
    recognize: function(inputData) {
        var session = this.session;
        if (session.stopped) {
            return;
        }

        // run the touch-action polyfill
        this.touchAction.preventDefaults(inputData);

        var recognizer;
        var recognizers = this.recognizers;

        // this holds the recognizer that is being recognized.
        // so the recognizer's state needs to be BEGAN, CHANGED, ENDED or RECOGNIZED
        // if no recognizer is detecting a thing, it is set to `null`
        var curRecognizer = session.curRecognizer;

        // reset when the last recognizer is recognized
        // or when we're in a new session
        if (!curRecognizer || (curRecognizer && curRecognizer.state & STATE_RECOGNIZED)) {
            curRecognizer = session.curRecognizer = null;
        }

        var i = 0;
        while (i < recognizers.length) {
            recognizer = recognizers[i];

            // find out if we are allowed try to recognize the input for this one.
            // 1.   allow if the session is NOT forced stopped (see the .stop() method)
            // 2.   allow if we still haven't recognized a gesture in this session, or the this recognizer is the one
            //      that is being recognized.
            // 3.   allow if the recognizer is allowed to run simultaneous with the current recognized recognizer.
            //      this can be setup with the `recognizeWith()` method on the recognizer.
            if (session.stopped !== FORCED_STOP && ( // 1
                    !curRecognizer || recognizer == curRecognizer || // 2
                    recognizer.canRecognizeWith(curRecognizer))) { // 3
                recognizer.recognize(inputData);
            } else {
                recognizer.reset();
            }

            // if the recognizer has been recognizing the input as a valid gesture, we want to store this one as the
            // current active recognizer. but only if we don't already have an active recognizer
            if (!curRecognizer && recognizer.state & (STATE_BEGAN | STATE_CHANGED | STATE_ENDED)) {
                curRecognizer = session.curRecognizer = recognizer;
            }
            i++;
        }
    },

    /**
     * get a recognizer by its event name.
     * @param {Recognizer|String} recognizer
     * @returns {Recognizer|Null}
     */
    get: function(recognizer) {
        if (recognizer instanceof Recognizer) {
            return recognizer;
        }

        var recognizers = this.recognizers;
        for (var i = 0; i < recognizers.length; i++) {
            if (recognizers[i].options.event == recognizer) {
                return recognizers[i];
            }
        }
        return null;
    },

    /**
     * add a recognizer to the manager
     * existing recognizers with the same event name will be removed
     * @param {Recognizer} recognizer
     * @returns {Recognizer|Manager}
     */
    add: function(recognizer) {
        if (invokeArrayArg(recognizer, 'add', this)) {
            return this;
        }

        // remove existing
        var existing = this.get(recognizer.options.event);
        if (existing) {
            this.remove(existing);
        }

        this.recognizers.push(recognizer);
        recognizer.manager = this;

        this.touchAction.update();
        return recognizer;
    },

    /**
     * remove a recognizer by name or instance
     * @param {Recognizer|String} recognizer
     * @returns {Manager}
     */
    remove: function(recognizer) {
        if (invokeArrayArg(recognizer, 'remove', this)) {
            return this;
        }

        recognizer = this.get(recognizer);

        // let's make sure this recognizer exists
        if (recognizer) {
            var recognizers = this.recognizers;
            var index = inArray(recognizers, recognizer);

            if (index !== -1) {
                recognizers.splice(index, 1);
                this.touchAction.update();
            }
        }

        return this;
    },

    /**
     * bind event
     * @param {String} events
     * @param {Function} handler
     * @returns {EventEmitter} this
     */
    on: function(events, handler) {
        if (events === undefined) {
            return;
        }
        if (handler === undefined) {
            return;
        }

        var handlers = this.handlers;
        each(splitStr(events), function(event) {
            handlers[event] = handlers[event] || [];
            handlers[event].push(handler);
        });
        return this;
    },

    /**
     * unbind event, leave emit blank to remove all handlers
     * @param {String} events
     * @param {Function} [handler]
     * @returns {EventEmitter} this
     */
    off: function(events, handler) {
        if (events === undefined) {
            return;
        }

        var handlers = this.handlers;
        each(splitStr(events), function(event) {
            if (!handler) {
                delete handlers[event];
            } else {
                handlers[event] && handlers[event].splice(inArray(handlers[event], handler), 1);
            }
        });
        return this;
    },

    /**
     * emit event to the listeners
     * @param {String} event
     * @param {Object} data
     */
    emit: function(event, data) {
        // we also want to trigger dom events
        if (this.options.domEvents) {
            triggerDomEvent(event, data);
        }

        // no handlers, so skip it all
        var handlers = this.handlers[event] && this.handlers[event].slice();
        if (!handlers || !handlers.length) {
            return;
        }

        data.type = event;
        data.preventDefault = function() {
            data.srcEvent.preventDefault();
        };

        var i = 0;
        while (i < handlers.length) {
            handlers[i](data);
            i++;
        }
    },

    /**
     * destroy the manager and unbinds all events
     * it doesn't unbind dom events, that is the user own responsibility
     */
    destroy: function() {
        this.element && toggleCssProps(this, false);

        this.handlers = {};
        this.session = {};
        this.input.destroy();
        this.element = null;
    }
};

/**
 * add/remove the css properties as defined in manager.options.cssProps
 * @param {Manager} manager
 * @param {Boolean} add
 */
function toggleCssProps(manager, add) {
    var element = manager.element;
    if (!element.style) {
        return;
    }
    var prop;
    each(manager.options.cssProps, function(value, name) {
        prop = prefixed(element.style, name);
        if (add) {
            manager.oldCssProps[prop] = element.style[prop];
            element.style[prop] = value;
        } else {
            element.style[prop] = manager.oldCssProps[prop] || '';
        }
    });
    if (!add) {
        manager.oldCssProps = {};
    }
}

/**
 * trigger dom event
 * @param {String} event
 * @param {Object} data
 */
function triggerDomEvent(event, data) {
    var gestureEvent = document.createEvent('Event');
    gestureEvent.initEvent(event, true, true);
    gestureEvent.gesture = data;
    data.target.dispatchEvent(gestureEvent);
}

assign(Hammer, {
    INPUT_START: INPUT_START,
    INPUT_MOVE: INPUT_MOVE,
    INPUT_END: INPUT_END,
    INPUT_CANCEL: INPUT_CANCEL,

    STATE_POSSIBLE: STATE_POSSIBLE,
    STATE_BEGAN: STATE_BEGAN,
    STATE_CHANGED: STATE_CHANGED,
    STATE_ENDED: STATE_ENDED,
    STATE_RECOGNIZED: STATE_RECOGNIZED,
    STATE_CANCELLED: STATE_CANCELLED,
    STATE_FAILED: STATE_FAILED,

    DIRECTION_NONE: DIRECTION_NONE,
    DIRECTION_LEFT: DIRECTION_LEFT,
    DIRECTION_RIGHT: DIRECTION_RIGHT,
    DIRECTION_UP: DIRECTION_UP,
    DIRECTION_DOWN: DIRECTION_DOWN,
    DIRECTION_HORIZONTAL: DIRECTION_HORIZONTAL,
    DIRECTION_VERTICAL: DIRECTION_VERTICAL,
    DIRECTION_ALL: DIRECTION_ALL,

    Manager: Manager,
    Input: Input,
    TouchAction: TouchAction,

    TouchInput: TouchInput,
    MouseInput: MouseInput,
    PointerEventInput: PointerEventInput,
    TouchMouseInput: TouchMouseInput,
    SingleTouchInput: SingleTouchInput,

    Recognizer: Recognizer,
    AttrRecognizer: AttrRecognizer,
    Tap: TapRecognizer,
    Pan: PanRecognizer,
    Swipe: SwipeRecognizer,
    Pinch: PinchRecognizer,
    Rotate: RotateRecognizer,
    Press: PressRecognizer,

    on: addEventListeners,
    off: removeEventListeners,
    each: each,
    merge: merge,
    extend: extend,
    assign: assign,
    inherit: inherit,
    bindFn: bindFn,
    prefixed: prefixed
});

// this prevents errors when Hammer is loaded in the presence of an AMD
//  style loader but by script tag, not by the loader.
var freeGlobal = (typeof window !== 'undefined' ? window : (typeof self !== 'undefined' ? self : {})); // jshint ignore:line
freeGlobal.Hammer = Hammer;

if (typeof define === 'function' && define.amd) {
    define(function() {
        return Hammer;
    });
} else if (typeof module != 'undefined' && module.exports) {
    module.exports = Hammer;
} else {
    window[exportName] = Hammer;
}

})(window, document, 'Hammer');

/**
 * Muuri v0.7.1
 * https://github.com/haltu/muuri
 * Copyright (c) 2015-present, Haltu Oy
 * Released under the MIT license
 * https://github.com/haltu/muuri/blob/master/LICENSE.md
 * @license MIT
 *
 * Muuri Packer
 * Copyright (c) 2016-present, Niklas Rämö <inramo@gmail.com>
 * @license MIT
 *
 * Muuri Ticker / Muuri Emitter / Muuri Queue
 * Copyright (c) 2018-present, Niklas Rämö <inramo@gmail.com>
 * @license MIT
 */

(function (global, factory) {
    if (typeof exports === 'object' && typeof module !== 'undefined') {
      var Hammer;
      try { Hammer = require('hammerjs') } catch (e) {}
      module.exports = factory(Hammer);
    } else {
      global.Muuri = factory(global.Hammer);
    }
  }(this, (function (Hammer) {
    'use strict';
  
    var namespace = 'Muuri';
    var gridInstances = {};
  
    var eventSynchronize = 'synchronize';
    var eventLayoutStart = 'layoutStart';
    var eventLayoutEnd = 'layoutEnd';
    var eventAdd = 'add';
    var eventRemove = 'remove';
    var eventShowStart = 'showStart';
    var eventShowEnd = 'showEnd';
    var eventHideStart = 'hideStart';
    var eventHideEnd = 'hideEnd';
    var eventFilter = 'filter';
    var eventSort = 'sort';
    var eventMove = 'move';
    var eventSend = 'send';
    var eventBeforeSend = 'beforeSend';
    var eventReceive = 'receive';
    var eventBeforeReceive = 'beforeReceive';
    var eventDragInit = 'dragInit';
    var eventDragStart = 'dragStart';
    var eventDragMove = 'dragMove';
    var eventDragScroll = 'dragScroll';
    var eventDragEnd = 'dragEnd';
    var eventDragReleaseStart = 'dragReleaseStart';
    var eventDragReleaseEnd = 'dragReleaseEnd';
    var eventDestroy = 'destroy';
  
    /**
     * Event emitter constructor.
     *
     * @class
     */
    function Emitter() {
      this._events = {};
      this._queue = [];
      this._counter = 0;
      this._isDestroyed = false;
    }
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Bind an event listener.
     *
     * @public
     * @memberof Emitter.prototype
     * @param {String} event
     * @param {Function} listener
     * @returns {Emitter}
     */
    Emitter.prototype.on = function(event, listener) {
      if (this._isDestroyed) return this;
  
      // Get listeners queue and create it if it does not exist.
      var listeners = this._events[event];
      if (!listeners) listeners = this._events[event] = [];
  
      // Add the listener to the queue.
      listeners.push(listener);
  
      return this;
    };
  
    /**
     * Bind an event listener that is triggered only once.
     *
     * @public
     * @memberof Emitter.prototype
     * @param {String} event
     * @param {Function} listener
     * @returns {Emitter}
     */
    Emitter.prototype.once = function(event, listener) {
      if (this._isDestroyed) return this;
  
      var callback = function() {
        this.off(event, callback);
        listener.apply(null, arguments);
      }.bind(this);
  
      return this.on(event, callback);
    };
  
    /**
     * Unbind all event listeners that match the provided listener function.
     *
     * @public
     * @memberof Emitter.prototype
     * @param {String} event
     * @param {Function} [listener]
     * @returns {Emitter}
     */
    Emitter.prototype.off = function(event, listener) {
      if (this._isDestroyed) return this;
  
      // Get listeners and return immediately if none is found.
      var listeners = this._events[event];
      if (!listeners || !listeners.length) return this;
  
      // If no specific listener is provided remove all listeners.
      if (!listener) {
        listeners.length = 0;
        return this;
      }
  
      // Remove all matching listeners.
      var i = listeners.length;
      while (i--) {
        if (listener === listeners[i]) listeners.splice(i, 1);
      }
  
      return this;
    };
  
    /**
     * Emit all listeners in a specified event with the provided arguments.
     *
     * @public
     * @memberof Emitter.prototype
     * @param {String} event
     * @param {*} [arg1]
     * @param {*} [arg2]
     * @param {*} [arg3]
     * @returns {Emitter}
     */
    Emitter.prototype.emit = function(event, arg1, arg2, arg3) {
      if (this._isDestroyed) return this;
  
      // Get event listeners and quit early if there's no listeners.
      var listeners = this._events[event];
      if (!listeners || !listeners.length) return this;
  
      var queue = this._queue;
      var qLength = queue.length;
      var aLength = arguments.length - 1;
      var i;
  
      // Add the current listeners to the callback queue before we process them.
      // This is necessary to guarantee that all of the listeners are called in
      // correct order even if new event listeners are removed/added during
      // processing and/or events are emitted during processing.
      for (i = 0; i < listeners.length; i++) {
        queue.push(listeners[i]);
      }
  
      // Increment queue counter. This is needed for the scenarios where emit is
      // triggered while the queue is already processing. We need to keep track of
      // how many "queue processors" there are active so that we can safely reset
      // the queue in the end when the last queue processor is finished.
      ++this._counter;
  
      // Process the queue (the specific part of it for this emit).
      for (i = qLength, qLength = queue.length; i < qLength; i++) {
        // prettier-ignore
        aLength === 0 ? queue[i]() :
        aLength === 1 ? queue[i](arg1) :
        aLength === 2 ? queue[i](arg1, arg2) :
                        queue[i](arg1, arg2, arg3);
  
        // Stop processing if the emitter is destroyed.
        if (this._isDestroyed) return this;
      }
  
      // Decrement queue process counter.
      --this._counter;
  
      // Reset the queue if there are no more queue processes running.
      if (!this._counter) queue.length = 0;
  
      return this;
    };
  
    /**
     * Destroy emitter instance. Basically just removes all bound listeners.
     *
     * @public
     * @memberof Emitter.prototype
     * @returns {Emitter}
     */
    Emitter.prototype.destroy = function() {
      if (this._isDestroyed) return this;
  
      var events = this._events;
      var event;
  
      // Flag as destroyed.
      this._isDestroyed = true;
  
      // Reset queue (if queue is currently processing this will also stop that).
      this._queue.length = this._counter = 0;
  
      // Remove all listeners.
      for (event in events) {
        if (events[event]) {
          events[event].length = 0;
          events[event] = undefined;
        }
      }
  
      return this;
    };
  
    // Set up the default export values.
    var isTransformSupported = false;
    var transformStyle = 'transform';
    var transformProp = 'transform';
  
    // Find the supported transform prop and style names.
    var style = 'transform';
    var styleCap = 'Transform';
    ['', 'Webkit', 'Moz', 'O', 'ms'].forEach(function(prefix) {
      if (isTransformSupported) return;
      var propName = prefix ? prefix + styleCap : style;
      if (document.documentElement.style[propName] !== undefined) {
        prefix = prefix.toLowerCase();
        transformStyle = prefix ? '-' + prefix + '-' + style : style;
        transformProp = propName;
        isTransformSupported = true;
      }
    });
  
    var stylesCache = typeof WeakMap === 'function' ? new WeakMap() : null;
  
    /**
     * Returns the computed value of an element's style property as a string.
     *
     * @param {HTMLElement} element
     * @param {String} style
     * @returns {String}
     */
    function getStyle(element, style) {
      var styles = stylesCache && stylesCache.get(element);
      if (!styles) {
        styles = window.getComputedStyle(element, null);
        stylesCache && stylesCache.set(element, styles);
      }
      return styles.getPropertyValue(style === 'transform' ? transformStyle : style);
    }
  
    var styleNameRegEx = /([A-Z])/g;
  
    /**
     * Transforms a camel case style property to kebab case style property.
     *
     * @param {String} string
     * @returns {String}
     */
    function getStyleName(string) {
      return string.replace(styleNameRegEx, '-$1').toLowerCase();
    }
  
    /**
     * Set inline styles to an element.
     *
     * @param {HTMLElement} element
     * @param {Object} styles
     */
    function setStyles(element, styles) {
      for (var prop in styles) {
        element.style[prop === 'transform' ? transformProp : prop] = styles[prop];
      }
    }
  
    /**
     * Item animation handler powered by Web Animations API.
     *
     * @class
     * @param {HTMLElement} element
     */
    function ItemAnimate(element) {
      this._element = element;
      this._animation = null;
      this._callback = null;
      this._props = [];
      this._values = [];
      this._keyframes = [];
      this._options = {};
      this._isDestroyed = false;
      this._onFinish = this._onFinish.bind(this);
    }
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Start instance's animation. Automatically stops current animation if it is
     * running.
     *
     * @public
     * @memberof ItemAnimate.prototype
     * @param {Object} propsFrom
     * @param {Object} propsTo
     * @param {Object} [options]
     * @param {Number} [options.duration=300]
     * @param {String} [options.easing='ease']
     * @param {Function} [options.onFinish]
     */
    ItemAnimate.prototype.start = function(propsFrom, propsTo, options) {
      if (this._isDestroyed) return;
  
      var animation = this._animation;
      var currentProps = this._props;
      var currentValues = this._values;
      var opts = options || 0;
      var cancelAnimation = false;
  
      // If we have an existing animation running, let's check if it needs to be
      // cancelled or if it can continue running.
      if (animation) {
        var propCount = 0;
        var propIndex;
  
        // Check if the requested animation target props and values match with the
        // current props and values.
        for (var propName in propsTo) {
          ++propCount;
          propIndex = currentProps.indexOf(propName);
          if (propIndex === -1 || propsTo[propName] !== currentValues[propIndex]) {
            cancelAnimation = true;
            break;
          }
        }
  
        // Check if the target props count matches current props count. This is
        // needed for the edge case scenario where target props contain the same
        // styles as current props, but the current props have some additional
        // props.
        if (!cancelAnimation && propCount !== currentProps.length) {
          cancelAnimation = true;
        }
      }
  
      // Cancel animation (if required).
      if (cancelAnimation) animation.cancel();
  
      // Store animation callback.
      this._callback = typeof opts.onFinish === 'function' ? opts.onFinish : null;
  
      // If we have a running animation that does not need to be cancelled, let's
      // call it a day here and let it run.
      if (animation && !cancelAnimation) return;
  
      // Store target props and values to instance.
      currentProps.length = currentValues.length = 0;
      for (propName in propsTo) {
        currentProps.push(propName);
        currentValues.push(propsTo[propName]);
      }
  
      // Set up keyframes.
      var animKeyframes = this._keyframes;
      animKeyframes[0] = propsFrom;
      animKeyframes[1] = propsTo;
  
      // Set up options.
      var animOptions = this._options;
      animOptions.duration = opts.duration || 300;
      animOptions.easing = opts.easing || 'ease';
  
      // Start the animation
      var element = this._element;
      animation = element.animate(animKeyframes, animOptions);
      animation.onfinish = this._onFinish;
      this._animation = animation;
  
      // Set the end styles. This makes sure that the element stays at the end
      // values after animation is finished.
      setStyles(element, propsTo);
    };
  
    /**
     * Stop instance's current animation if running.
     *
     * @public
     * @memberof ItemAnimate.prototype
     * @param {Object} [styles]
     */
    ItemAnimate.prototype.stop = function(styles) {
      if (this._isDestroyed || !this._animation) return;
  
      var element = this._element;
      var currentProps = this._props;
      var currentValues = this._values;
      var propName;
      var propValue;
      var i;
  
      // Calculate (if not provided) and set styles.
      if (!styles) {
        for (i = 0; i < currentProps.length; i++) {
          propName = currentProps[i];
          propValue = getStyle(element, getStyleName(propName));
          element.style[propName === 'transform' ? transformProp : propName] = propValue;
        }
      } else {
        setStyles(element, styles);
      }
  
      //  Cancel animation.
      this._animation.cancel();
      this._animation = this._callback = null;
  
      // Reset current props and values.
      currentProps.length = currentValues.length = 0;
    };
  
    /**
     * Check if the item is being animated currently.
     *
     * @public
     * @memberof ItemAnimate.prototype
     * @return {Boolean}
     */
    ItemAnimate.prototype.isAnimating = function() {
      return !!this._animation;
    };
  
    /**
     * Destroy the instance and stop current animation if it is running.
     *
     * @public
     * @memberof ItemAnimate.prototype
     */
    ItemAnimate.prototype.destroy = function() {
      if (this._isDestroyed) return;
      this.stop();
      this._element = this._options = this._keyframes = null;
      this._isDestroyed = true;
    };
  
    /**
     * Private prototype methods
     * *************************
     */
  
    /**
     * Animation end handler.
     *
     * @private
     * @memberof ItemAnimate.prototype
     */
    ItemAnimate.prototype._onFinish = function() {
      var callback = this._callback;
      this._animation = this._callback = null;
      this._props.length = this._values.length = 0;
      callback && callback();
    };
  
    var raf = (
      window.requestAnimationFrame ||
      window.webkitRequestAnimationFrame ||
      window.mozRequestAnimationFrame ||
      window.msRequestAnimationFrame ||
      rafFallback
    ).bind(window);
  
    function rafFallback(cb) {
      return window.setTimeout(cb, 16);
    }
  
    /**
     * A ticker system for handling DOM reads and writes in an efficient way.
     * Contains a read queue and a write queue that are processed on the next
     * animation frame when needed.
     *
     * @class
     */
    function Ticker() {
      this._nextTick = null;
  
      this._queue = [];
      this._reads = {};
      this._writes = {};
  
      this._batch = [];
      this._batchReads = {};
      this._batchWrites = {};
  
      this._flush = this._flush.bind(this);
    }
  
    Ticker.prototype.add = function(id, readCallback, writeCallback, isImportant) {
      // First, let's check if an item has been added to the queues with the same id
      // and if so -> remove it.
      var currentIndex = this._queue.indexOf(id);
      if (currentIndex > -1) this._queue[currentIndex] = undefined;
  
      // Add all important callbacks to the beginning of the queue and other
      // callbacks to the end of the queue.
      isImportant ? this._queue.unshift(id) : this._queue.push(id);
  
      // Store callbacks.
      this._reads[id] = readCallback;
      this._writes[id] = writeCallback;
  
      // Finally, let's kick-start the next tick if it is not running yet.
      if (!this._nextTick) this._nextTick = raf(this._flush);
    };
  
    Ticker.prototype.cancel = function(id) {
      var currentIndex = this._queue.indexOf(id);
      if (currentIndex > -1) {
        this._queue[currentIndex] = undefined;
        this._reads[id] = undefined;
        this._writes[id] = undefined;
      }
    };
  
    Ticker.prototype._flush = function() {
      var queue = this._queue;
      var reads = this._reads;
      var writes = this._writes;
      var batch = this._batch;
      var batchReads = this._batchReads;
      var batchWrites = this._batchWrites;
      var length = queue.length;
      var id;
      var i;
  
      // Reset ticker.
      this._nextTick = null;
  
      // Setup queues and callback placeholders.
      for (i = 0; i < length; i++) {
        id = queue[i];
        if (!id) continue;
  
        batch.push(id);
  
        batchReads[id] = reads[id];
        reads[id] = undefined;
  
        batchWrites[id] = writes[id];
        writes[id] = undefined;
      }
  
      // Reset queue.
      queue.length = 0;
  
      // Process read callbacks.
      for (i = 0; i < length; i++) {
        id = batch[i];
        if (batchReads[id]) {
          batchReads[id]();
          batchReads[id] = undefined;
        }
      }
  
      // Process write callbacks.
      for (i = 0; i < length; i++) {
        id = batch[i];
        if (batchWrites[id]) {
          batchWrites[id]();
          batchWrites[id] = undefined;
        }
      }
  
      // Reset batch.
      batch.length = 0;
  
      // Restart the ticker if needed.
      if (!this._nextTick && queue.length) {
        this._nextTick = raf(this._flush);
      }
    };
  
    var ticker = new Ticker();
  
    var layoutTick = 'layout';
    var visibilityTick = 'visibility';
    var moveTick = 'move';
    var scrollTick = 'scroll';
  
    function addLayoutTick(itemId, readCallback, writeCallback) {
      return ticker.add(itemId + layoutTick, readCallback, writeCallback);
    }
  
    function cancelLayoutTick(itemId) {
      return ticker.cancel(itemId + layoutTick);
    }
  
    function addVisibilityTick(itemId, readCallback, writeCallback) {
      return ticker.add(itemId + visibilityTick, readCallback, writeCallback);
    }
  
    function cancelVisibilityTick(itemId) {
      return ticker.cancel(itemId + visibilityTick);
    }
  
    function addMoveTick(itemId, readCallback, writeCallback) {
      return ticker.add(itemId + moveTick, readCallback, writeCallback, true);
    }
  
    function cancelMoveTick(itemId) {
      return ticker.cancel(itemId + moveTick);
    }
  
    function addScrollTick(itemId, readCallback, writeCallback) {
      return ticker.add(itemId + scrollTick, readCallback, writeCallback, true);
    }
  
    function cancelScrollTick(itemId) {
      return ticker.cancel(itemId + scrollTick);
    }
  
    var proto = Element.prototype;
    var matches =
      proto.matches ||
      proto.matchesSelector ||
      proto.webkitMatchesSelector ||
      proto.mozMatchesSelector ||
      proto.msMatchesSelector ||
      proto.oMatchesSelector;
  
    /**
     * Check if element matches a CSS selector.
     *
     * @param {*} val
     * @returns {Boolean}
     */
    function elementMatches(el, selector) {
      return matches.call(el, selector);
    }
  
    /**
     * Add class to an element.
     *
     * @param {HTMLElement} element
     * @param {String} className
     */
    function addClassModern(element, className) {
      element.classList.add(className);
    }
  
    /**
     * Add class to an element (legacy version, for IE9 support).
     *
     * @param {HTMLElement} element
     * @param {String} className
     */
    function addClassLegacy(element, className) {
      if (!elementMatches(element, '.' + className)) {
        element.className += ' ' + className;
      }
    }
  
    var addClass = ('classList' in Element.prototype ? addClassModern : addClassLegacy);
  
    /**
     * Normalize array index. Basically this function makes sure that the provided
     * array index is within the bounds of the provided array and also transforms
     * negative index to the matching positive index.
     *
     * @param {Array} array
     * @param {Number} index
     * @param {Boolean} isMigration
     */
    function normalizeArrayIndex(array, index, isMigration) {
      var length = array.length;
      var maxIndex = Math.max(0, isMigration ? length : length - 1);
      return index > maxIndex ? maxIndex : index < 0 ? Math.max(maxIndex + index + 1, 0) : index;
    }
  
    /**
     * Move array item to another index.
     *
     * @param {Array} array
     * @param {Number} fromIndex
     *   - Index (positive or negative) of the item that will be moved.
     * @param {Number} toIndex
     *   - Index (positive or negative) where the item should be moved to.
     */
    function arrayMove(array, fromIndex, toIndex) {
      // Make sure the array has two or more items.
      if (array.length < 2) return;
  
      // Normalize the indices.
      var from = normalizeArrayIndex(array, fromIndex);
      var to = normalizeArrayIndex(array, toIndex);
  
      // Add target item to the new position.
      if (from !== to) {
        array.splice(to, 0, array.splice(from, 1)[0]);
      }
    }
  
    /**
     * Swap array items.
     *
     * @param {Array} array
     * @param {Number} index
     *   - Index (positive or negative) of the item that will be swapped.
     * @param {Number} withIndex
     *   - Index (positive or negative) of the other item that will be swapped.
     */
    function arraySwap(array, index, withIndex) {
      // Make sure the array has two or more items.
      if (array.length < 2) return;
  
      // Normalize the indices.
      var indexA = normalizeArrayIndex(array, index);
      var indexB = normalizeArrayIndex(array, withIndex);
      var temp;
  
      // Swap the items.
      if (indexA !== indexB) {
        temp = array[indexA];
        array[indexA] = array[indexB];
        array[indexB] = temp;
      }
    }
  
    var actionCancel = 'cancel';
    var actionFinish = 'finish';
  
    /**
     * Returns a function, that, as long as it continues to be invoked, will not
     * be triggered. The function will be called after it stops being called for
     * N milliseconds. The returned function accepts one argument which, when
     * being "finish", calls the debounce function immediately if it is currently
     * waiting to be called, and when being "cancel" cancels the currently queued
     * function call.
     *
     * @param {Function} fn
     * @param {Number} wait
     * @returns {Function}
     */
    function debounce(fn, wait) {
      var timeout;
  
      if (wait > 0) {
        return function(action) {
          if (timeout !== undefined) {
            timeout = window.clearTimeout(timeout);
            if (action === actionFinish) fn();
          }
  
          if (action !== actionCancel && action !== actionFinish) {
            timeout = window.setTimeout(function() {
              timeout = undefined;
              fn();
            }, wait);
          }
        };
      }
  
      return function(action) {
        if (action !== actionCancel) fn();
      };
    }
  
    /**
     * Returns true if element is transformed, false if not. In practice the
     * element's display value must be anything else than "none" or "inline" as
     * well as have a valid transform value applied in order to be counted as a
     * transformed element.
     *
     * Borrowed from Mezr (v0.6.1):
     * https://github.com/niklasramo/mezr/blob/0.6.1/mezr.js#L661
     *
     * @param {HTMLElement} element
     * @returns {Boolean}
     */
    function isTransformed(element) {
      var transform = getStyle(element, 'transform');
      if (!transform || transform === 'none') return false;
  
      var display = getStyle(element, 'display');
      if (display === 'inline' || display === 'none') return false;
  
      return true;
    }
  
    /**
     * Returns an absolute positioned element's containing block, which is
     * considered to be the closest ancestor element that the target element's
     * positioning is relative to. Disclaimer: this only works as intended for
     * absolute positioned elements.
     *
     * @param {HTMLElement} element
     * @param {Boolean} [includeSelf=false]
     *   - When this is set to true the containing block checking is started from
     *     the provided element. Otherwise the checking is started from the
     *     provided element's parent element.
     * @returns {(Document|Element)}
     */
    function getContainingBlock(element, includeSelf) {
      // As long as the containing block is an element, static and not
      // transformed, try to get the element's parent element and fallback to
      // document. https://github.com/niklasramo/mezr/blob/0.6.1/mezr.js#L339
      var ret = (includeSelf ? element : element.parentElement) || document;
      while (ret && ret !== document && getStyle(ret, 'position') === 'static' && !isTransformed(ret)) {
        ret = ret.parentElement || document;
      }
      return ret;
    }
  
    /**
     * Returns the computed value of an element's style property transformed into
     * a float value.
     *
     * @param {HTMLElement} el
     * @param {String} style
     * @returns {Number}
     */
    function getStyleAsFloat(el, style) {
      return parseFloat(getStyle(el, style)) || 0;
    }
  
    var offsetA = {};
    var offsetB = {};
    var offsetDiff = {};
  
    /**
     * Returns the element's document offset, which in practice means the vertical
     * and horizontal distance between the element's northwest corner and the
     * document's northwest corner. Note that this function always returns the same
     * object so be sure to read the data from it instead using it as a reference.
     *
     * @param {(Document|Element|Window)} element
     * @param {Object} [offsetData]
     *   - Optional data object where the offset data will be inserted to. If not
     *     provided a new object will be created for the return data.
     * @returns {Object}
     */
    function getOffset(element, offsetData) {
      var ret = offsetData || {};
      var rect;
  
      // Set up return data.
      ret.left = 0;
      ret.top = 0;
  
      // Document's offsets are always 0.
      if (element === document) return ret;
  
      // Add viewport scroll left/top to the respective offsets.
      ret.left = window.pageXOffset || 0;
      ret.top = window.pageYOffset || 0;
  
      // Window's offsets are the viewport scroll left/top values.
      if (element.self === window.self) return ret;
  
      // Add element's client rects to the offsets.
      rect = element.getBoundingClientRect();
      ret.left += rect.left;
      ret.top += rect.top;
  
      // Exclude element's borders from the offset.
      ret.left += getStyleAsFloat(element, 'border-left-width');
      ret.top += getStyleAsFloat(element, 'border-top-width');
  
      return ret;
    }
  
    /**
     * Calculate the offset difference two elements.
     *
     * @param {HTMLElement} elemA
     * @param {HTMLElement} elemB
     * @param {Boolean} [compareContainingBlocks=false]
     *   - When this is set to true the containing blocks of the provided elements
     *     will be used for calculating the difference. Otherwise the provided
     *     elements will be compared directly.
     * @returns {Object}
     */
    function getOffsetDiff(elemA, elemB, compareContainingBlocks) {
      offsetDiff.left = 0;
      offsetDiff.top = 0;
  
      // If elements are same let's return early.
      if (elemA === elemB) return offsetDiff;
  
      // Compare containing blocks if necessary.
      if (compareContainingBlocks) {
        elemA = getContainingBlock(elemA, true);
        elemB = getContainingBlock(elemB, true);
  
        // If containing blocks are identical, let's return early.
        if (elemA === elemB) return offsetDiff;
      }
  
      // Finally, let's calculate the offset diff.
      getOffset(elemA, offsetA);
      getOffset(elemB, offsetB);
      offsetDiff.left = offsetB.left - offsetA.left;
      offsetDiff.top = offsetB.top - offsetA.top;
  
      return offsetDiff;
    }
  
    var translateData = {};
  
    /**
     * Returns the element's computed translateX and translateY values as a floats.
     * The returned object is always the same object and updated every time this
     * function is called.
     *
     * @param {HTMLElement} element
     * @returns {Object}
     */
    function getTranslate(element) {
      translateData.x = 0;
      translateData.y = 0;
  
      var transform = getStyle(element, 'transform');
      if (!transform) return translateData;
  
      var matrixData = transform.replace('matrix(', '').split(',');
      translateData.x = parseFloat(matrixData[4]) || 0;
      translateData.y = parseFloat(matrixData[5]) || 0;
  
      return translateData;
    }
  
    /**
     * Transform translateX and translateY value into CSS transform style
     * property's value.
     *
     * @param {Number} x
     * @param {Number} y
     * @returns {String}
     */
    function getTranslateString(x, y) {
      return 'translateX(' + x + 'px) translateY(' + y + 'px)';
    }
  
    var tempArray = [];
  
    /**
     * Insert an item or an array of items to array to a specified index. Mutates
     * the array. The index can be negative in which case the items will be added
     * to the end of the array.
     *
     * @param {Array} array
     * @param {*} items
     * @param {Number} [index=-1]
     */
    function arrayInsert(array, items, index) {
      var startIndex = typeof index === 'number' ? index : -1;
      if (startIndex < 0) startIndex = array.length - startIndex + 1;
  
      array.splice.apply(array, tempArray.concat(startIndex, 0, items));
      tempArray.length = 0;
    }
  
    var objectType = '[object Object]';
    var toString = Object.prototype.toString;
  
    /**
     * Check if a value is a plain object.
     *
     * @param {*} val
     * @returns {Boolean}
     */
    function isPlainObject(val) {
      return typeof val === 'object' && toString.call(val) === objectType;
    }
  
    /**
     * Remove class from an element.
     *
     * @param {HTMLElement} element
     * @param {String} className
     */
    function removeClassModern(element, className) {
      element.classList.remove(className);
    }
  
    /**
     * Remove class from an element (legacy version, for IE9 support).
     *
     * @param {HTMLElement} element
     * @param {String} className
     */
    function removeClassLegacy(element, className) {
      if (elementMatches(element, '.' + className)) {
        element.className = (' ' + element.className + ' ').replace(' ' + className + ' ', ' ').trim();
      }
    }
  
    var removeClass = ('classList' in Element.prototype ? removeClassModern : removeClassLegacy);
  
    // To provide consistently correct dragging experience we need to know if
    // transformed elements leak fixed elements or not.
    var hasTransformLeak = checkTransformLeak();
  
    // Drag start predicate states.
    var startPredicateInactive = 0;
    var startPredicatePending = 1;
    var startPredicateResolved = 2;
    var startPredicateRejected = 3;
  
    /**
     * Bind Hammer touch interaction to an item.
     *
     * @class
     * @param {Item} item
     */
    function ItemDrag(item) {
      if (!Hammer) {
        throw new Error('[' + namespace + '] required dependency Hammer is not defined.');
      }
  
      // If we don't have a valid transform leak test result yet, let's run the
      // test on first ItemDrag init. The test needs body element to be ready and
      // here we can be sure that it is ready.
      if (hasTransformLeak === null) {
        hasTransformLeak = checkTransformLeak();
      }
  
      var drag = this;
      var element = item._element;
      var grid = item.getGrid();
      var settings = grid._settings;
      var hammer;
  
      // Start predicate private data.
      var startPredicate =
        typeof settings.dragStartPredicate === 'function'
          ? settings.dragStartPredicate
          : ItemDrag.defaultStartPredicate;
      var startPredicateState = startPredicateInactive;
      var startPredicateResult;
  
      // Protected data.
      this._item = item;
      this._gridId = grid._id;
      this._hammer = hammer = new Hammer.Manager(element);
      this._isDestroyed = false;
      this._isMigrating = false;
  
      // Setup item's initial drag data.
      this._reset();
  
      // Bind some methods that needs binding.
      this._onScroll = this._onScroll.bind(this);
      this._prepareMove = this._prepareMove.bind(this);
      this._applyMove = this._applyMove.bind(this);
      this._prepareScroll = this._prepareScroll.bind(this);
      this._applyScroll = this._applyScroll.bind(this);
      this._checkOverlap = this._checkOverlap.bind(this);
  
      // Create a private drag start resolver that can be used to resolve the drag
      // start predicate asynchronously.
      this._forceResolveStartPredicate = function(event) {
        if (!this._isDestroyed && startPredicateState === startPredicatePending) {
          startPredicateState = startPredicateResolved;
          this._onStart(event);
        }
      };
  
      // Create debounce overlap checker function.
      this._checkOverlapDebounce = debounce(this._checkOverlap, settings.dragSortInterval);
  
      // Add drag recognizer to hammer.
      hammer.add(
        new Hammer.Pan({
          event: 'drag',
          pointers: 1,
          threshold: 0,
          direction: Hammer.DIRECTION_ALL
        })
      );
  
      // Add drag init recognizer to hammer.
      hammer.add(
        new Hammer.Press({
          event: 'draginit',
          pointers: 1,
          threshold: 1000,
          time: 0
        })
      );
  
      // Configure the hammer instance.
      if (isPlainObject(settings.dragHammerSettings)) {
        hammer.set(settings.dragHammerSettings);
      }
  
      // Bind drag events.
      hammer
        .on('draginit dragstart dragmove', function(e) {
          // Let's activate drag start predicate state.
          if (startPredicateState === startPredicateInactive) {
            startPredicateState = startPredicatePending;
          }
  
          // If predicate is pending try to resolve it.
          if (startPredicateState === startPredicatePending) {
            startPredicateResult = startPredicate(drag._item, e);
            if (startPredicateResult === true) {
              startPredicateState = startPredicateResolved;
              drag._onStart(e);
            } else if (startPredicateResult === false) {
              startPredicateState = startPredicateRejected;
            }
          }
  
          // Otherwise if predicate is resolved and drag is active, move the item.
          else if (startPredicateState === startPredicateResolved && drag._isActive) {
            drag._onMove(e);
          }
        })
        .on('dragend dragcancel draginitup', function(e) {
          // Check if the start predicate was resolved during drag.
          var isResolved = startPredicateState === startPredicateResolved;
  
          // Do final predicate check to allow user to unbind stuff for the current
          // drag procedure within the predicate callback. The return value of this
          // check will have no effect to the state of the predicate.
          startPredicate(drag._item, e);
  
          // Reset start predicate state.
          startPredicateState = startPredicateInactive;
  
          // If predicate is resolved and dragging is active, call the end handler.
          if (isResolved && drag._isActive) drag._onEnd(e);
        });
  
      // Prevent native link/image dragging for the item and it's ancestors.
      element.addEventListener('dragstart', preventDefault, false);
    }
  
    /**
     * Public static methods
     * *********************
     */
  
    /**
     * Default drag start predicate handler that handles anchor elements
     * gracefully. The return value of this function defines if the drag is
     * started, rejected or pending. When true is returned the dragging is started
     * and when false is returned the dragging is rejected. If nothing is returned
     * the predicate will be called again on the next drag movement.
     *
     * @public
     * @memberof ItemDrag
     * @param {Item} item
     * @param {Object} event
     * @param {Object} [options]
     *   - An optional options object which can be used to pass the predicate
     *     it's options manually. By default the predicate retrieves the options
     *     from the grid's settings.
     * @returns {Boolean}
     */
    ItemDrag.defaultStartPredicate = function(item, event, options) {
      var drag = item._drag;
      var predicate = drag._startPredicateData || drag._setupStartPredicate(options);
  
      // Final event logic. At this stage return value does not matter anymore,
      // the predicate is either resolved or it's not and there's nothing to do
      // about it. Here we just reset data and if the item element is a link
      // we follow it (if there has only been slight movement).
      if (event.isFinal) {
        drag._finishStartPredicate(event);
        return;
      }
  
      // Find and store the handle element so we can check later on if the
      // cursor is within the handle. If we have a handle selector let's find
      // the corresponding element. Otherwise let's use the item element as the
      // handle.
      if (!predicate.handleElement) {
        predicate.handleElement = drag._getStartPredicateHandle(event);
        if (!predicate.handleElement) return false;
      }
  
      // If delay is defined let's keep track of the latest event and initiate
      // delay if it has not been done yet.
      if (predicate.delay) {
        predicate.event = event;
        if (!predicate.delayTimer) {
          predicate.delayTimer = window.setTimeout(function() {
            predicate.delay = 0;
            if (drag._resolveStartPredicate(predicate.event)) {
              drag._forceResolveStartPredicate(predicate.event);
              drag._resetStartPredicate();
            }
          }, predicate.delay);
        }
      }
  
      return drag._resolveStartPredicate(event);
    };
  
    /**
     * Default drag sort predicate.
     *
     * @public
     * @memberof ItemDrag
     * @param {Item} item
     * @param {Object} [options]
     * @param {Number} [options.threshold=50]
     * @param {String} [options.action='move']
     * @returns {(Boolean|DragSortCommand)}
     *   - Returns false if no valid index was found. Otherwise returns drag sort
     *     command.
     */
    ItemDrag.defaultSortPredicate = (function() {
      var itemRect = {};
      var targetRect = {};
      var returnData = {};
      var rootGridArray = [];
  
      function getTargetGrid(item, rootGrid, threshold) {
        var target = null;
        var dragSort = rootGrid._settings.dragSort;
        var bestScore = -1;
        var gridScore;
        var grids;
        var grid;
        var i;
  
        // Get potential target grids.
        if (dragSort === true) {
          rootGridArray[0] = rootGrid;
          grids = rootGridArray;
        } else {
          grids = dragSort.call(rootGrid, item);
        }
  
        // Return immediately if there are no grids.
        if (!Array.isArray(grids)) return target;
  
        // Loop through the grids and get the best match.
        for (i = 0; i < grids.length; i++) {
          grid = grids[i];
  
          // Filter out all destroyed grids.
          if (grid._isDestroyed) continue;
  
          // We need to update the grid's offsets and dimensions since they might
          // have changed (e.g during scrolling).
          grid._updateBoundingRect();
  
          // Check how much dragged element overlaps the container element.
          targetRect.width = grid._width;
          targetRect.height = grid._height;
          targetRect.left = grid._left;
          targetRect.top = grid._top;
          gridScore = getRectOverlapScore(itemRect, targetRect);
  
          // Check if this grid is the best match so far.
          if (gridScore > threshold && gridScore > bestScore) {
            bestScore = gridScore;
            target = grid;
          }
        }
  
        // Always reset root grid array.
        rootGridArray.length = 0;
  
        return target;
      }
  
      return function(item, options) {
        var drag = item._drag;
        var rootGrid = drag._getGrid();
  
        // Get drag sort predicate settings.
        var sortThreshold = options && typeof options.threshold === 'number' ? options.threshold : 50;
        var sortAction = options && options.action === 'swap' ? 'swap' : 'move';
  
        // Populate item rect data.
        itemRect.width = item._width;
        itemRect.height = item._height;
        itemRect.left = drag._elementClientX;
        itemRect.top = drag._elementClientY;
  
        // Calculate the target grid.
        var grid = getTargetGrid(item, rootGrid, sortThreshold);
  
        // Return early if we found no grid container element that overlaps the
        // dragged item enough.
        if (!grid) return false;
  
        var gridOffsetLeft = 0;
        var gridOffsetTop = 0;
        var matchScore = -1;
        var matchIndex;
        var hasValidTargets;
        var target;
        var score;
        var i;
  
        // If item is moved within it's originating grid adjust item's left and
        // top props. Otherwise if item is moved to/within another grid get the
        // container element's offset (from the element's content edge).
        if (grid === rootGrid) {
          itemRect.left = drag._gridX + item._marginLeft;
          itemRect.top = drag._gridY + item._marginTop;
        } else {
          grid._updateBorders(1, 0, 1, 0);
          gridOffsetLeft = grid._left + grid._borderLeft;
          gridOffsetTop = grid._top + grid._borderTop;
        }
  
        // Loop through the target grid items and try to find the best match.
        for (i = 0; i < grid._items.length; i++) {
          target = grid._items[i];
  
          // If the target item is not active or the target item is the dragged
          // item let's skip to the next item.
          if (!target._isActive || target === item) {
            continue;
          }
  
          // Mark the grid as having valid target items.
          hasValidTargets = true;
  
          // Calculate the target's overlap score with the dragged item.
          targetRect.width = target._width;
          targetRect.height = target._height;
          targetRect.left = target._left + target._marginLeft + gridOffsetLeft;
          targetRect.top = target._top + target._marginTop + gridOffsetTop;
          score = getRectOverlapScore(itemRect, targetRect);
  
          // Update best match index and score if the target's overlap score with
          // the dragged item is higher than the current best match score.
          if (score > matchScore) {
            matchIndex = i;
            matchScore = score;
          }
        }
  
        // If there is no valid match and the item is being moved into another
        // grid.
        if (matchScore < sortThreshold && item.getGrid() !== grid) {
          matchIndex = hasValidTargets ? -1 : 0;
          matchScore = Infinity;
        }
  
        // Check if the best match overlaps enough to justify a placement switch.
        if (matchScore >= sortThreshold) {
          returnData.grid = grid;
          returnData.index = matchIndex;
          returnData.action = sortAction;
          return returnData;
        }
  
        return false;
      };
    })();
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Abort dragging and reset drag data.
     *
     * @public
     * @memberof ItemDrag.prototype
     * @returns {ItemDrag}
     */
    ItemDrag.prototype.stop = function() {
      var item = this._item;
      var element = item._element;
      var grid = this._getGrid();
  
      if (!this._isActive) return this;
  
      // If the item is being dropped into another grid, finish it up and return
      // immediately.
      if (this._isMigrating) {
        this._finishMigration();
        return this;
      }
  
      // Cancel queued move and scroll ticks.
      cancelMoveTick(item._id);
      cancelScrollTick(item._id);
  
      // Remove scroll listeners.
      this._unbindScrollListeners();
  
      // Cancel overlap check.
      this._checkOverlapDebounce('cancel');
  
      // Append item element to the container if it's not it's child. Also make
      // sure the translate values are adjusted to account for the DOM shift.
      if (element.parentNode !== grid._element) {
        grid._element.appendChild(element);
        element.style[transformProp] = getTranslateString(this._gridX, this._gridY);
      }
  
      // Remove dragging class.
      removeClass(element, grid._settings.itemDraggingClass);
  
      // Reset drag data.
      this._reset();
  
      return this;
    };
  
    /**
     * Destroy instance.
     *
     * @public
     * @memberof ItemDrag.prototype
     * @returns {ItemDrag}
     */
    ItemDrag.prototype.destroy = function() {
      if (this._isDestroyed) return this;
      this.stop();
      this._hammer.destroy();
      this._item._element.removeEventListener('dragstart', preventDefault, false);
      this._isDestroyed = true;
      return this;
    };
  
    /**
     * Private prototype methods
     * *************************
     */
  
    /**
     * Get Grid instance.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @returns {?Grid}
     */
    ItemDrag.prototype._getGrid = function() {
      return gridInstances[this._gridId] || null;
    };
  
    /**
     * Setup/reset drag data.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._reset = function() {
      // Is item being dragged?
      this._isActive = false;
  
      // The dragged item's container element.
      this._container = null;
  
      // The dragged item's containing block.
      this._containingBlock = null;
  
      // Hammer event data.
      this._lastEvent = null;
      this._lastScrollEvent = null;
  
      // All the elements which need to be listened for scroll events during
      // dragging.
      this._scrollers = [];
  
      // The current translateX/translateY position.
      this._left = 0;
      this._top = 0;
  
      // Dragged element's current position within the grid.
      this._gridX = 0;
      this._gridY = 0;
  
      // Dragged element's current offset from window's northwest corner. Does
      // not account for element's margins.
      this._elementClientX = 0;
      this._elementClientY = 0;
  
      // Offset difference between the dragged element's temporary drag
      // container and it's original container.
      this._containerDiffX = 0;
      this._containerDiffY = 0;
    };
  
    /**
     * Bind drag scroll handlers to all scrollable ancestor elements of the
     * dragged element and the drag container element.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._bindScrollListeners = function() {
      var gridContainer = this._getGrid()._element;
      var dragContainer = this._container;
      var scrollers = this._scrollers;
      var containerScrollers;
      var i;
  
      // Get dragged element's scrolling parents.
      scrollers.length = 0;
      getScrollParents(this._item._element, scrollers);
  
      // If drag container is defined and it's not the same element as grid
      // container then we need to add the grid container and it's scroll parents
      // to the elements which are going to be listener for scroll events.
      if (dragContainer !== gridContainer) {
        containerScrollers = [];
        getScrollParents(gridContainer, containerScrollers);
        containerScrollers.push(gridContainer);
        for (i = 0; i < containerScrollers.length; i++) {
          if (scrollers.indexOf(containerScrollers[i]) < 0) {
            scrollers.push(containerScrollers[i]);
          }
        }
      }
  
      // Bind scroll listeners.
      for (i = 0; i < scrollers.length; i++) {
        scrollers[i].addEventListener('scroll', this._onScroll);
      }
    };
  
    /**
     * Unbind currently bound drag scroll handlers from all scrollable ancestor
     * elements of the dragged element and the drag container element.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._unbindScrollListeners = function() {
      var scrollers = this._scrollers;
      var i;
  
      for (i = 0; i < scrollers.length; i++) {
        scrollers[i].removeEventListener('scroll', this._onScroll);
      }
  
      scrollers.length = 0;
    };
  
    /**
     * Setup default start predicate.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @param {Object} [options]
     * @returns {Object}
     */
    ItemDrag.prototype._setupStartPredicate = function(options) {
      var config = options || this._getGrid()._settings.dragStartPredicate || 0;
      return (this._startPredicateData = {
        distance: Math.abs(config.distance) || 0,
        delay: Math.max(config.delay, 0) || 0,
        handle: typeof config.handle === 'string' ? config.handle : false
      });
    };
  
    /**
     * Setup default start predicate handle.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @param {Object} event
     * @returns {?HTMLElement}
     */
    ItemDrag.prototype._getStartPredicateHandle = function(event) {
      var predicate = this._startPredicateData;
      var element = this._item._element;
      var handleElement = element;
  
      // No handle, no hassle -> let's use the item element as the handle.
      if (!predicate.handle) return handleElement;
  
      // If there is a specific predicate handle defined, let's try to get it.
      handleElement = (event.changedPointers[0] || 0).target;
      while (handleElement && !elementMatches(handleElement, predicate.handle)) {
        handleElement = handleElement !== element ? handleElement.parentElement : null;
      }
      return handleElement || null;
    };
  
    /**
     * Unbind currently bound drag scroll handlers from all scrollable ancestor
     * elements of the dragged element and the drag container element.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @param {Object} event
     * @returns {Boolean}
     */
    ItemDrag.prototype._resolveStartPredicate = function(event) {
      var predicate = this._startPredicateData;
      var pointer = event.changedPointers[0];
      var pageX = (pointer && pointer.pageX) || 0;
      var pageY = (pointer && pointer.pageY) || 0;
      var handleRect;
      var handleLeft;
      var handleTop;
      var handleWidth;
      var handleHeight;
  
      // If the moved distance is smaller than the threshold distance or there is
      // some delay left, ignore this predicate cycle.
      if (event.distance < predicate.distance || predicate.delay) return;
  
      // Get handle rect data.
      handleRect = predicate.handleElement.getBoundingClientRect();
      handleLeft = handleRect.left + (window.pageXOffset || 0);
      handleTop = handleRect.top + (window.pageYOffset || 0);
      handleWidth = handleRect.width;
      handleHeight = handleRect.height;
  
      // Reset predicate data.
      this._resetStartPredicate();
  
      // If the cursor is still within the handle let's start the drag.
      return (
        handleWidth &&
        handleHeight &&
        pageX >= handleLeft &&
        pageX < handleLeft + handleWidth &&
        pageY >= handleTop &&
        pageY < handleTop + handleHeight
      );
    };
  
    /**
     * Finalize start predicate.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @param {Object} event
     */
    ItemDrag.prototype._finishStartPredicate = function(event) {
      var element = this._item._element;
  
      // Reset predicate.
      this._resetStartPredicate();
  
      // If the gesture can be interpreted as click let's try to open the element's
      // href url (if it is an anchor element).
      if (isClick(event)) openAnchorHref(element);
    };
  
    /**
     * Reset for default drag start predicate function.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._resetStartPredicate = function() {
      var predicate = this._startPredicateData;
      if (predicate) {
        if (predicate.delayTimer) {
          predicate.delayTimer = window.clearTimeout(predicate.delayTimer);
        }
        this._startPredicateData = null;
      }
    };
  
    /**
     * Check (during drag) if an item is overlapping other items and based on
     * the configuration layout the items.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._checkOverlap = function() {
      if (!this._isActive) return;
  
      var item = this._item;
      var settings = this._getGrid()._settings;
      var result;
      var currentGrid;
      var currentIndex;
      var targetGrid;
      var targetIndex;
      var sortAction;
      var isMigration;
  
      // Get overlap check result.
      if (typeof settings.dragSortPredicate === 'function') {
        result = settings.dragSortPredicate(item, this._lastEvent);
      } else {
        result = ItemDrag.defaultSortPredicate(item, settings.dragSortPredicate);
      }
  
      // Let's make sure the result object has a valid index before going further.
      if (!result || typeof result.index !== 'number') return;
  
      currentGrid = item.getGrid();
      targetGrid = result.grid || currentGrid;
      isMigration = currentGrid !== targetGrid;
      currentIndex = currentGrid._items.indexOf(item);
      targetIndex = normalizeArrayIndex(targetGrid._items, result.index, isMigration);
      sortAction = result.action === 'swap' ? 'swap' : 'move';
  
      // If the item was moved within it's current grid.
      if (!isMigration) {
        // Make sure the target index is not the current index.
        if (currentIndex !== targetIndex) {
          // Do the sort.
          (sortAction === 'swap' ? arraySwap : arrayMove)(
            currentGrid._items,
            currentIndex,
            targetIndex
          );
  
          // Emit move event.
          if (currentGrid._hasListeners(eventMove)) {
            currentGrid._emit(eventMove, {
              item: item,
              fromIndex: currentIndex,
              toIndex: targetIndex,
              action: sortAction
            });
          }
  
          // Layout the grid.
          currentGrid.layout();
        }
      }
  
      // If the item was moved to another grid.
      else {
        // Emit beforeSend event.
        if (currentGrid._hasListeners(eventBeforeSend)) {
          currentGrid._emit(eventBeforeSend, {
            item: item,
            fromGrid: currentGrid,
            fromIndex: currentIndex,
            toGrid: targetGrid,
            toIndex: targetIndex
          });
        }
  
        // Emit beforeReceive event.
        if (targetGrid._hasListeners(eventBeforeReceive)) {
          targetGrid._emit(eventBeforeReceive, {
            item: item,
            fromGrid: currentGrid,
            fromIndex: currentIndex,
            toGrid: targetGrid,
            toIndex: targetIndex
          });
        }
  
        // Update item's grid id reference.
        item._gridId = targetGrid._id;
  
        // Update drag instance's migrating indicator.
        this._isMigrating = item._gridId !== this._gridId;
  
        // Move item instance from current grid to target grid.
        currentGrid._items.splice(currentIndex, 1);
        arrayInsert(targetGrid._items, item, targetIndex);
  
        // Set sort data as null, which is an indicator for the item comparison
        // function that the sort data of this specific item should be fetched
        // lazily.
        item._sortData = null;
  
        // Emit send event.
        if (currentGrid._hasListeners(eventSend)) {
          currentGrid._emit(eventSend, {
            item: item,
            fromGrid: currentGrid,
            fromIndex: currentIndex,
            toGrid: targetGrid,
            toIndex: targetIndex
          });
        }
  
        // Emit receive event.
        if (targetGrid._hasListeners(eventReceive)) {
          targetGrid._emit(eventReceive, {
            item: item,
            fromGrid: currentGrid,
            fromIndex: currentIndex,
            toGrid: targetGrid,
            toIndex: targetIndex
          });
        }
  
        // Layout both grids.
        currentGrid.layout();
        targetGrid.layout();
      }
    };
  
    /**
     * If item is dragged into another grid, finish the migration process
     * gracefully.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._finishMigration = function() {
      var item = this._item;
      var release = item._release;
      var element = item._element;
      var isActive = item._isActive;
      var targetGrid = item.getGrid();
      var targetGridElement = targetGrid._element;
      var targetSettings = targetGrid._settings;
      var targetContainer = targetSettings.dragContainer || targetGridElement;
      var currentSettings = this._getGrid()._settings;
      var currentContainer = element.parentNode;
      var translate;
      var offsetDiff;
  
      // Destroy current drag. Note that we need to set the migrating flag to
      // false first, because otherwise we create an infinite loop between this
      // and the drag.stop() method.
      this._isMigrating = false;
      this.destroy();
  
      // Remove current classnames.
      removeClass(element, currentSettings.itemClass);
      removeClass(element, currentSettings.itemVisibleClass);
      removeClass(element, currentSettings.itemHiddenClass);
  
      // Add new classnames.
      addClass(element, targetSettings.itemClass);
      addClass(element, isActive ? targetSettings.itemVisibleClass : targetSettings.itemHiddenClass);
  
      // Move the item inside the target container if it's different than the
      // current container.
      if (targetContainer !== currentContainer) {
        targetContainer.appendChild(element);
        offsetDiff = getOffsetDiff(currentContainer, targetContainer, true);
        translate = getTranslate(element);
        translate.x -= offsetDiff.left;
        translate.y -= offsetDiff.top;
      }
  
      // Update item's cached dimensions and sort data.
      item._refreshDimensions();
      item._refreshSortData();
  
      // Calculate the offset difference between target's drag container (if any)
      // and actual grid container element. We save it later for the release
      // process.
      offsetDiff = getOffsetDiff(targetContainer, targetGridElement, true);
      release._containerDiffX = offsetDiff.left;
      release._containerDiffY = offsetDiff.top;
  
      // Recreate item's drag handler.
      item._drag = targetSettings.dragEnabled ? new ItemDrag(item) : null;
  
      // Adjust the position of the item element if it was moved from a container
      // to another.
      if (targetContainer !== currentContainer) {
        element.style[transformProp] = getTranslateString(translate.x, translate.y);
      }
  
      // Update child element's styles to reflect the current visibility state.
      item._child.removeAttribute('style');
      setStyles(item._child, isActive ? targetSettings.visibleStyles : targetSettings.hiddenStyles);
  
      // Start the release.
      release.start();
    };
  
    /**
     * Drag start handler.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @param {Object} event
     */
    ItemDrag.prototype._onStart = function(event) {
      var item = this._item;
  
      // If item is not active, don't start the drag.
      if (!item._isActive) return;
  
      var element = item._element;
      var grid = this._getGrid();
      var settings = grid._settings;
      var release = item._release;
      var migrate = item._migrate;
      var gridContainer = grid._element;
      var dragContainer = settings.dragContainer || gridContainer;
      var containingBlock = getContainingBlock(dragContainer, true);
      var translate = getTranslate(element);
      var currentLeft = translate.x;
      var currentTop = translate.y;
      var elementRect = element.getBoundingClientRect();
      var hasDragContainer = dragContainer !== gridContainer;
      var offsetDiff;
  
      // If grid container is not the drag container, we need to calculate the
      // offset difference between grid container and drag container's containing
      // element.
      if (hasDragContainer) {
        offsetDiff = getOffsetDiff(containingBlock, gridContainer);
      }
  
      // Stop current positioning animation.
      if (item.isPositioning()) {
        item._layout.stop(true, { transform: getTranslateString(currentLeft, currentTop) });
      }
  
      // Stop current migration animation.
      if (migrate._isActive) {
        currentLeft -= migrate._containerDiffX;
        currentTop -= migrate._containerDiffY;
        migrate.stop(true, { transform: getTranslateString(currentLeft, currentTop) });
      }
  
      // If item is being released reset release data.
      if (item.isReleasing()) release._reset();
  
      // Setup drag data.
      this._isActive = true;
      this._lastEvent = event;
      this._container = dragContainer;
      this._containingBlock = containingBlock;
      this._elementClientX = elementRect.left;
      this._elementClientY = elementRect.top;
      this._left = this._gridX = currentLeft;
      this._top = this._gridY = currentTop;
  
      // Emit dragInit event.
      grid._emit(eventDragInit, item, event);
  
      // If a specific drag container is set and it is different from the
      // grid's container element we need to cast some extra spells.
      if (hasDragContainer) {
        // Store the container offset diffs to drag data.
        this._containerDiffX = offsetDiff.left;
        this._containerDiffY = offsetDiff.top;
  
        // If the dragged element is a child of the drag container all we need to
        // do is setup the relative drag position data.
        if (element.parentNode === dragContainer) {
          this._gridX = currentLeft - this._containerDiffX;
          this._gridY = currentTop - this._containerDiffY;
        }
  
        // Otherwise we need to append the element inside the correct container,
        // setup the actual drag position data and adjust the element's translate
        // values to account for the DOM position shift.
        else {
          this._left = currentLeft + this._containerDiffX;
          this._top = currentTop + this._containerDiffY;
          dragContainer.appendChild(element);
          element.style[transformProp] = getTranslateString(this._left, this._top);
        }
      }
  
      // Set drag class and bind scrollers.
      addClass(element, settings.itemDraggingClass);
      this._bindScrollListeners();
  
      // Emit dragStart event.
      grid._emit(eventDragStart, item, event);
    };
  
    /**
     * Drag move handler.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @param {Object} event
     */
    ItemDrag.prototype._onMove = function(event) {
      var item = this._item;
  
      // If item is not active, reset drag.
      if (!item._isActive) {
        this.stop();
        return;
      }
  
      var settings = this._getGrid()._settings;
      var axis = settings.dragAxis;
      var xDiff = event.deltaX - this._lastEvent.deltaX;
      var yDiff = event.deltaY - this._lastEvent.deltaY;
  
      // Update last event.
      this._lastEvent = event;
  
      // Update horizontal position data.
      if (axis !== 'y') {
        this._left += xDiff;
        this._gridX += xDiff;
        this._elementClientX += xDiff;
      }
  
      // Update vertical position data.
      if (axis !== 'x') {
        this._top += yDiff;
        this._gridY += yDiff;
        this._elementClientY += yDiff;
      }
  
      // Do move prepare/apply handling in the next tick.
      addMoveTick(item._id, this._prepareMove, this._applyMove);
    };
  
    /**
     * Prepare dragged item for moving.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._prepareMove = function() {
      // Do nothing if item is not active.
      if (!this._item._isActive) return;
  
      // If drag sort is enabled -> check overlap.
      if (this._getGrid()._settings.dragSort) this._checkOverlapDebounce();
    };
  
    /**
     * Apply movement to dragged item.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._applyMove = function() {
      var item = this._item;
  
      // Do nothing if item is not active.
      if (!item._isActive) return;
  
      // Update element's translateX/Y values.
      item._element.style[transformProp] = getTranslateString(this._left, this._top);
  
      // Emit dragMove event.
      this._getGrid()._emit(eventDragMove, item, this._lastEvent);
    };
  
    /**
     * Drag scroll handler.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @param {Object} event
     */
    ItemDrag.prototype._onScroll = function(event) {
      var item = this._item;
  
      // If item is not active, reset drag.
      if (!item._isActive) {
        this.stop();
        return;
      }
  
      // Update last scroll event.
      this._lastScrollEvent = event;
  
      // Do scroll prepare/apply handling in the next tick.
      addScrollTick(item._id, this._prepareScroll, this._applyScroll);
    };
  
    /**
     * Prepare dragged item for scrolling.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._prepareScroll = function() {
      var item = this._item;
  
      // If item is not active do nothing.
      if (!item._isActive) return;
  
      var element = item._element;
      var grid = this._getGrid();
      var settings = grid._settings;
      var axis = settings.dragAxis;
      var gridContainer = grid._element;
      var offsetDiff;
  
      // Calculate element's rect and x/y diff.
      var rect = element.getBoundingClientRect();
      var xDiff = this._elementClientX - rect.left;
      var yDiff = this._elementClientY - rect.top;
  
      // Update container diff.
      if (this._container !== gridContainer) {
        offsetDiff = getOffsetDiff(this._containingBlock, gridContainer);
        this._containerDiffX = offsetDiff.left;
        this._containerDiffY = offsetDiff.top;
      }
  
      // Update horizontal position data.
      if (axis !== 'y') {
        this._left += xDiff;
        this._gridX = this._left - this._containerDiffX;
      }
  
      // Update vertical position data.
      if (axis !== 'x') {
        this._top += yDiff;
        this._gridY = this._top - this._containerDiffY;
      }
  
      // Overlap handling.
      if (settings.dragSort) this._checkOverlapDebounce();
    };
  
    /**
     * Apply scroll to dragged item.
     *
     * @private
     * @memberof ItemDrag.prototype
     */
    ItemDrag.prototype._applyScroll = function() {
      var item = this._item;
  
      // If item is not active do nothing.
      if (!item._isActive) return;
  
      // Update element's translateX/Y values.
      item._element.style[transformProp] = getTranslateString(this._left, this._top);
  
      // Emit dragScroll event.
      this._getGrid()._emit(eventDragScroll, item, this._lastScrollEvent);
    };
  
    /**
     * Drag end handler.
     *
     * @private
     * @memberof ItemDrag.prototype
     * @param {Object} event
     */
    ItemDrag.prototype._onEnd = function(event) {
      var item = this._item;
      var element = item._element;
      var grid = this._getGrid();
      var settings = grid._settings;
      var release = item._release;
  
      // If item is not active, reset drag.
      if (!item._isActive) {
        this.stop();
        return;
      }
  
      // Cancel queued move and scroll ticks.
      cancelMoveTick(item._id);
      cancelScrollTick(item._id);
  
      // Finish currently queued overlap check.
      settings.dragSort && this._checkOverlapDebounce('finish');
  
      // Remove scroll listeners.
      this._unbindScrollListeners();
  
      // Setup release data.
      release._containerDiffX = this._containerDiffX;
      release._containerDiffY = this._containerDiffY;
  
      // Reset drag data.
      this._reset();
  
      // Remove drag class name from element.
      removeClass(element, settings.itemDraggingClass);
  
      // Emit dragEnd event.
      grid._emit(eventDragEnd, item, event);
  
      // Finish up the migration process or start the release process.
      this._isMigrating ? this._finishMigration() : release.start();
    };
  
    /**
     * Private helpers
     * ***************
     */
  
    /**
     * Prevent default.
     *
     * @param {Object} e
     */
    function preventDefault(e) {
      if (e.preventDefault) e.preventDefault();
    }
  
    /**
     * Calculate how many percent the intersection area of two rectangles is from
     * the maximum potential intersection area between the rectangles.
     *
     * @param {Rectangle} a
     * @param {Rectangle} b
     * @returns {Number}
     *   - A number between 0-100.
     */
    function getRectOverlapScore(a, b) {
      // Return 0 immediately if the rectangles do not overlap.
      if (
        a.left + a.width <= b.left ||
        b.left + b.width <= a.left ||
        a.top + a.height <= b.top ||
        b.top + b.height <= a.top
      ) {
        return 0;
      }
  
      // Calculate intersection area's width, height, max height and max width.
      var width = Math.min(a.left + a.width, b.left + b.width) - Math.max(a.left, b.left);
      var height = Math.min(a.top + a.height, b.top + b.height) - Math.max(a.top, b.top);
      var maxWidth = Math.min(a.width, b.width);
      var maxHeight = Math.min(a.height, b.height);
  
      return ((width * height) / (maxWidth * maxHeight)) * 100;
    }
  
    /**
     * Get element's scroll parents.
     *
     * @param {HTMLElement} element
     * @param {Array} [data]
     * @returns {HTMLElement[]}
     */
    function getScrollParents(element, data) {
      var ret = data || [];
      var parent = element.parentNode;
  
      //
      // If transformed elements leak fixed elements.
      //
  
      if (hasTransformLeak) {
        // If the element is fixed it can not have any scroll parents.
        if (getStyle(element, 'position') === 'fixed') return ret;
  
        // Find scroll parents.
        while (parent && parent !== document && parent !== document.documentElement) {
          if (isScrollable(parent)) ret.push(parent);
          parent = getStyle(parent, 'position') === 'fixed' ? null : parent.parentNode;
        }
  
        // If parent is not fixed element, add window object as the last scroll
        // parent.
        parent !== null && ret.push(window);
        return ret;
      }
  
      //
      // If fixed elements behave as defined in the W3C specification.
      //
  
      // Find scroll parents.
      while (parent && parent !== document) {
        // If the currently looped element is fixed ignore all parents that are
        // not transformed.
        if (getStyle(element, 'position') === 'fixed' && !isTransformed(parent)) {
          parent = parent.parentNode;
          continue;
        }
  
        // Add the parent element to return items if it is scrollable.
        if (isScrollable(parent)) ret.push(parent);
  
        // Update element and parent references.
        element = parent;
        parent = parent.parentNode;
      }
  
      // If the last item is the root element, replace it with window. The root
      // element scroll is propagated to the window.
      if (ret[ret.length - 1] === document.documentElement) {
        ret[ret.length - 1] = window;
      }
      // Otherwise add window as the last scroll parent.
      else {
        ret.push(window);
      }
  
      return ret;
    }
  
    /**
     * Check if an element is scrollable.
     *
     * @param {HTMLElement} element
     * @returns {Boolean}
     */
    function isScrollable(element) {
      var overflow = getStyle(element, 'overflow');
      if (overflow === 'auto' || overflow === 'scroll') return true;
  
      overflow = getStyle(element, 'overflow-x');
      if (overflow === 'auto' || overflow === 'scroll') return true;
  
      overflow = getStyle(element, 'overflow-y');
      if (overflow === 'auto' || overflow === 'scroll') return true;
  
      return false;
    }
  
    /**
     * Check if drag gesture can be interpreted as a click, based on final drag
     * event data.
     *
     * @param {Object} element
     * @returns {Boolean}
     */
    function isClick(event) {
      return Math.abs(event.deltaX) < 2 && Math.abs(event.deltaY) < 2 && event.deltaTime < 200;
    }
  
    /**
     * Check if an element is an anchor element and open the href url if possible.
     *
     * @param {HTMLElement} element
     */
    function openAnchorHref(element) {
      // Make sure the element is anchor element.
      if (element.tagName.toLowerCase() !== 'a') return;
  
      // Get href and make sure it exists.
      var href = element.getAttribute('href');
      if (!href) return;
  
      // Finally let's navigate to the link href.
      var target = element.getAttribute('target');
      if (target && target !== '_self') {
        window.open(href, target);
      } else {
        window.location.href = href;
      }
    }
  
    /**
     * Detects if transformed elements leak fixed elements. According W3C
     * transform rendering spec a transformed element should contain even fixed
     * elements. Meaning that fixed elements are positioned relative to the
     * closest transformed ancestor element instead of window. However, not every
     * browser follows the spec (IE and older Firefox). So we need to test it.
     * https://www.w3.org/TR/css3-2d-transforms/#transform-rendering
     *
     * Borrowed from Mezr (v0.6.1):
     * https://github.com/niklasramo/mezr/blob/0.6.1/mezr.js#L607
     */
    function checkTransformLeak() {
      // No transforms -> definitely leaks.
      if (!isTransformSupported) return true;
  
      // No body available -> can't check it.
      if (!document.body) return null;
  
      // Do the test.
      var elems = [0, 1].map(function(elem, isInner) {
        elem = document.createElement('div');
        elem.style.position = isInner ? 'fixed' : 'absolute';
        elem.style.display = 'block';
        elem.style.visibility = 'hidden';
        elem.style.left = isInner ? '0px' : '1px';
        elem.style[transformProp] = 'none';
        return elem;
      });
      var outer = document.body.appendChild(elems[0]);
      var inner = outer.appendChild(elems[1]);
      var left = inner.getBoundingClientRect().left;
      outer.style[transformProp] = 'scale(1)';
      var ret = left === inner.getBoundingClientRect().left;
      document.body.removeChild(outer);
      return ret;
    }
  
    /**
     * Queue constructor.
     *
     * @class
     */
    function Queue() {
      this._queue = [];
      this._isDestroyed = false;
    }
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Add callback to the queue.
     *
     * @public
     * @memberof Queue.prototype
     * @param {Function} callback
     * @returns {Queue}
     */
    Queue.prototype.add = function(callback) {
      if (this._isDestroyed) return this;
      this._queue.push(callback);
      return this;
    };
  
    /**
     * Process queue callbacks and reset the queue.
     *
     * @public
     * @memberof Queue.prototype
     * @param {*} arg1
     * @param {*} arg2
     * @returns {Queue}
     */
    Queue.prototype.flush = function(arg1, arg2) {
      if (this._isDestroyed) return this;
  
      var queue = this._queue;
      var length = queue.length;
      var i;
  
      // Quit early if the queue is empty.
      if (!length) return this;
  
      var singleCallback = length === 1;
      var snapshot = singleCallback ? queue[0] : queue.slice(0);
  
      // Reset queue.
      queue.length = 0;
  
      // If we only have a single callback let's just call it.
      if (singleCallback) {
        snapshot(arg1, arg2);
        return this;
      }
  
      // If we have multiple callbacks, let's process them.
      for (i = 0; i < length; i++) {
        snapshot[i](arg1, arg2);
        if (this._isDestroyed) break;
      }
  
      return this;
    };
  
    /**
     * Destroy Queue instance.
     *
     * @public
     * @memberof Queue.prototype
     * @returns {Queue}
     */
    Queue.prototype.destroy = function() {
      if (this._isDestroyed) return this;
  
      this._isDestroyed = true;
      this._queue.length = 0;
  
      return this;
    };
  
    /**
     * Layout manager for Item instance.
     *
     * @class
     * @param {Item} item
     */
    function ItemLayout(item) {
      this._item = item;
      this._isActive = false;
      this._isDestroyed = false;
      this._isInterrupted = false;
      this._currentStyles = {};
      this._targetStyles = {};
      this._currentLeft = 0;
      this._currentTop = 0;
      this._offsetLeft = 0;
      this._offsetTop = 0;
      this._skipNextAnimation = false;
      this._animateOptions = {
        onFinish: this._finish.bind(this)
      };
      this._queue = new Queue();
  
      // Bind animation handlers and finish method.
      this._setupAnimation = this._setupAnimation.bind(this);
      this._startAnimation = this._startAnimation.bind(this);
    }
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Start item layout based on it's current data.
     *
     * @public
     * @memberof ItemLayout.prototype
     * @param {Boolean} [instant=false]
     * @param {Function} [onFinish]
     * @returns {ItemLayout}
     */
    ItemLayout.prototype.start = function(instant, onFinish) {
      if (this._isDestroyed) return;
  
      var item = this._item;
      var element = item._element;
      var release = item._release;
      var gridSettings = item.getGrid()._settings;
      var isPositioning = this._isActive;
      var isJustReleased = release._isActive && release._isPositioningStarted === false;
      var animDuration = isJustReleased
        ? gridSettings.dragReleaseDuration
        : gridSettings.layoutDuration;
      var animEasing = isJustReleased ? gridSettings.dragReleaseEasing : gridSettings.layoutEasing;
      var animEnabled = !instant && !this._skipNextAnimation && animDuration > 0;
      var isAnimating;
  
      // If the item is currently positioning process current layout callback
      // queue with interrupted flag on.
      if (isPositioning) this._queue.flush(true, item);
  
      // Mark release positioning as started.
      if (isJustReleased) release._isPositioningStarted = true;
  
      // Push the callback to the callback queue.
      if (typeof onFinish === 'function') this._queue.add(onFinish);
  
      // If no animations are needed, easy peasy!
      if (!animEnabled) {
        this._updateOffsets();
        this._updateTargetStyles();
        isPositioning && cancelLayoutTick(item._id);
        isAnimating = item._animate.isAnimating();
        this.stop(false, this._targetStyles);
        !isAnimating && setStyles(element, this._targetStyles);
        this._skipNextAnimation = false;
        return this._finish();
      }
  
      // Set item active and store some data for the animation that is about to be
      // triggered.
      this._isActive = true;
      this._animateOptions.easing = animEasing;
      this._animateOptions.duration = animDuration;
      this._isInterrupted = isPositioning;
  
      // Start the item's layout animation in the next tick.
      addLayoutTick(item._id, this._setupAnimation, this._startAnimation);
  
      return this;
    };
  
    /**
     * Stop item's position animation if it is currently animating.
     *
     * @public
     * @memberof ItemLayout.prototype
     * @param {Boolean} [processCallbackQueue=false]
     * @param {Object} [targetStyles]
     * @returns {ItemLayout}
     */
    ItemLayout.prototype.stop = function(processCallbackQueue, targetStyles) {
      if (this._isDestroyed || !this._isActive) return this;
  
      var item = this._item;
  
      // Cancel animation init.
      cancelLayoutTick(item._id);
  
      // Stop animation.
      item._animate.stop(targetStyles);
  
      // Remove positioning class.
      removeClass(item._element, item.getGrid()._settings.itemPositioningClass);
  
      // Reset active state.
      this._isActive = false;
  
      // Process callback queue if needed.
      if (processCallbackQueue) this._queue.flush(true, item);
  
      return this;
    };
  
    /**
     * Destroy the instance and stop current animation if it is running.
     *
     * @public
     * @memberof ItemLayout.prototype
     * @returns {ItemLayout}
     */
    ItemLayout.prototype.destroy = function() {
      if (this._isDestroyed) return this;
      this.stop(true, {});
      this._queue.destroy();
      this._item = this._currentStyles = this._targetStyles = this._animateOptions = null;
      this._isDestroyed = true;
      return this;
    };
  
    /**
     * Private prototype methods
     * *************************
     */
  
    /**
     * Calculate and update item's current layout offset data.
     *
     * @private
     * @memberof ItemLayout.prototype
     */
    ItemLayout.prototype._updateOffsets = function() {
      if (this._isDestroyed) return;
  
      var item = this._item;
      var migrate = item._migrate;
      var release = item._release;
  
      this._offsetLeft = release._isActive
        ? release._containerDiffX
        : migrate._isActive
          ? migrate._containerDiffX
          : 0;
  
      this._offsetTop = release._isActive
        ? release._containerDiffY
        : migrate._isActive
          ? migrate._containerDiffY
          : 0;
    };
  
    /**
     * Calculate and update item's layout target styles.
     *
     * @private
     * @memberof ItemLayout.prototype
     */
    ItemLayout.prototype._updateTargetStyles = function() {
      if (this._isDestroyed) return;
  
      var item = this._item;
  
      this._targetStyles.transform = getTranslateString(
        item._left + this._offsetLeft,
        item._top + this._offsetTop
      );
    };
  
    /**
     * Finish item layout procedure.
     *
     * @private
     * @memberof ItemLayout.prototype
     */
    ItemLayout.prototype._finish = function() {
      if (this._isDestroyed) return;
  
      var item = this._item;
      var migrate = item._migrate;
      var release = item._release;
  
      // Mark the item as inactive and remove positioning classes.
      if (this._isActive) {
        this._isActive = false;
        removeClass(item._element, item.getGrid()._settings.itemPositioningClass);
      }
  
      // Finish up release and migration.
      if (release._isActive) release.stop();
      if (migrate._isActive) migrate.stop();
  
      // Process the callback queue.
      this._queue.flush(false, item);
    };
  
    /**
     * Prepare item for layout animation.
     *
     * @private
     * @memberof ItemLayout.prototype
     */
    ItemLayout.prototype._setupAnimation = function() {
      var element = this._item._element;
      var translate = getTranslate(element);
      this._currentLeft = translate.x;
      this._currentTop = translate.y;
    };
  
    /**
     * Start layout animation.
     *
     * @private
     * @memberof ItemLayout.prototype
     */
    ItemLayout.prototype._startAnimation = function() {
      var item = this._item;
      var element = item._element;
      var grid = item.getGrid();
      var settings = grid._settings;
  
      // Let's update the offset data and target styles.
      this._updateOffsets();
      this._updateTargetStyles();
  
      // If the item is already in correct position let's quit early.
      if (
        item._left === this._currentLeft - this._offsetLeft &&
        item._top === this._currentTop - this._offsetTop
      ) {
        if (this._isInterrupted) this.stop(false, this._targetStyles);
        this._isActive = false;
        this._finish();
        return;
      }
  
      // Set item's positioning class if needed.
      !this._isInterrupted && addClass(element, settings.itemPositioningClass);
  
      // Get current styles for animation.
      this._currentStyles.transform = getTranslateString(this._currentLeft, this._currentTop);
  
      // Animate.
      item._animate.start(this._currentStyles, this._targetStyles, this._animateOptions);
    };
  
    var tempStyles = {};
  
    /**
     * The migrate process handler constructor.
     *
     * @class
     * @param {Item} item
     */
    function ItemMigrate(item) {
      // Private props.
      this._item = item;
      this._isActive = false;
      this._isDestroyed = false;
      this._container = false;
      this._containerDiffX = 0;
      this._containerDiffY = 0;
    }
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Start the migrate process of an item.
     *
     * @public
     * @memberof ItemMigrate.prototype
     * @param {Grid} targetGrid
     * @param {GridSingleItemQuery} position
     * @param {HTMLElement} [container]
     * @returns {ItemMigrate}
     */
    ItemMigrate.prototype.start = function(targetGrid, position, container) {
      if (this._isDestroyed) return this;
  
      var item = this._item;
      var element = item._element;
      var isVisible = item.isVisible();
      var grid = item.getGrid();
      var settings = grid._settings;
      var targetSettings = targetGrid._settings;
      var targetElement = targetGrid._element;
      var targetItems = targetGrid._items;
      var currentIndex = grid._items.indexOf(item);
      var targetContainer = container || document.body;
      var targetIndex;
      var targetItem;
      var currentContainer;
      var offsetDiff;
      var containerDiff;
      var translate;
      var translateX;
      var translateY;
  
      // Get target index.
      if (typeof position === 'number') {
        targetIndex = normalizeArrayIndex(targetItems, position, true);
      } else {
        targetItem = targetGrid._getItem(position);
        /** @todo Consider throwing an error here instead of silently failing. */
        if (!targetItem) return this;
        targetIndex = targetItems.indexOf(targetItem);
      }
  
      // Get current translateX and translateY values if needed.
      if (item.isPositioning() || this._isActive || item.isReleasing()) {
        translate = getTranslate(element);
        translateX = translate.x;
        translateY = translate.y;
      }
  
      // Abort current positioning.
      if (item.isPositioning()) {
        item._layout.stop(true, { transform: getTranslateString(translateX, translateY) });
      }
  
      // Abort current migration.
      if (this._isActive) {
        translateX -= this._containerDiffX;
        translateY -= this._containerDiffY;
        this.stop(true, { transform: getTranslateString(translateX, translateY) });
      }
  
      // Abort current release.
      if (item.isReleasing()) {
        translateX -= item._release._containerDiffX;
        translateY -= item._release._containerDiffY;
        item._release.stop(true, { transform: getTranslateString(translateX, translateY) });
      }
  
      // Stop current visibility animations.
      item._visibility._stopAnimation();
  
      // Destroy current drag.
      if (item._drag) item._drag.destroy();
  
      // Process current visibility animation queue.
      item._visibility._queue.flush(true, item);
  
      // Emit beforeSend event.
      if (grid._hasListeners(eventBeforeSend)) {
        grid._emit(eventBeforeSend, {
          item: item,
          fromGrid: grid,
          fromIndex: currentIndex,
          toGrid: targetGrid,
          toIndex: targetIndex
        });
      }
  
      // Emit beforeReceive event.
      if (targetGrid._hasListeners(eventBeforeReceive)) {
        targetGrid._emit(eventBeforeReceive, {
          item: item,
          fromGrid: grid,
          fromIndex: currentIndex,
          toGrid: targetGrid,
          toIndex: targetIndex
        });
      }
  
      // Remove current classnames.
      removeClass(element, settings.itemClass);
      removeClass(element, settings.itemVisibleClass);
      removeClass(element, settings.itemHiddenClass);
  
      // Add new classnames.
      addClass(element, targetSettings.itemClass);
      addClass(element, isVisible ? targetSettings.itemVisibleClass : targetSettings.itemHiddenClass);
  
      // Move item instance from current grid to target grid.
      grid._items.splice(currentIndex, 1);
      arrayInsert(targetItems, item, targetIndex);
  
      // Update item's grid id reference.
      item._gridId = targetGrid._id;
  
      // Get current container.
      currentContainer = element.parentNode;
  
      // Move the item inside the target container if it's different than the
      // current container.
      if (targetContainer !== currentContainer) {
        targetContainer.appendChild(element);
        offsetDiff = getOffsetDiff(targetContainer, currentContainer, true);
        if (!translate) {
          translate = getTranslate(element);
          translateX = translate.x;
          translateY = translate.y;
        }
        element.style[transformProp] = getTranslateString(
          translateX + offsetDiff.left,
          translateY + offsetDiff.top
        );
      }
  
      // Update child element's styles to reflect the current visibility state.
      item._child.removeAttribute('style');
      setStyles(item._child, isVisible ? targetSettings.visibleStyles : targetSettings.hiddenStyles);
  
      // Update display style.
      element.style.display = isVisible ? 'block' : 'hidden';
  
      // Get offset diff for the migration data.
      containerDiff = getOffsetDiff(targetContainer, targetElement, true);
  
      // Update item's cached dimensions and sort data.
      item._refreshDimensions();
      item._refreshSortData();
  
      // Create new drag handler.
      item._drag = targetSettings.dragEnabled ? new ItemDrag(item) : null;
  
      // Setup migration data.
      this._isActive = true;
      this._container = targetContainer;
      this._containerDiffX = containerDiff.left;
      this._containerDiffY = containerDiff.top;
  
      // Emit send event.
      if (grid._hasListeners(eventSend)) {
        grid._emit(eventSend, {
          item: item,
          fromGrid: grid,
          fromIndex: currentIndex,
          toGrid: targetGrid,
          toIndex: targetIndex
        });
      }
  
      // Emit receive event.
      if (targetGrid._hasListeners(eventReceive)) {
        targetGrid._emit(eventReceive, {
          item: item,
          fromGrid: grid,
          fromIndex: currentIndex,
          toGrid: targetGrid,
          toIndex: targetIndex
        });
      }
  
      return this;
    };
  
    /**
     * End the migrate process of an item. This method can be used to abort an
     * ongoing migrate process (animation) or finish the migrate process.
     *
     * @public
     * @memberof ItemMigrate.prototype
     * @param {Boolean} [abort=false]
     *  - Should the migration be aborted?
     * @param {Object} [currentStyles]
     *  - Optional current translateX and translateY styles.
     * @returns {ItemMigrate}
     */
    ItemMigrate.prototype.stop = function(abort, currentStyles) {
      if (this._isDestroyed || !this._isActive) return this;
  
      var item = this._item;
      var element = item._element;
      var grid = item.getGrid();
      var gridElement = grid._element;
      var translate;
  
      if (this._container !== gridElement) {
        if (!currentStyles) {
          if (abort) {
            translate = getTranslate(element);
            tempStyles.transform = getTranslateString(
              translate.x - this._containerDiffX,
              translate.y - this._containerDiffY
            );
          } else {
            tempStyles.transform = getTranslateString(item._left, item._top);
          }
          currentStyles = tempStyles;
        }
        gridElement.appendChild(element);
        setStyles(element, currentStyles);
      }
  
      this._isActive = false;
      this._container = null;
      this._containerDiffX = 0;
      this._containerDiffY = 0;
  
      return this;
    };
  
    /**
     * Destroy instance.
     *
     * @public
     * @memberof ItemMigrate.prototype
     * @returns {ItemMigrate}
     */
    ItemMigrate.prototype.destroy = function() {
      if (this._isDestroyed) return this;
      this.stop(true);
      this._item = null;
      this._isDestroyed = true;
      return this;
    };
  
    var tempStyles$1 = {};
  
    /**
     * The release process handler constructor. Although this might seem as proper
     * fit for the drag process this needs to be separated into it's own logic
     * because there might be a scenario where drag is disabled, but the release
     * process still needs to be implemented (dragging from a grid to another).
     *
     * @class
     * @param {Item} item
     */
    function ItemRelease(item) {
      this._item = item;
      this._isActive = false;
      this._isDestroyed = false;
      this._isPositioningStarted = false;
      this._containerDiffX = 0;
      this._containerDiffY = 0;
    }
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Start the release process of an item.
     *
     * @public
     * @memberof ItemRelease.prototype
     * @returns {ItemRelease}
     */
    ItemRelease.prototype.start = function() {
      if (this._isDestroyed || this._isActive) return this;
  
      var item = this._item;
      var grid = item.getGrid();
  
      // Flag release as active.
      this._isActive = true;
  
      // Add release class name to the released element.
      addClass(item._element, grid._settings.itemReleasingClass);
  
      // Emit dragReleaseStart event.
      grid._emit(eventDragReleaseStart, item);
  
      // Position the released item.
      item._layout.start(false);
  
      return this;
    };
  
    /**
     * End the release process of an item. This method can be used to abort an
     * ongoing release process (animation) or finish the release process.
     *
     * @public
     * @memberof ItemRelease.prototype
     * @param {Boolean} [abort=false]
     *  - Should the release be aborted? When true, the release end event won't be
     *    emitted. Set to true only when you need to abort the release process
     *    while the item is animating to it's position.
     * @param {Object} [currentStyles]
     *  - Optional current translateX and translateY styles.
     * @returns {ItemRelease}
     */
    ItemRelease.prototype.stop = function(abort, currentStyles) {
      if (this._isDestroyed || !this._isActive) return this;
  
      var item = this._item;
      var element = item._element;
      var grid = item.getGrid();
      var container = grid._element;
      var translate;
  
      // Reset data and remove releasing class name from the element.
      this._reset();
  
      // If the released element is outside the grid's container element put it
      // back there and adjust position accordingly.
      if (element.parentNode !== container) {
        if (!currentStyles) {
          if (abort) {
            translate = getTranslate(element);
            tempStyles$1.transform = getTranslateString(
              translate.x - this._containerDiffX,
              translate.y - this._containerDiffY
            );
          } else {
            tempStyles$1.transform = getTranslateString(item._left, item._top);
          }
          currentStyles = tempStyles$1;
        }
        container.appendChild(element);
        setStyles(element, currentStyles);
      }
  
      // Emit dragReleaseEnd event.
      if (!abort) grid._emit(eventDragReleaseEnd, item);
  
      return this;
    };
  
    /**
     * Destroy instance.
     *
     * @public
     * @memberof ItemRelease.prototype
     * @returns {ItemRelease}
     */
    ItemRelease.prototype.destroy = function() {
      if (this._isDestroyed) return this;
      this.stop(true);
      this._item = null;
      this._isDestroyed = true;
      return this;
    };
  
    /**
     * Private prototype methods
     * *************************
     */
  
    /**
     * Reset public data and remove releasing class.
     *
     * @private
     * @memberof ItemRelease.prototype
     */
    ItemRelease.prototype._reset = function() {
      if (this._isDestroyed) return;
      var item = this._item;
      this._isActive = false;
      this._isPositioningStarted = false;
      this._containerDiffX = 0;
      this._containerDiffY = 0;
      removeClass(item._element, item.getGrid()._settings.itemReleasingClass);
    };
  
    /**
     * Get current values of the provided styles definition object.
     *
     * @param {HTMLElement} element
     * @param {Object} styles
     * @return {Object}
     */
    function getCurrentStyles(element, styles) {
      var current = {};
      for (var prop in styles) {
        current[prop] = getStyle(element, getStyleName(prop));
      }
      return current;
    }
  
    /**
     * Visibility manager for Item instance.
     *
     * @class
     * @param {Item} item
     */
    function ItemVisibility(item) {
      var isActive = item._isActive;
      var element = item._element;
      var settings = item.getGrid()._settings;
  
      this._item = item;
      this._isDestroyed = false;
  
      // Set up visibility states.
      this._isHidden = !isActive;
      this._isHiding = false;
      this._isShowing = false;
  
      // Callback queue.
      this._queue = new Queue();
  
      // Bind show/hide finishers.
      this._finishShow = this._finishShow.bind(this);
      this._finishHide = this._finishHide.bind(this);
  
      // Force item to be either visible or hidden on init.
      element.style.display = isActive ? 'block' : 'none';
  
      // Set visible/hidden class.
      addClass(element, isActive ? settings.itemVisibleClass : settings.itemHiddenClass);
  
      // Set initial styles for the child element.
      setStyles(item._child, isActive ? settings.visibleStyles : settings.hiddenStyles);
    }
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Show item.
     *
     * @public
     * @memberof ItemVisibility.prototype
     * @param {Boolean} instant
     * @param {Function} [onFinish]
     * @returns {ItemVisibility}
     */
    ItemVisibility.prototype.show = function(instant, onFinish) {
      if (this._isDestroyed) return this;
  
      var item = this._item;
      var element = item._element;
      var queue = this._queue;
      var callback = typeof onFinish === 'function' ? onFinish : null;
      var grid = item.getGrid();
      var settings = grid._settings;
  
      // If item is visible call the callback and be done with it.
      if (!this._isShowing && !this._isHidden) {
        callback && callback(false, item);
        return this;
      }
  
      // If item is showing and does not need to be shown instantly, let's just
      // push callback to the callback queue and be done with it.
      if (this._isShowing && !instant) {
        callback && queue.add(callback);
        return this;
      }
  
      // If the item is hiding or hidden process the current visibility callback
      // queue with the interrupted flag active, update classes and set display
      // to block if necessary.
      if (!this._isShowing) {
        queue.flush(true, item);
        removeClass(element, settings.itemHiddenClass);
        addClass(element, settings.itemVisibleClass);
        if (!this._isHiding) element.style.display = 'block';
      }
  
      // Push callback to the callback queue.
      callback && queue.add(callback);
  
      // Update visibility states.
      item._isActive = this._isShowing = true;
      this._isHiding = this._isHidden = false;
  
      // Finally let's start show animation.
      this._startAnimation(true, instant, this._finishShow);
  
      return this;
    };
  
    /**
     * Hide item.
     *
     * @public
     * @memberof ItemVisibility.prototype
     * @param {Boolean} instant
     * @param {Function} [onFinish]
     * @returns {ItemVisibility}
     */
    ItemVisibility.prototype.hide = function(instant, onFinish) {
      if (this._isDestroyed) return this;
  
      var item = this._item;
      var element = item._element;
      var queue = this._queue;
      var callback = typeof onFinish === 'function' ? onFinish : null;
      var grid = item.getGrid();
      var settings = grid._settings;
  
      // If item is already hidden call the callback and be done with it.
      if (!this._isHiding && this._isHidden) {
        callback && callback(false, item);
        return this;
      }
  
      // If item is hiding and does not need to be hidden instantly, let's just
      // push callback to the callback queue and be done with it.
      if (this._isHiding && !instant) {
        callback && queue.add(callback);
        return this;
      }
  
      // If the item is showing or visible process the current visibility callback
      // queue with the interrupted flag active, update classes and set display
      // to block if necessary.
      if (!this._isHiding) {
        queue.flush(true, item);
        addClass(element, settings.itemHiddenClass);
        removeClass(element, settings.itemVisibleClass);
      }
  
      // Push callback to the callback queue.
      callback && queue.add(callback);
  
      // Update visibility states.
      this._isHidden = this._isHiding = true;
      item._isActive = this._isShowing = false;
  
      // Finally let's start hide animation.
      this._startAnimation(false, instant, this._finishHide);
  
      return this;
    };
  
    /**
     * Destroy the instance and stop current animation if it is running.
     *
     * @public
     * @memberof ItemVisibility.prototype
     * @returns {ItemVisibility}
     */
    ItemVisibility.prototype.destroy = function() {
      if (this._isDestroyed) return this;
  
      var item = this._item;
      var element = item._element;
      var grid = item.getGrid();
      var queue = this._queue;
      var settings = grid._settings;
  
      // Stop visibility animation.
      this._stopAnimation({});
  
      // Fire all uncompleted callbacks with interrupted flag and destroy the queue.
      queue.flush(true, item).destroy();
  
      // Remove visible/hidden classes.
      removeClass(element, settings.itemVisibleClass);
      removeClass(element, settings.itemHiddenClass);
  
      // Reset state.
      this._item = null;
      this._isHiding = this._isShowing = false;
      this._isDestroyed = this._isHidden = true;
  
      return this;
    };
  
    /**
     * Private prototype methods
     * *************************
     */
  
    /**
     * Start visibility animation.
     *
     * @private
     * @memberof ItemVisibility.prototype
     * @param {Boolean} toVisible
     * @param {Boolean} [instant]
     * @param {Function} [onFinish]
     */
    ItemVisibility.prototype._startAnimation = function(toVisible, instant, onFinish) {
      if (this._isDestroyed) return;
  
      var item = this._item;
      var settings = item.getGrid()._settings;
      var targetStyles = toVisible ? settings.visibleStyles : settings.hiddenStyles;
      var duration = parseInt(toVisible ? settings.showDuration : settings.hideDuration) || 0;
      var easing = (toVisible ? settings.showEasing : settings.hideEasing) || 'ease';
      var isInstant = instant || duration <= 0;
      var currentStyles;
  
      // No target styles? Let's quit early.
      if (!targetStyles) {
        onFinish && onFinish();
        return;
      }
  
      // Cancel queued visibility tick.
      cancelVisibilityTick(item._id);
  
      // If we need to apply the styles instantly without animation.
      if (isInstant) {
        if (item._animateChild.isAnimating()) {
          item._animateChild.stop(targetStyles);
        } else {
          setStyles(item._child, targetStyles);
        }
        onFinish && onFinish();
        return;
      }
  
      // Start the animation in the next tick (to avoid layout thrashing).
      addVisibilityTick(
        item._id,
        function() {
          currentStyles = getCurrentStyles(item._child, targetStyles);
        },
        function() {
          item._animateChild.start(currentStyles, targetStyles, {
            duration: duration,
            easing: easing,
            onFinish: onFinish
          });
        }
      );
    };
  
    /**
     * Stop visibility animation.
     *
     * @private
     * @memberof ItemVisibility.prototype
     * @param {Object} [targetStyles]
     */
    ItemVisibility.prototype._stopAnimation = function(targetStyles) {
      if (this._isDestroyed) return;
      var item = this._item;
      cancelVisibilityTick(item._id);
      item._animateChild.stop(targetStyles);
    };
  
    /**
     * Finish show procedure.
     *
     * @private
     * @memberof ItemVisibility.prototype
     */
    ItemVisibility.prototype._finishShow = function() {
      if (this._isHidden) return;
      this._isShowing = false;
      this._queue.flush(false, this._item);
    };
  
    /**
     * Finish hide procedure.
     *
     * @private
     * @memberof ItemVisibility.prototype
     */
    var finishStyles = {};
    ItemVisibility.prototype._finishHide = function() {
      if (!this._isHidden) return;
      var item = this._item;
      this._isHiding = false;
      finishStyles.transform = getTranslateString(0, 0);
      item._layout.stop(true, finishStyles);
      item._element.style.display = 'none';
      this._queue.flush(false, item);
    };
  
    var id = 0;
  
    /**
     * Returns a unique numeric id (increments a base value on every call).
     * @returns {Number}
     */
    function createUid() {
      return ++id;
    }
  
    /**
     * Creates a new Item instance for a Grid instance.
     *
     * @class
     * @param {Grid} grid
     * @param {HTMLElement} element
     * @param {Boolean} [isActive]
     */
    function Item(grid, element, isActive) {
      var settings = grid._settings;
  
      // Create instance id.
      this._id = createUid();
  
      // Reference to connected Grid instance's id.
      this._gridId = grid._id;
  
      // Destroyed flag.
      this._isDestroyed = false;
  
      // Set up initial positions.
      this._left = 0;
      this._top = 0;
  
      // The elements.
      this._element = element;
      this._child = element.children[0];
  
      // If the provided item element is not a direct child of the grid container
      // element, append it to the grid container.
      if (element.parentNode !== grid._element) {
        grid._element.appendChild(element);
      }
  
      // Set item class.
      addClass(element, settings.itemClass);
  
      // If isActive is not defined, let's try to auto-detect it.
      if (typeof isActive !== 'boolean') {
        isActive = getStyle(element, 'display') !== 'none';
      }
  
      // Set up active state (defines if the item is considered part of the layout
      // or not).
      this._isActive = isActive;
  
      // Set element's initial position styles.
      element.style.left = '0';
      element.style.top = '0';
      element.style[transformProp] = getTranslateString(0, 0);
  
      // Initiate item's animation controllers.
      this._animate = new ItemAnimate(element);
      this._animateChild = new ItemAnimate(this._child);
  
      // Setup visibility handler.
      this._visibility = new ItemVisibility(this);
  
      // Set up layout handler.
      this._layout = new ItemLayout(this);
  
      // Set up migration handler data.
      this._migrate = new ItemMigrate(this);
  
      // Set up release handler
      this._release = new ItemRelease(this);
  
      // Set up drag handler.
      this._drag = settings.dragEnabled ? new ItemDrag(this) : null;
  
      // Set up the initial dimensions and sort data.
      this._refreshDimensions();
      this._refreshSortData();
    }
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Get the instance grid reference.
     *
     * @public
     * @memberof Item.prototype
     * @returns {Grid}
     */
    Item.prototype.getGrid = function() {
      return gridInstances[this._gridId];
    };
  
    /**
     * Get the instance element.
     *
     * @public
     * @memberof Item.prototype
     * @returns {HTMLElement}
     */
    Item.prototype.getElement = function() {
      return this._element;
    };
  
    /**
     * Get instance element's cached width.
     *
     * @public
     * @memberof Item.prototype
     * @returns {Number}
     */
    Item.prototype.getWidth = function() {
      return this._width;
    };
  
    /**
     * Get instance element's cached height.
     *
     * @public
     * @memberof Item.prototype
     * @returns {Number}
     */
    Item.prototype.getHeight = function() {
      return this._height;
    };
  
    /**
     * Get instance element's cached margins.
     *
     * @public
     * @memberof Item.prototype
     * @returns {Object}
     *   - The returned object contains left, right, top and bottom properties
     *     which indicate the item element's cached margins.
     */
    Item.prototype.getMargin = function() {
      return {
        left: this._marginLeft,
        right: this._marginRight,
        top: this._marginTop,
        bottom: this._marginBottom
      };
    };
  
    /**
     * Get instance element's cached position.
     *
     * @public
     * @memberof Item.prototype
     * @returns {Object}
     *   - The returned object contains left and top properties which indicate the
     *     item element's cached position in the grid.
     */
    Item.prototype.getPosition = function() {
      return {
        left: this._left,
        top: this._top
      };
    };
  
    /**
     * Is the item active?
     *
     * @public
     * @memberof Item.prototype
     * @returns {Boolean}
     */
    Item.prototype.isActive = function() {
      return this._isActive;
    };
  
    /**
     * Is the item visible?
     *
     * @public
     * @memberof Item.prototype
     * @returns {Boolean}
     */
    Item.prototype.isVisible = function() {
      return !!this._visibility && !this._visibility._isHidden;
    };
  
    /**
     * Is the item being animated to visible?
     *
     * @public
     * @memberof Item.prototype
     * @returns {Boolean}
     */
    Item.prototype.isShowing = function() {
      return !!(this._visibility && this._visibility._isShowing);
    };
  
    /**
     * Is the item being animated to hidden?
     *
     * @public
     * @memberof Item.prototype
     * @returns {Boolean}
     */
    Item.prototype.isHiding = function() {
      return !!(this._visibility && this._visibility._isHiding);
    };
  
    /**
     * Is the item positioning?
     *
     * @public
     * @memberof Item.prototype
     * @returns {Boolean}
     */
    Item.prototype.isPositioning = function() {
      return !!(this._layout && this._layout._isActive);
    };
  
    /**
     * Is the item being dragged?
     *
     * @public
     * @memberof Item.prototype
     * @returns {Boolean}
     */
    Item.prototype.isDragging = function() {
      return !!(this._drag && this._drag._isActive);
    };
  
    /**
     * Is the item being released?
     *
     * @public
     * @memberof Item.prototype
     * @returns {Boolean}
     */
    Item.prototype.isReleasing = function() {
      return !!(this._release && this._release._isActive);
    };
  
    /**
     * Is the item destroyed?
     *
     * @public
     * @memberof Item.prototype
     * @returns {Boolean}
     */
    Item.prototype.isDestroyed = function() {
      return this._isDestroyed;
    };
  
    /**
     * Private prototype methods
     * *************************
     */
  
    /**
     * Recalculate item's dimensions.
     *
     * @private
     * @memberof Item.prototype
     */
    Item.prototype._refreshDimensions = function() {
      if (this._isDestroyed || this._visibility._isHidden) return;
  
      var element = this._element;
      var rect = element.getBoundingClientRect();
  
      // Calculate width and height.
      this._width = rect.width;
      this._height = rect.height;
  
      // Calculate margins (ignore negative margins).
      this._marginLeft = Math.max(0, getStyleAsFloat(element, 'margin-left'));
      this._marginRight = Math.max(0, getStyleAsFloat(element, 'margin-right'));
      this._marginTop = Math.max(0, getStyleAsFloat(element, 'margin-top'));
      this._marginBottom = Math.max(0, getStyleAsFloat(element, 'margin-bottom'));
    };
  
    /**
     * Fetch and store item's sort data.
     *
     * @private
     * @memberof Item.prototype
     */
    Item.prototype._refreshSortData = function() {
      if (this._isDestroyed) return;
  
      var data = (this._sortData = {});
      var getters = this.getGrid()._settings.sortData;
      var prop;
  
      for (prop in getters) {
        data[prop] = getters[prop](this, this._element);
      }
    };
  
    /**
     * Destroy item instance.
     *
     * @private
     * @memberof Item.prototype
     * @param {Boolean} [removeElement=false]
     */
    Item.prototype._destroy = function(removeElement) {
      if (this._isDestroyed) return;
  
      var element = this._element;
      var grid = this.getGrid();
      var settings = grid._settings;
      var index = grid._items.indexOf(this);
  
      // Destroy handlers.
      this._release.destroy();
      this._migrate.destroy();
      this._layout.destroy();
      this._visibility.destroy();
      this._animate.destroy();
      this._animateChild.destroy();
      this._drag && this._drag.destroy();
  
      // Remove all inline styles.
      element.removeAttribute('style');
      this._child.removeAttribute('style');
  
      // Remove item class.
      removeClass(element, settings.itemClass);
  
      // Remove item from Grid instance if it still exists there.
      index > -1 && grid._items.splice(index, 1);
  
      // Remove element from DOM.
      removeElement && element.parentNode.removeChild(element);
  
      // Reset state.
      this._isActive = false;
      this._isDestroyed = true;
    };
  
    /**
     * This is the default layout algorithm for Muuri. Based on MAXRECTS approach
     * as described by Jukka Jylänki in his survey: "A Thousand Ways to Pack the
     * Bin - A Practical Approach to Two-Dimensional Rectangle Bin Packing.".
     *
     * @class
     */
    function Packer() {
      this._slots = [];
      this._slotSizes = [];
      this._freeSlots = [];
      this._newSlots = [];
      this._rectItem = {};
      this._rectStore = [];
      this._rectId = 0;
  
      // The layout return data, which will be populated in getLayout.
      this._layout = {
        slots: null,
        setWidth: false,
        setHeight: false,
        width: false,
        height: false
      };
  
      // Bind sort handlers.
      this._sortRectsLeftTop = this._sortRectsLeftTop.bind(this);
      this._sortRectsTopLeft = this._sortRectsTopLeft.bind(this);
    }
  
    /**
     * @public
     * @memberof Packer.prototype
     * @param {Item[]} items
     * @param {Number} width
     * @param {Number} height
     * @param {Number[]} [slots]
     * @param {Object} [options]
     * @param {Boolean} [options.fillGaps=false]
     * @param {Boolean} [options.horizontal=false]
     * @param {Boolean} [options.alignRight=false]
     * @param {Boolean} [options.alignBottom=false]
     * @returns {LayoutData}
     */
    Packer.prototype.getLayout = function(items, width, height, slots, options) {
      var layout = this._layout;
      var fillGaps = !!(options && options.fillGaps);
      var isHorizontal = !!(options && options.horizontal);
      var alignRight = !!(options && options.alignRight);
      var alignBottom = !!(options && options.alignBottom);
      var rounding = !!(options && options.rounding);
      var slotSizes = this._slotSizes;
      var i;
  
      // Reset layout data.
      layout.slots = slots ? slots : this._slots;
      layout.width = isHorizontal ? 0 : rounding ? Math.round(width) : width;
      layout.height = !isHorizontal ? 0 : rounding ? Math.round(height) : height;
      layout.setWidth = isHorizontal;
      layout.setHeight = !isHorizontal;
  
      // Make sure slots and slot size arrays are reset.
      layout.slots.length = 0;
      slotSizes.length = 0;
  
      // No need to go further if items do not exist.
      if (!items.length) return layout;
  
      // Find slots for items.
      for (i = 0; i < items.length; i++) {
        this._addSlot(items[i], isHorizontal, fillGaps, rounding, alignRight || alignBottom);
      }
  
      // If the alignment is set to right we need to adjust the results.
      if (alignRight) {
        for (i = 0; i < layout.slots.length; i = i + 2) {
          layout.slots[i] = layout.width - (layout.slots[i] + slotSizes[i]);
        }
      }
  
      // If the alignment is set to bottom we need to adjust the results.
      if (alignBottom) {
        for (i = 1; i < layout.slots.length; i = i + 2) {
          layout.slots[i] = layout.height - (layout.slots[i] + slotSizes[i]);
        }
      }
  
      // Reset slots arrays and rect id.
      slotSizes.length = 0;
      this._freeSlots.length = 0;
      this._newSlots.length = 0;
      this._rectId = 0;
  
      return layout;
    };
  
    /**
     * Calculate position for the layout item. Returns the left and top position
     * of the item in pixels.
     *
     * @private
     * @memberof Packer.prototype
     * @param {Item} item
     * @param {Boolean} isHorizontal
     * @param {Boolean} fillGaps
     * @param {Boolean} rounding
     * @returns {Array}
     */
    Packer.prototype._addSlot = (function() {
      var leeway = 0.001;
      var itemSlot = {};
      return function(item, isHorizontal, fillGaps, rounding, trackSize) {
        var layout = this._layout;
        var freeSlots = this._freeSlots;
        var newSlots = this._newSlots;
        var rect;
        var rectId;
        var potentialSlots;
        var ignoreCurrentSlots;
        var i;
        var ii;
  
        // Reset new slots.
        newSlots.length = 0;
  
        // Set item slot initial data.
        itemSlot.left = null;
        itemSlot.top = null;
        itemSlot.width = item._width + item._marginLeft + item._marginRight;
        itemSlot.height = item._height + item._marginTop + item._marginBottom;
  
        // Round item slot width and height if needed.
        if (rounding) {
          itemSlot.width = Math.round(itemSlot.width);
          itemSlot.height = Math.round(itemSlot.height);
        }
  
        // Try to find a slot for the item.
        for (i = 0; i < freeSlots.length; i++) {
          rectId = freeSlots[i];
          if (!rectId) continue;
          rect = this._getRect(rectId);
          if (itemSlot.width <= rect.width + leeway && itemSlot.height <= rect.height + leeway) {
            itemSlot.left = rect.left;
            itemSlot.top = rect.top;
            break;
          }
        }
  
        // If no slot was found for the item.
        if (itemSlot.left === null) {
          // Position the item in to the bottom left (vertical mode) or top right
          // (horizontal mode) of the grid.
          itemSlot.left = !isHorizontal ? 0 : layout.width;
          itemSlot.top = !isHorizontal ? layout.height : 0;
  
          // If gaps don't needs filling do not add any current slots to the new
          // slots array.
          if (!fillGaps) {
            ignoreCurrentSlots = true;
          }
        }
  
        // In vertical mode, if the item's bottom overlaps the grid's bottom.
        if (!isHorizontal && itemSlot.top + itemSlot.height > layout.height) {
          // If item is not aligned to the left edge, create a new slot.
          if (itemSlot.left > 0) {
            newSlots.push(this._addRect(0, layout.height, itemSlot.left, Infinity));
          }
  
          // If item is not aligned to the right edge, create a new slot.
          if (itemSlot.left + itemSlot.width < layout.width) {
            newSlots.push(
              this._addRect(
                itemSlot.left + itemSlot.width,
                layout.height,
                layout.width - itemSlot.left - itemSlot.width,
                Infinity
              )
            );
          }
  
          // Update grid height.
          layout.height = itemSlot.top + itemSlot.height;
        }
  
        // In horizontal mode, if the item's right overlaps the grid's right edge.
        if (isHorizontal && itemSlot.left + itemSlot.width > layout.width) {
          // If item is not aligned to the top, create a new slot.
          if (itemSlot.top > 0) {
            newSlots.push(this._addRect(layout.width, 0, Infinity, itemSlot.top));
          }
  
          // If item is not aligned to the bottom, create a new slot.
          if (itemSlot.top + itemSlot.height < layout.height) {
            newSlots.push(
              this._addRect(
                layout.width,
                itemSlot.top + itemSlot.height,
                Infinity,
                layout.height - itemSlot.top - itemSlot.height
              )
            );
          }
  
          // Update grid width.
          layout.width = itemSlot.left + itemSlot.width;
        }
  
        // Clean up the current slots making sure there are no old slots that
        // overlap with the item. If an old slot overlaps with the item, split it
        // into smaller slots if necessary.
        for (i = fillGaps ? 0 : ignoreCurrentSlots ? freeSlots.length : i; i < freeSlots.length; i++) {
          rectId = freeSlots[i];
          if (!rectId) continue;
          rect = this._getRect(rectId);
          potentialSlots = this._splitRect(rect, itemSlot);
          for (ii = 0; ii < potentialSlots.length; ii++) {
            rectId = potentialSlots[ii];
            rect = this._getRect(rectId);
            // Let's make sure here that we have a big enough slot
            // (width/height > 0.49px) and also let's make sure that the slot is
            // within the boundaries of the grid.
            if (
              rect.width > 0.49 &&
              rect.height > 0.49 &&
              ((!isHorizontal && rect.top < layout.height) ||
                (isHorizontal && rect.left < layout.width))
            ) {
              newSlots.push(rectId);
            }
          }
        }
  
        // Sanitize new slots.
        if (newSlots.length) {
          this._purgeRects(newSlots).sort(
            isHorizontal ? this._sortRectsLeftTop : this._sortRectsTopLeft
          );
        }
  
        // Update layout width/height.
        if (isHorizontal) {
          layout.width = Math.max(layout.width, itemSlot.left + itemSlot.width);
        } else {
          layout.height = Math.max(layout.height, itemSlot.top + itemSlot.height);
        }
  
        // Add item slot data to layout slots (and store the slot size for later
        // usage too if necessary).
        layout.slots.push(itemSlot.left, itemSlot.top);
        if (trackSize) this._slotSizes.push(itemSlot.width, itemSlot.height);
  
        // Free/new slots switcheroo!
        this._freeSlots = newSlots;
        this._newSlots = freeSlots;
      };
    })();
  
    /**
     * Add a new rectangle to the rectangle store. Returns the id of the new
     * rectangle.
     *
     * @private
     * @memberof Packer.prototype
     * @param {Number} left
     * @param {Number} top
     * @param {Number} width
     * @param {Number} height
     * @returns {RectId}
     */
    Packer.prototype._addRect = function(left, top, width, height) {
      var rectId = ++this._rectId;
      var rectStore = this._rectStore;
  
      rectStore[rectId] = left || 0;
      rectStore[++this._rectId] = top || 0;
      rectStore[++this._rectId] = width || 0;
      rectStore[++this._rectId] = height || 0;
  
      return rectId;
    };
  
    /**
     * Get rectangle data from the rectangle store by id. Optionally you can
     * provide a target object where the rectangle data will be written in. By
     * default an internal object is reused as a target object.
     *
     * @private
     * @memberof Packer.prototype
     * @param {RectId} id
     * @param {Object} [target]
     * @returns {Object}
     */
    Packer.prototype._getRect = function(id, target) {
      var rectItem = target ? target : this._rectItem;
      var rectStore = this._rectStore;
  
      rectItem.left = rectStore[id] || 0;
      rectItem.top = rectStore[++id] || 0;
      rectItem.width = rectStore[++id] || 0;
      rectItem.height = rectStore[++id] || 0;
  
      return rectItem;
    };
  
    /**
     * Punch a hole into a rectangle and split the remaining area into smaller
     * rectangles (4 at max).
     *
     * @private
     * @memberof Packer.prototype
     * @param {Rectangle} rect
     * @param {Rectangle} hole
     * @returns {RectId[]}
     */
    Packer.prototype._splitRect = (function() {
      var results = [];
      return function(rect, hole) {
        // Reset old results.
        results.length = 0;
  
        // If the rect does not overlap with the hole add rect to the return data
        // as is.
        if (!this._doRectsOverlap(rect, hole)) {
          results.push(this._addRect(rect.left, rect.top, rect.width, rect.height));
          return results;
        }
  
        // Left split.
        if (rect.left < hole.left) {
          results.push(this._addRect(rect.left, rect.top, hole.left - rect.left, rect.height));
        }
  
        // Right split.
        if (rect.left + rect.width > hole.left + hole.width) {
          results.push(
            this._addRect(
              hole.left + hole.width,
              rect.top,
              rect.left + rect.width - (hole.left + hole.width),
              rect.height
            )
          );
        }
  
        // Top split.
        if (rect.top < hole.top) {
          results.push(this._addRect(rect.left, rect.top, rect.width, hole.top - rect.top));
        }
  
        // Bottom split.
        if (rect.top + rect.height > hole.top + hole.height) {
          results.push(
            this._addRect(
              rect.left,
              hole.top + hole.height,
              rect.width,
              rect.top + rect.height - (hole.top + hole.height)
            )
          );
        }
  
        return results;
      };
    })();
  
    /**
     * Check if two rectangles overlap.
     *
     * @private
     * @memberof Packer.prototype
     * @param {Rectangle} a
     * @param {Rectangle} b
     * @returns {Boolean}
     */
    Packer.prototype._doRectsOverlap = function(a, b) {
      return !(
        a.left + a.width <= b.left ||
        b.left + b.width <= a.left ||
        a.top + a.height <= b.top ||
        b.top + b.height <= a.top
      );
    };
  
    /**
     * Check if a rectangle is fully within another rectangle.
     *
     * @private
     * @memberof Packer.prototype
     * @param {Rectangle} a
     * @param {Rectangle} b
     * @returns {Boolean}
     */
    Packer.prototype._isRectWithinRect = function(a, b) {
      return (
        a.left >= b.left &&
        a.top >= b.top &&
        a.left + a.width <= b.left + b.width &&
        a.top + a.height <= b.top + b.height
      );
    };
  
    /**
     * Loops through an array of rectangle ids and resets all that are fully
     * within another rectangle in the array. Resetting in this case means that
     * the rectangle id value is replaced with zero.
     *
     * @private
     * @memberof Packer.prototype
     * @param {RectId[]} rectIds
     * @returns {RectId[]}
     */
    Packer.prototype._purgeRects = (function() {
      var rectA = {};
      var rectB = {};
      return function(rectIds) {
        var i = rectIds.length;
        var ii;
  
        while (i--) {
          ii = rectIds.length;
          if (!rectIds[i]) continue;
          this._getRect(rectIds[i], rectA);
          while (ii--) {
            if (!rectIds[ii] || i === ii) continue;
            if (this._isRectWithinRect(rectA, this._getRect(rectIds[ii], rectB))) {
              rectIds[i] = 0;
              break;
            }
          }
        }
  
        return rectIds;
      };
    })();
  
    /**
     * Sort rectangles with top-left gravity.
     *
     * @private
     * @memberof Packer.prototype
     * @param {RectId} aId
     * @param {RectId} bId
     * @returns {Number}
     */
    Packer.prototype._sortRectsTopLeft = (function() {
      var rectA = {};
      var rectB = {};
      return function(aId, bId) {
        this._getRect(aId, rectA);
        this._getRect(bId, rectB);
        // prettier-ignore
        return rectA.top < rectB.top ? -1 :
               rectA.top > rectB.top ? 1 :
               rectA.left < rectB.left ? -1 :
               rectA.left > rectB.left ? 1 : 0;
      };
    })();
  
    /**
     * Sort rectangles with left-top gravity.
     *
     * @private
     * @memberof Packer.prototype
     * @param {RectId} aId
     * @param {RectId} bId
     * @returns {Number}
     */
    Packer.prototype._sortRectsLeftTop = (function() {
      var rectA = {};
      var rectB = {};
      return function(aId, bId) {
        this._getRect(aId, rectA);
        this._getRect(bId, rectB);
        // prettier-ignore
        return rectA.left < rectB.left ? -1 :
               rectA.left > rectB.left ? 1 :
               rectA.top < rectB.top ? -1 :
               rectA.top > rectB.top ? 1 : 0;
      };
    })();
  
    var htmlCollectionType = '[object HTMLCollection]';
    var nodeListType = '[object NodeList]';
  
    /**
     * Check if a value is a node list
     *
     * @param {*} val
     * @returns {Boolean}
     */
    function isNodeList(val) {
      var type = Object.prototype.toString.call(val);
      return type === htmlCollectionType || type === nodeListType;
    }
  
    /**
     * Converts a value to an array or clones an array.
     *
     * @param {*} target
     * @returns {Array}
     */
    function toArray(target) {
      return isNodeList(target) ? Array.prototype.slice.call(target) : Array.prototype.concat(target);
    }
  
    var packer = new Packer();
    var noop = function() {};
  
    /**
     * Creates a new Grid instance.
     *
     * @class
     * @param {(HTMLElement|String)} element
     * @param {Object} [options]
     * @param {(?HTMLElement[]|NodeList|String)} [options.items]
     * @param {Number} [options.showDuration=300]
     * @param {String} [options.showEasing="ease"]
     * @param {Object} [options.visibleStyles]
     * @param {Number} [options.hideDuration=300]
     * @param {String} [options.hideEasing="ease"]
     * @param {Object} [options.hiddenStyles]
     * @param {(Function|Object)} [options.layout]
     * @param {Boolean} [options.layout.fillGaps=false]
     * @param {Boolean} [options.layout.horizontal=false]
     * @param {Boolean} [options.layout.alignRight=false]
     * @param {Boolean} [options.layout.alignBottom=false]
     * @param {Boolean} [options.layout.rounding=true]
     * @param {(Boolean|Number)} [options.layoutOnResize=100]
     * @param {Boolean} [options.layoutOnInit=true]
     * @param {Number} [options.layoutDuration=300]
     * @param {String} [options.layoutEasing="ease"]
     * @param {?Object} [options.sortData=null]
     * @param {Boolean} [options.dragEnabled=false]
     * @param {?HtmlElement} [options.dragContainer=null]
     * @param {?Function} [options.dragStartPredicate]
     * @param {Number} [options.dragStartPredicate.distance=0]
     * @param {Number} [options.dragStartPredicate.delay=0]
     * @param {(Boolean|String)} [options.dragStartPredicate.handle=false]
     * @param {?String} [options.dragAxis]
     * @param {(Boolean|Function)} [options.dragSort=true]
     * @param {Number} [options.dragSortInterval=100]
     * @param {(Function|Object)} [options.dragSortPredicate]
     * @param {Number} [options.dragSortPredicate.threshold=50]
     * @param {String} [options.dragSortPredicate.action="move"]
     * @param {Number} [options.dragReleaseDuration=300]
     * @param {String} [options.dragReleaseEasing="ease"]
     * @param {Object} [options.dragHammerSettings={touchAction: "none"}]
     * @param {String} [options.containerClass="muuri"]
     * @param {String} [options.itemClass="muuri-item"]
     * @param {String} [options.itemVisibleClass="muuri-item-visible"]
     * @param {String} [options.itemHiddenClass="muuri-item-hidden"]
     * @param {String} [options.itemPositioningClass="muuri-item-positioning"]
     * @param {String} [options.itemDraggingClass="muuri-item-dragging"]
     * @param {String} [options.itemReleasingClass="muuri-item-releasing"]
     */
    function Grid(element, options) {
      var inst = this;
      var settings;
      var items;
      var layoutOnResize;
  
      // Allow passing element as selector string. Store element for instance.
      element = this._element = typeof element === 'string' ? document.querySelector(element) : element;
  
      // Throw an error if the container element is not body element or does not
      // exist within the body element.
      if (!document.body.contains(element)) {
        throw new Error('Container element must be an existing DOM element');
      }
  
      // Create instance settings by merging the options with default options.
      settings = this._settings = mergeSettings(Grid.defaultOptions, options);
  
      // Sanitize dragSort setting.
      if (typeof settings.dragSort !== 'function') {
        settings.dragSort = !!settings.dragSort;
      }
  
      // Create instance id and store it to the grid instances collection.
      this._id = createUid();
      gridInstances[this._id] = inst;
  
      // Destroyed flag.
      this._isDestroyed = false;
  
      // The layout object (mutated on every layout).
      this._layout = {
        id: 0,
        items: [],
        slots: [],
        setWidth: false,
        setHeight: false,
        width: 0,
        height: 0
      };
  
      // Create private Emitter instance.
      this._emitter = new Emitter();
  
      // Add container element's class name.
      addClass(element, settings.containerClass);
  
      // Create initial items.
      this._items = [];
      items = settings.items;
      if (typeof items === 'string') {
        toArray(element.children).forEach(function(itemElement) {
          if (items === '*' || elementMatches(itemElement, items)) {
            inst._items.push(new Item(inst, itemElement));
          }
        });
      } else if (Array.isArray(items) || isNodeList(items)) {
        this._items = toArray(items).map(function(itemElement) {
          return new Item(inst, itemElement);
        });
      }
  
      // If layoutOnResize option is a valid number sanitize it and bind the resize
      // handler.
      layoutOnResize = settings.layoutOnResize;
      if (typeof layoutOnResize !== 'number') {
        layoutOnResize = layoutOnResize === true ? 0 : -1;
      }
      if (layoutOnResize >= 0) {
        window.addEventListener(
          'resize',
          (inst._resizeHandler = debounce(function() {
            inst.refreshItems().layout();
          }, layoutOnResize))
        );
      }
  
      // Layout on init if necessary.
      if (settings.layoutOnInit) {
        this.layout(true);
      }
    }
  
    /**
     * Public properties
     * *****************
     */
  
    /**
     * @see Item
     */
    Grid.Item = Item;
  
    /**
     * @see ItemLayout
     */
    Grid.ItemLayout = ItemLayout;
  
    /**
     * @see ItemVisibility
     */
    Grid.ItemVisibility = ItemVisibility;
  
    /**
     * @see ItemRelease
     */
    Grid.ItemRelease = ItemRelease;
  
    /**
     * @see ItemMigrate
     */
    Grid.ItemMigrate = ItemMigrate;
  
    /**
     * @see ItemAnimate
     */
    Grid.ItemAnimate = ItemAnimate;
  
    /**
     * @see ItemDrag
     */
    Grid.ItemDrag = ItemDrag;
  
    /**
     * @see Emitter
     */
    Grid.Emitter = Emitter;
  
    /**
     * Default options for Grid instance.
     *
     * @public
     * @memberof Grid
     */
    Grid.defaultOptions = {
      // Item elements
      items: '*',
  
      // Default show animation
      showDuration: 300,
      showEasing: 'ease',
  
      // Default hide animation
      hideDuration: 300,
      hideEasing: 'ease',
  
      // Item's visible/hidden state styles
      visibleStyles: {
        opacity: '1',
        transform: 'scale(1)'
      },
      hiddenStyles: {
        opacity: '0',
        transform: 'scale(0.5)'
      },
  
      // Layout
      layout: {
        fillGaps: false,
        horizontal: false,
        alignRight: false,
        alignBottom: false,
        rounding: true
      },
      layoutOnResize: 100,
      layoutOnInit: true,
      layoutDuration: 300,
      layoutEasing: 'ease',
  
      // Sorting
      sortData: null,
  
      // Drag & Drop
      dragEnabled: false,
      dragContainer: null,
      dragStartPredicate: {
        distance: 0,
        delay: 0,
        handle: false
      },
      dragAxis: null,
      dragSort: true,
      dragSortInterval: 100,
      dragSortPredicate: {
        threshold: 50,
        action: 'move'
      },
      dragReleaseDuration: 300,
      dragReleaseEasing: 'ease',
      dragHammerSettings: {
        touchAction: 'none'
      },
  
      // Classnames
      containerClass: 'muuri',
      itemClass: 'muuri-item',
      itemVisibleClass: 'muuri-item-shown',
      itemHiddenClass: 'muuri-item-hidden',
      itemPositioningClass: 'muuri-item-positioning',
      itemDraggingClass: 'muuri-item-dragging',
      itemReleasingClass: 'muuri-item-releasing'
    };
  
    /**
     * Public prototype methods
     * ************************
     */
  
    /**
     * Bind an event listener.
     *
     * @public
     * @memberof Grid.prototype
     * @param {String} event
     * @param {Function} listener
     * @returns {Grid}
     */
    Grid.prototype.on = function(event, listener) {
      this._emitter.on(event, listener);
      return this;
    };
  
    /**
     * Bind an event listener that is triggered only once.
     *
     * @public
     * @memberof Grid.prototype
     * @param {String} event
     * @param {Function} listener
     * @returns {Grid}
     */
    Grid.prototype.once = function(event, listener) {
      this._emitter.once(event, listener);
      return this;
    };
  
    /**
     * Unbind an event listener.
     *
     * @public
     * @memberof Grid.prototype
     * @param {String} event
     * @param {Function} listener
     * @returns {Grid}
     */
    Grid.prototype.off = function(event, listener) {
      this._emitter.off(event, listener);
      return this;
    };
  
    /**
     * Get the container element.
     *
     * @public
     * @memberof Grid.prototype
     * @returns {HTMLElement}
     */
    Grid.prototype.getElement = function() {
      return this._element;
    };
  
    /**
     * Get all items. Optionally you can provide specific targets (elements and
     * indices). Note that the returned array is not the same object used by the
     * instance so modifying it will not affect instance's items. All items that
     * are not found are omitted from the returned array.
     *
     * @public
     * @memberof Grid.prototype
     * @param {GridMultiItemQuery} [targets]
     * @returns {Item[]}
     */
    Grid.prototype.getItems = function(targets) {
      // Return all items immediately if no targets were provided or if the
      // instance is destroyed.
      if (this._isDestroyed || (!targets && targets !== 0)) {
        return this._items.slice(0);
      }
  
      var ret = [];
      var targetItems = toArray(targets);
      var item;
      var i;
  
      // If target items are defined return filtered results.
      for (i = 0; i < targetItems.length; i++) {
        item = this._getItem(targetItems[i]);
        item && ret.push(item);
      }
  
      return ret;
    };
  
    /**
     * Update the cached dimensions of the instance's items.
     *
     * @public
     * @memberof Grid.prototype
     * @param {GridMultiItemQuery} [items]
     * @returns {Grid}
     */
    Grid.prototype.refreshItems = function(items) {
      if (this._isDestroyed) return this;
  
      var targets = this.getItems(items);
      var i;
  
      for (i = 0; i < targets.length; i++) {
        targets[i]._refreshDimensions();
      }
  
      return this;
    };
  
    /**
     * Update the sort data of the instance's items.
     *
     * @public
     * @memberof Grid.prototype
     * @param {GridMultiItemQuery} [items]
     * @returns {Grid}
     */
    Grid.prototype.refreshSortData = function(items) {
      if (this._isDestroyed) return this;
  
      var targetItems = this.getItems(items);
      var i;
  
      for (i = 0; i < targetItems.length; i++) {
        targetItems[i]._refreshSortData();
      }
  
      return this;
    };
  
    /**
     * Synchronize the item elements to match the order of the items in the DOM.
     * This comes handy if you need to keep the DOM structure matched with the
     * order of the items. Note that if an item's element is not currently a child
     * of the container element (if it is dragged for example) it is ignored and
     * left untouched.
     *
     * @public
     * @memberof Grid.prototype
     * @returns {Grid}
     */
    Grid.prototype.synchronize = function() {
      if (this._isDestroyed) return this;
  
      var container = this._element;
      var items = this._items;
      var fragment;
      var element;
      var i;
  
      // Append all elements in order to the container element.
      if (items.length) {
        for (i = 0; i < items.length; i++) {
          element = items[i]._element;
          if (element.parentNode === container) {
            fragment = fragment || document.createDocumentFragment();
            fragment.appendChild(element);
          }
        }
  
        if (fragment) container.appendChild(fragment);
      }
  
      // Emit synchronize event.
      this._emit(eventSynchronize);
  
      return this;
    };
  
    /**
     * Calculate and apply item positions.
     *
     * @public
     * @memberof Grid.prototype
     * @param {Boolean} [instant=false]
     * @param {LayoutCallback} [onFinish]
     * @returns {Grid}
     */
    Grid.prototype.layout = function(instant, onFinish) {
      if (this._isDestroyed) return this;
  
      var inst = this;
      var element = this._element;
      var layout = this._updateLayout();
      var layoutId = layout.id;
      var itemsLength = layout.items.length;
      var counter = itemsLength;
      var callback = typeof instant === 'function' ? instant : onFinish;
      var isCallbackFunction = typeof callback === 'function';
      var callbackItems = isCallbackFunction ? layout.items.slice(0) : null;
      var isBorderBox;
      var item;
      var i;
  
      // The finish function, which will be used for checking if all the items
      // have laid out yet. After all items have finished their animations call
      // callback and emit layoutEnd event. Only emit layoutEnd event if there
      // hasn't been a new layout call during this layout.
      function tryFinish() {
        if (--counter > 0) return;
        var hasLayoutChanged = inst._layout.id !== layoutId;
        isCallbackFunction && callback(hasLayoutChanged, callbackItems);
        if (!hasLayoutChanged && inst._hasListeners(eventLayoutEnd)) {
          inst._emit(eventLayoutEnd, layout.items.slice(0));
        }
      }
  
      // If grid's width or height was modified, we need to update it's cached
      // dimensions. Also keep in mind that grid's cached width/height should
      // always equal to what elem.getBoundingClientRect() would return, so
      // therefore we need to add the grid element's borders to the dimensions if
      // it's box-sizing is border-box.
      if (
        (layout.setHeight && typeof layout.height === 'number') ||
        (layout.setWidth && typeof layout.width === 'number')
      ) {
        isBorderBox = getStyle(element, 'box-sizing') === 'border-box';
      }
      if (layout.setHeight) {
        if (typeof layout.height === 'number') {
          element.style.height =
            (isBorderBox ? layout.height + this._borderTop + this._borderBottom : layout.height) + 'px';
        } else {
          element.style.height = layout.height;
        }
      }
      if (layout.setWidth) {
        if (typeof layout.width === 'number') {
          element.style.width =
            (isBorderBox ? layout.width + this._borderLeft + this._borderRight : layout.width) + 'px';
        } else {
          element.style.width = layout.width;
        }
      }
  
      // Emit layoutStart event. Note that this is intentionally emitted after the
      // container element's dimensions are set, because otherwise there would be
      // no hook for reacting to container dimension changes.
      if (this._hasListeners(eventLayoutStart)) {
        this._emit(eventLayoutStart, layout.items.slice(0));
      }
  
      // If there are no items let's finish quickly.
      if (!itemsLength) {
        tryFinish();
        return this;
      }
  
      // If there are items let's position them.
      for (i = 0; i < itemsLength; i++) {
        item = layout.items[i];
        if (!item) continue;
  
        // Update item's position.
        item._left = layout.slots[i * 2];
        item._top = layout.slots[i * 2 + 1];
  
        // Layout item if it is not dragged.
        item.isDragging() ? tryFinish() : item._layout.start(instant === true, tryFinish);
      }
  
      return this;
    };
  
    /**
     * Add new items by providing the elements you wish to add to the instance and
     * optionally provide the index where you want the items to be inserted into.
     * All elements that are not already children of the container element will be
     * automatically appended to the container element. If an element has it's CSS
     * display property set to "none" it will be marked as inactive during the
     * initiation process. As long as the item is inactive it will not be part of
     * the layout, but it will retain it's index. You can activate items at any
     * point with grid.show() method. This method will automatically call
     * grid.layout() if one or more of the added elements are visible. If only
     * hidden items are added no layout will be called. All the new visible items
     * are positioned without animation during their first layout.
     *
     * @public
     * @memberof Grid.prototype
     * @param {(HTMLElement|HTMLElement[])} elements
     * @param {Object} [options]
     * @param {Number} [options.index=-1]
     * @param {Boolean} [options.isActive]
     * @param {(Boolean|LayoutCallback|String)} [options.layout=true]
     * @returns {Item[]}
     */
    Grid.prototype.add = function(elements, options) {
      if (this._isDestroyed || !elements) return [];
  
      var newItems = toArray(elements);
      if (!newItems.length) return newItems;
  
      var opts = options || 0;
      var layout = opts.layout ? opts.layout : opts.layout === undefined;
      var items = this._items;
      var needsLayout = false;
      var item;
      var i;
  
      // Map provided elements into new grid items.
      for (i = 0; i < newItems.length; i++) {
        item = new Item(this, newItems[i], opts.isActive);
        newItems[i] = item;
  
        // If the item to be added is active, we need to do a layout. Also, we
        // need to mark the item with the skipNextAnimation flag to make it
        // position instantly (without animation) during the next layout. Without
        // the hack the item would animate to it's new position from the northwest
        // corner of the grid, which feels a bit buggy (imho).
        if (item._isActive) {
          needsLayout = true;
          item._layout._skipNextAnimation = true;
        }
      }
  
      // Add the new items to the items collection to correct index.
      arrayInsert(items, newItems, opts.index);
  
      // Emit add event.
      if (this._hasListeners(eventAdd)) {
        this._emit(eventAdd, newItems.slice(0));
      }
  
      // If layout is needed.
      if (needsLayout && layout) {
        this.layout(layout === 'instant', typeof layout === 'function' ? layout : undefined);
      }
  
      return newItems;
    };
  
    /**
     * Remove items from the instance.
     *
     * @public
     * @memberof Grid.prototype
     * @param {GridMultiItemQuery} items
     * @param {Object} [options]
     * @param {Boolean} [options.removeElements=false]
     * @param {(Boolean|LayoutCallback|String)} [options.layout=true]
     * @returns {Item[]}
     */
    Grid.prototype.remove = function(items, options) {
      if (this._isDestroyed) return this;
  
      var opts = options || 0;
      var layout = opts.layout ? opts.layout : opts.layout === undefined;
      var needsLayout = false;
      var allItems = this.getItems();
      var targetItems = this.getItems(items);
      var indices = [];
      var item;
      var i;
  
      // Remove the individual items.
      for (i = 0; i < targetItems.length; i++) {
        item = targetItems[i];
        indices.push(allItems.indexOf(item));
        if (item._isActive) needsLayout = true;
        item._destroy(opts.removeElements);
      }
  
      // Emit remove event.
      if (this._hasListeners(eventRemove)) {
        this._emit(eventRemove, targetItems.slice(0), indices);
      }
  
      // If layout is needed.
      if (needsLayout && layout) {
        this.layout(layout === 'instant', typeof layout === 'function' ? layout : undefined);
      }
  
      return targetItems;
    };
  
    /**
     * Show instance items.
     *
     * @public
     * @memberof Grid.prototype
     * @param {GridMultiItemQuery} items
     * @param {Object} [options]
     * @param {Boolean} [options.instant=false]
     * @param {ShowCallback} [options.onFinish]
     * @param {(Boolean|LayoutCallback|String)} [options.layout=true]
     * @returns {Grid}
     */
    Grid.prototype.show = function(items, options) {
      if (this._isDestroyed) return this;
      this._setItemsVisibility(items, true, options);
      return this;
    };
  
    /**
     * Hide instance items.
     *
     * @public
     * @memberof Grid.prototype
     * @param {GridMultiItemQuery} items
     * @param {Object} [options]
     * @param {Boolean} [options.instant=false]
     * @param {HideCallback} [options.onFinish]
     * @param {(Boolean|LayoutCallback|String)} [options.layout=true]
     * @returns {Grid}
     */
    Grid.prototype.hide = function(items, options) {
      if (this._isDestroyed) return this;
      this._setItemsVisibility(items, false, options);
      return this;
    };
  
    /**
     * Filter items. Expects at least one argument, a predicate, which should be
     * either a function or a string. The predicate callback is executed for every
     * item in the instance. If the return value of the predicate is truthy the
     * item in question will be shown and otherwise hidden. The predicate callback
     * receives the item instance as it's argument. If the predicate is a string
     * it is considered to be a selector and it is checked against every item
     * element in the instance with the native element.matches() method. All the
     * matching items will be shown and others hidden.
     *
     * @public
     * @memberof Grid.prototype
     * @param {(Function|String)} predicate
     * @param {Object} [options]
     * @param {Boolean} [options.instant=false]
     * @param {FilterCallback} [options.onFinish]
     * @param {(Boolean|LayoutCallback|String)} [options.layout=true]
     * @returns {Grid}
     */
    Grid.prototype.filter = function(predicate, options) {
      if (this._isDestroyed || !this._items.length) return this;
  
      var itemsToShow = [];
      var itemsToHide = [];
      var isPredicateString = typeof predicate === 'string';
      var isPredicateFn = typeof predicate === 'function';
      var opts = options || 0;
      var isInstant = opts.instant === true;
      var layout = opts.layout ? opts.layout : opts.layout === undefined;
      var onFinish = typeof opts.onFinish === 'function' ? opts.onFinish : null;
      var tryFinishCounter = -1;
      var tryFinish = noop;
      var item;
      var i;
  
      // If we have onFinish callback, let's create proper tryFinish callback.
      if (onFinish) {
        tryFinish = function() {
          ++tryFinishCounter && onFinish(itemsToShow.slice(0), itemsToHide.slice(0));
        };
      }
  
      // Check which items need to be shown and which hidden.
      if (isPredicateFn || isPredicateString) {
        for (i = 0; i < this._items.length; i++) {
          item = this._items[i];
          if (isPredicateFn ? predicate(item) : elementMatches(item._element, predicate)) {
            itemsToShow.push(item);
          } else {
            itemsToHide.push(item);
          }
        }
      }
  
      // Show items that need to be shown.
      if (itemsToShow.length) {
        this.show(itemsToShow, {
          instant: isInstant,
          onFinish: tryFinish,
          layout: false
        });
      } else {
        tryFinish();
      }
  
      // Hide items that need to be hidden.
      if (itemsToHide.length) {
        this.hide(itemsToHide, {
          instant: isInstant,
          onFinish: tryFinish,
          layout: false
        });
      } else {
        tryFinish();
      }
  
      // If there are any items to filter.
      if (itemsToShow.length || itemsToHide.length) {
        // Emit filter event.
        if (this._hasListeners(eventFilter)) {
          this._emit(eventFilter, itemsToShow.slice(0), itemsToHide.slice(0));
        }
  
        // If layout is needed.
        if (layout) {
          this.layout(layout === 'instant', typeof layout === 'function' ? layout : undefined);
        }
      }
  
      return this;
    };
  
    /**
     * Sort items. There are three ways to sort the items. The first is simply by
     * providing a function as the comparer which works identically to native
     * array sort. Alternatively you can sort by the sort data you have provided
     * in the instance's options. Just provide the sort data key(s) as a string
     * (separated by space) and the items will be sorted based on the provided
     * sort data keys. Lastly you have the opportunity to provide a presorted
     * array of items which will be used to sync the internal items array in the
     * same order.
     *
     * @public
     * @memberof Grid.prototype
     * @param {(Function|Item[]|String|String[])} comparer
     * @param {Object} [options]
     * @param {Boolean} [options.descending=false]
     * @param {(Boolean|LayoutCallback|String)} [options.layout=true]
     * @returns {Grid}
     */
    Grid.prototype.sort = (function() {
      var sortComparer;
      var isDescending;
      var origItems;
      var indexMap;
  
      function parseCriteria(data) {
        return data
          .trim()
          .split(' ')
          .map(function(val) {
            return val.split(':');
          });
      }
  
      function getIndexMap(items) {
        var ret = {};
        for (var i = 0; i < items.length; i++) {
          ret[items[i]._id] = i;
        }
        return ret;
      }
  
      function compareIndices(itemA, itemB) {
        var indexA = indexMap[itemA._id];
        var indexB = indexMap[itemB._id];
        return isDescending ? indexB - indexA : indexA - indexB;
      }
  
      function defaultComparer(a, b) {
        var result = 0;
        var criteriaName;
        var criteriaOrder;
        var valA;
        var valB;
  
        // Loop through the list of sort criteria.
        for (var i = 0; i < sortComparer.length; i++) {
          // Get the criteria name, which should match an item's sort data key.
          criteriaName = sortComparer[i][0];
          criteriaOrder = sortComparer[i][1];
  
          // Get items' cached sort values for the criteria. If the item has no sort
          // data let's update the items sort data (this is a lazy load mechanism).
          valA = (a._sortData ? a : a._refreshSortData())._sortData[criteriaName];
          valB = (b._sortData ? b : b._refreshSortData())._sortData[criteriaName];
  
          // Sort the items in descending order if defined so explicitly. Otherwise
          // sort items in ascending order.
          if (criteriaOrder === 'desc' || (!criteriaOrder && isDescending)) {
            result = valB < valA ? -1 : valB > valA ? 1 : 0;
          } else {
            result = valA < valB ? -1 : valA > valB ? 1 : 0;
          }
  
          // If we have -1 or 1 as the return value, let's return it immediately.
          if (result) return result;
        }
  
        // If values are equal let's compare the item indices to make sure we
        // have a stable sort.
        if (!result) {
          if (!indexMap) indexMap = getIndexMap(origItems);
          result = compareIndices(a, b);
        }
        return result;
      }
  
      function customComparer(a, b) {
        var result = sortComparer(a, b);
        // If descending let's invert the result value.
        if (isDescending && result) result = -result;
        // If we have a valid result (not zero) let's return it right away.
        if (result) return result;
        // If result is zero let's compare the item indices to make sure we have a
        // stable sort.
        if (!indexMap) indexMap = getIndexMap(origItems);
        return compareIndices(a, b);
      }
  
      return function(comparer, options) {
        if (this._isDestroyed || this._items.length < 2) return this;
  
        var items = this._items;
        var opts = options || 0;
        var layout = opts.layout ? opts.layout : opts.layout === undefined;
        var i;
  
        // Setup parent scope data.
        sortComparer = comparer;
        isDescending = !!opts.descending;
        origItems = items.slice(0);
        indexMap = null;
  
        // If function is provided do a native array sort.
        if (typeof sortComparer === 'function') {
          items.sort(customComparer);
        }
        // Otherwise if we got a string, let's sort by the sort data as provided in
        // the instance's options.
        else if (typeof sortComparer === 'string') {
          sortComparer = parseCriteria(comparer);
          items.sort(defaultComparer);
        }
        // Otherwise if we got an array, let's assume it's a presorted array of the
        // items and order the items based on it.
        else if (Array.isArray(sortComparer)) {
          if (sortComparer.length !== items.length) {
            throw new Error('[' + namespace + '] sort reference items do not match with grid items.');
          }
          for (i = 0; i < items.length; i++) {
            if (sortComparer.indexOf(items[i]) < 0) {
              throw new Error('[' + namespace + '] sort reference items do not match with grid items.');
            }
            items[i] = sortComparer[i];
          }
          if (isDescending) items.reverse();
        }
        // Otherwise let's just skip it, nothing we can do here.
        else {
          /** @todo Maybe throw an error here? */
          return this;
        }
  
        // Emit sort event.
        if (this._hasListeners(eventSort)) {
          this._emit(eventSort, items.slice(0), origItems);
        }
  
        // If layout is needed.
        if (layout) {
          this.layout(layout === 'instant', typeof layout === 'function' ? layout : undefined);
        }
  
        return this;
      };
    })();
  
    /**
     * Move item to another index or in place of another item.
     *
     * @public
     * @memberof Grid.prototype
     * @param {GridSingleItemQuery} item
     * @param {GridSingleItemQuery} position
     * @param {Object} [options]
     * @param {String} [options.action="move"]
     *   - Accepts either "move" or "swap".
     *   - "move" moves the item in place of the other item.
     *   - "swap" swaps the position of the items.
     * @param {(Boolean|LayoutCallback|String)} [options.layout=true]
     * @returns {Grid}
     */
    Grid.prototype.move = function(item, position, options) {
      if (this._isDestroyed || this._items.length < 2) return this;
  
      var items = this._items;
      var opts = options || 0;
      var layout = opts.layout ? opts.layout : opts.layout === undefined;
      var isSwap = opts.action === 'swap';
      var action = isSwap ? 'swap' : 'move';
      var fromItem = this._getItem(item);
      var toItem = this._getItem(position);
      var fromIndex;
      var toIndex;
  
      // Make sure the items exist and are not the same.
      if (fromItem && toItem && fromItem !== toItem) {
        // Get the indices of the items.
        fromIndex = items.indexOf(fromItem);
        toIndex = items.indexOf(toItem);
  
        // Do the move/swap.
        if (isSwap) {
          arraySwap(items, fromIndex, toIndex);
        } else {
          arrayMove(items, fromIndex, toIndex);
        }
  
        // Emit move event.
        if (this._hasListeners(eventMove)) {
          this._emit(eventMove, {
            item: fromItem,
            fromIndex: fromIndex,
            toIndex: toIndex,
            action: action
          });
        }
  
        // If layout is needed.
        if (layout) {
          this.layout(layout === 'instant', typeof layout === 'function' ? layout : undefined);
        }
      }
  
      return this;
    };
  
    /**
     * Send item to another Grid instance.
     *
     * @public
     * @memberof Grid.prototype
     * @param {GridSingleItemQuery} item
     * @param {Grid} grid
     * @param {GridSingleItemQuery} position
     * @param {Object} [options]
     * @param {HTMLElement} [options.appendTo=document.body]
     * @param {(Boolean|LayoutCallback|String)} [options.layoutSender=true]
     * @param {(Boolean|LayoutCallback|String)} [options.layoutReceiver=true]
     * @returns {Grid}
     */
    Grid.prototype.send = function(item, grid, position, options) {
      if (this._isDestroyed || grid._isDestroyed || this === grid) return this;
  
      // Make sure we have a valid target item.
      item = this._getItem(item);
      if (!item) return this;
  
      var opts = options || 0;
      var container = opts.appendTo || document.body;
      var layoutSender = opts.layoutSender ? opts.layoutSender : opts.layoutSender === undefined;
      var layoutReceiver = opts.layoutReceiver
        ? opts.layoutReceiver
        : opts.layoutReceiver === undefined;
  
      // Start the migration process.
      item._migrate.start(grid, position, container);
  
      // If migration was started successfully and the item is active, let's layout
      // the grids.
      if (item._migrate._isActive && item._isActive) {
        if (layoutSender) {
          this.layout(
            layoutSender === 'instant',
            typeof layoutSender === 'function' ? layoutSender : undefined
          );
        }
        if (layoutReceiver) {
          grid.layout(
            layoutReceiver === 'instant',
            typeof layoutReceiver === 'function' ? layoutReceiver : undefined
          );
        }
      }
  
      return this;
    };
  
    /**
     * Destroy the instance.
     *
     * @public
     * @memberof Grid.prototype
     * @param {Boolean} [removeElements=false]
     * @returns {Grid}
     */
    Grid.prototype.destroy = function(removeElements) {
      if (this._isDestroyed) return this;
  
      var container = this._element;
      var items = this._items.slice(0);
      var i;
  
      // Unbind window resize event listener.
      if (this._resizeHandler) {
        window.removeEventListener('resize', this._resizeHandler);
      }
  
      // Destroy items.
      for (i = 0; i < items.length; i++) {
        items[i]._destroy(removeElements);
      }
  
      // Restore container.
      removeClass(container, this._settings.containerClass);
      container.style.height = '';
      container.style.width = '';
  
      // Emit destroy event and unbind all events.
      this._emit(eventDestroy);
      this._emitter.destroy();
  
      // Remove reference from the grid instances collection.
      gridInstances[this._id] = undefined;
  
      // Flag instance as destroyed.
      this._isDestroyed = true;
  
      return this;
    };
  
    /**
     * Private prototype methods
     * *************************
     */
  
    /**
     * Get instance's item by element or by index. Target can also be an Item
     * instance in which case the function returns the item if it exists within
     * related Grid instance. If nothing is found with the provided target, null
     * is returned.
     *
     * @private
     * @memberof Grid.prototype
     * @param {GridSingleItemQuery} [target]
     * @returns {?Item}
     */
    Grid.prototype._getItem = function(target) {
      // If no target is specified or the instance is destroyed, return null.
      if (this._isDestroyed || (!target && target !== 0)) {
        return null;
      }
  
      // If target is number return the item in that index. If the number is lower
      // than zero look for the item starting from the end of the items array. For
      // example -1 for the last item, -2 for the second last item, etc.
      if (typeof target === 'number') {
        return this._items[target > -1 ? target : this._items.length + target] || null;
      }
  
      // If the target is an instance of Item return it if it is attached to this
      // Grid instance, otherwise return null.
      if (target instanceof Item) {
        return target._gridId === this._id ? target : null;
      }
  
      // In other cases let's assume that the target is an element, so let's try
      // to find an item that matches the element and return it. If item is not
      // found return null.
      /** @todo This could be made a lot faster by using Map/WeakMap of elements. */
      for (var i = 0; i < this._items.length; i++) {
        if (this._items[i]._element === target) {
          return this._items[i];
        }
      }
  
      return null;
    };
  
    /**
     * Recalculates and updates instance's layout data.
     *
     * @private
     * @memberof Grid.prototype
     * @returns {LayoutData}
     */
    Grid.prototype._updateLayout = function() {
      var layout = this._layout;
      var settings = this._settings.layout;
      var width;
      var height;
      var newLayout;
      var i;
  
      // Let's increment layout id.
      ++layout.id;
  
      // Let's update layout items
      layout.items.length = 0;
      for (i = 0; i < this._items.length; i++) {
        if (this._items[i]._isActive) layout.items.push(this._items[i]);
      }
  
      // Let's make sure we have the correct container dimensions.
      this._refreshDimensions();
  
      // Calculate container width and height (without borders).
      width = this._width - this._borderLeft - this._borderRight;
      height = this._height - this._borderTop - this._borderBottom;
  
      // Calculate new layout.
      if (typeof settings === 'function') {
        newLayout = settings(layout.items, width, height);
      } else {
        newLayout = packer.getLayout(layout.items, width, height, layout.slots, settings);
      }
  
      // Let's update the grid's layout.
      layout.slots = newLayout.slots;
      layout.setWidth = Boolean(newLayout.setWidth);
      layout.setHeight = Boolean(newLayout.setHeight);
      layout.width = newLayout.width;
      layout.height = newLayout.height;
  
      return layout;
    };
  
    /**
     * Emit a grid event.
     *
     * @private
     * @memberof Grid.prototype
     * @param {String} event
     * @param {...*} [arg]
     */
    Grid.prototype._emit = function() {
      if (this._isDestroyed) return;
      this._emitter.emit.apply(this._emitter, arguments);
    };
  
    /**
     * Check if there are any events listeners for an event.
     *
     * @private
     * @memberof Grid.prototype
     * @param {String} event
     * @returns {Boolean}
     */
    Grid.prototype._hasListeners = function(event) {
      var listeners = this._emitter._events[event];
      return !!(listeners && listeners.length);
    };
  
    /**
     * Update container's width, height and offsets.
     *
     * @private
     * @memberof Grid.prototype
     */
    Grid.prototype._updateBoundingRect = function() {
      var element = this._element;
      var rect = element.getBoundingClientRect();
      this._width = rect.width;
      this._height = rect.height;
      this._left = rect.left;
      this._top = rect.top;
    };
  
    /**
     * Update container's border sizes.
     *
     * @private
     * @memberof Grid.prototype
     * @param {Boolean} left
     * @param {Boolean} right
     * @param {Boolean} top
     * @param {Boolean} bottom
     */
    Grid.prototype._updateBorders = function(left, right, top, bottom) {
      var element = this._element;
      if (left) this._borderLeft = getStyleAsFloat(element, 'border-left-width');
      if (right) this._borderRight = getStyleAsFloat(element, 'border-right-width');
      if (top) this._borderTop = getStyleAsFloat(element, 'border-top-width');
      if (bottom) this._borderBottom = getStyleAsFloat(element, 'border-bottom-width');
    };
  
    /**
     * Refresh all of container's internal dimensions and offsets.
     *
     * @private
     * @memberof Grid.prototype
     */
    Grid.prototype._refreshDimensions = function() {
      this._updateBoundingRect();
      this._updateBorders(1, 1, 1, 1);
    };
  
    /**
     * Show or hide Grid instance's items.
     *
     * @private
     * @memberof Grid.prototype
     * @param {GridMultiItemQuery} items
     * @param {Boolean} toVisible
     * @param {Object} [options]
     * @param {Boolean} [options.instant=false]
     * @param {(ShowCallback|HideCallback)} [options.onFinish]
     * @param {(Boolean|LayoutCallback|String)} [options.layout=true]
     */
    Grid.prototype._setItemsVisibility = function(items, toVisible, options) {
      var grid = this;
      var targetItems = this.getItems(items);
      var opts = options || 0;
      var isInstant = opts.instant === true;
      var callback = opts.onFinish;
      var layout = opts.layout ? opts.layout : opts.layout === undefined;
      var counter = targetItems.length;
      var startEvent = toVisible ? eventShowStart : eventHideStart;
      var endEvent = toVisible ? eventShowEnd : eventHideEnd;
      var method = toVisible ? 'show' : 'hide';
      var needsLayout = false;
      var completedItems = [];
      var hiddenItems = [];
      var item;
      var i;
  
      // If there are no items call the callback, but don't emit any events.
      if (!counter) {
        if (typeof callback === 'function') callback(targetItems);
        return;
      }
  
      // Emit showStart/hideStart event.
      if (this._hasListeners(startEvent)) {
        this._emit(startEvent, targetItems.slice(0));
      }
  
      // Show/hide items.
      for (i = 0; i < targetItems.length; i++) {
        item = targetItems[i];
  
        // If inactive item is shown or active item is hidden we need to do
        // layout.
        if ((toVisible && !item._isActive) || (!toVisible && item._isActive)) {
          needsLayout = true;
        }
  
        // If inactive item is shown we also need to do a little hack to make the
        // item not animate it's next positioning (layout).
        if (toVisible && !item._isActive) {
          item._layout._skipNextAnimation = true;
        }
  
        // If a hidden item is being shown we need to refresh the item's
        // dimensions.
        if (toVisible && item._visibility._isHidden) {
          hiddenItems.push(item);
        }
  
        // Show/hide the item.
        item._visibility[method](isInstant, function(interrupted, item) {
          // If the current item's animation was not interrupted add it to the
          // completedItems array.
          if (!interrupted) completedItems.push(item);
  
          // If all items have finished their animations call the callback
          // and emit showEnd/hideEnd event.
          if (--counter < 1) {
            if (typeof callback === 'function') callback(completedItems.slice(0));
            if (grid._hasListeners(endEvent)) grid._emit(endEvent, completedItems.slice(0));
          }
        });
      }
  
      // Refresh hidden items.
      if (hiddenItems.length) this.refreshItems(hiddenItems);
  
      // Layout if needed.
      if (needsLayout && layout) {
        this.layout(layout === 'instant', typeof layout === 'function' ? layout : undefined);
      }
    };
  
    /**
     * Private helpers
     * ***************
     */
  
    /**
     * Merge default settings with user settings. The returned object is a new
     * object with merged values. The merging is a deep merge meaning that all
     * objects and arrays within the provided settings objects will be also merged
     * so that modifying the values of the settings object will have no effect on
     * the returned object.
     *
     * @param {Object} defaultSettings
     * @param {Object} [userSettings]
     * @returns {Object} Returns a new object.
     */
    function mergeSettings(defaultSettings, userSettings) {
      // Create a fresh copy of default settings.
      var ret = mergeObjects({}, defaultSettings);
  
      // Merge user settings to default settings.
      if (userSettings) {
        ret = mergeObjects(ret, userSettings);
      }
  
      // Handle visible/hidden styles manually so that the whole object is
      // overridden instead of the props.
      ret.visibleStyles = (userSettings || 0).visibleStyles || (defaultSettings || 0).visibleStyles;
      ret.hiddenStyles = (userSettings || 0).hiddenStyles || (defaultSettings || 0).hiddenStyles;
  
      return ret;
    }
  
    /**
     * Merge two objects recursively (deep merge). The source object's properties
     * are merged to the target object.
     *
     * @param {Object} target
     *   - The target object.
     * @param {Object} source
     *   - The source object.
     * @returns {Object} Returns the target object.
     */
    function mergeObjects(target, source) {
      var sourceKeys = Object.keys(source);
      var length = sourceKeys.length;
      var isSourceObject;
      var propName;
      var i;
  
      for (i = 0; i < length; i++) {
        propName = sourceKeys[i];
        isSourceObject = isPlainObject(source[propName]);
  
        // If target and source values are both objects, merge the objects and
        // assign the merged value to the target property.
        if (isPlainObject(target[propName]) && isSourceObject) {
          target[propName] = mergeObjects(mergeObjects({}, target[propName]), source[propName]);
          continue;
        }
  
        // If source's value is object and target's is not let's clone the object as
        // the target's value.
        if (isSourceObject) {
          target[propName] = mergeObjects({}, source[propName]);
          continue;
        }
  
        // If source's value is an array let's clone the array as the target's
        // value.
        if (Array.isArray(source[propName])) {
          target[propName] = source[propName].slice(0);
          continue;
        }
  
        // In all other cases let's just directly assign the source's value as the
        // target's value.
        target[propName] = source[propName];
      }
  
      return target;
    }
  
    return Grid;
  
  })));

/*! PhotoSwipe - v4.1.2 - 2017-04-05
* http://photoswipe.com
* Copyright (c) 2017 Dmitry Semenov; */
(function (root, factory) { 
	if (typeof define === 'function' && define.amd) {
		define(factory);
	} else if (typeof exports === 'object') {
		module.exports = factory();
	} else {
		root.PhotoSwipe = factory();
	}
})(this, function () {

	'use strict';
	var PhotoSwipe = function(template, UiClass, items, options){

/*>>framework-bridge*/
/**
 *
 * Set of generic functions used by gallery.
 * 
 * You're free to modify anything here as long as functionality is kept.
 * 
 */
var framework = {
	features: null,
	bind: function(target, type, listener, unbind) {
		var methodName = (unbind ? 'remove' : 'add') + 'EventListener';
		type = type.split(' ');
		for(var i = 0; i < type.length; i++) {
			if(type[i]) {
				target[methodName]( type[i], listener, false);
			}
		}
	},
	isArray: function(obj) {
		return (obj instanceof Array);
	},
	createEl: function(classes, tag) {
		var el = document.createElement(tag || 'div');
		if(classes) {
			el.className = classes;
		}
		return el;
	},
	getScrollY: function() {
		var yOffset = window.pageYOffset;
		return yOffset !== undefined ? yOffset : document.documentElement.scrollTop;
	},
	unbind: function(target, type, listener) {
		framework.bind(target,type,listener,true);
	},
	removeClass: function(el, className) {
		var reg = new RegExp('(\\s|^)' + className + '(\\s|$)');
		el.className = el.className.replace(reg, ' ').replace(/^\s\s*/, '').replace(/\s\s*$/, ''); 
	},
	addClass: function(el, className) {
		if( !framework.hasClass(el,className) ) {
			el.className += (el.className ? ' ' : '') + className;
		}
	},
	hasClass: function(el, className) {
		return el.className && new RegExp('(^|\\s)' + className + '(\\s|$)').test(el.className);
	},
	getChildByClass: function(parentEl, childClassName) {
		var node = parentEl.firstChild;
		while(node) {
			if( framework.hasClass(node, childClassName) ) {
				return node;
			}
			node = node.nextSibling;
		}
	},
	arraySearch: function(array, value, key) {
		var i = array.length;
		while(i--) {
			if(array[i][key] === value) {
				return i;
			} 
		}
		return -1;
	},
	extend: function(o1, o2, preventOverwrite) {
		for (var prop in o2) {
			if (o2.hasOwnProperty(prop)) {
				if(preventOverwrite && o1.hasOwnProperty(prop)) {
					continue;
				}
				o1[prop] = o2[prop];
			}
		}
	},
	easing: {
		sine: {
			out: function(k) {
				return Math.sin(k * (Math.PI / 2));
			},
			inOut: function(k) {
				return - (Math.cos(Math.PI * k) - 1) / 2;
			}
		},
		cubic: {
			out: function(k) {
				return --k * k * k + 1;
			}
		}
		/*
			elastic: {
				out: function ( k ) {

					var s, a = 0.1, p = 0.4;
					if ( k === 0 ) return 0;
					if ( k === 1 ) return 1;
					if ( !a || a < 1 ) { a = 1; s = p / 4; }
					else s = p * Math.asin( 1 / a ) / ( 2 * Math.PI );
					return ( a * Math.pow( 2, - 10 * k) * Math.sin( ( k - s ) * ( 2 * Math.PI ) / p ) + 1 );

				},
			},
			back: {
				out: function ( k ) {
					var s = 1.70158;
					return --k * k * ( ( s + 1 ) * k + s ) + 1;
				}
			}
		*/
	},

	/**
	 * 
	 * @return {object}
	 * 
	 * {
	 *  raf : request animation frame function
	 *  caf : cancel animation frame function
	 *  transfrom : transform property key (with vendor), or null if not supported
	 *  oldIE : IE8 or below
	 * }
	 * 
	 */
	detectFeatures: function() {
		if(framework.features) {
			return framework.features;
		}
		var helperEl = framework.createEl(),
			helperStyle = helperEl.style,
			vendor = '',
			features = {};

		// IE8 and below
		features.oldIE = document.all && !document.addEventListener;

		features.touch = 'ontouchstart' in window;

		if(window.requestAnimationFrame) {
			features.raf = window.requestAnimationFrame;
			features.caf = window.cancelAnimationFrame;
		}

		features.pointerEvent = navigator.pointerEnabled || navigator.msPointerEnabled;

		// fix false-positive detection of old Android in new IE
		// (IE11 ua string contains "Android 4.0")
		
		if(!features.pointerEvent) { 

			var ua = navigator.userAgent;

			// Detect if device is iPhone or iPod and if it's older than iOS 8
			// http://stackoverflow.com/a/14223920
			// 
			// This detection is made because of buggy top/bottom toolbars
			// that don't trigger window.resize event.
			// For more info refer to _isFixedPosition variable in core.js

			if (/iP(hone|od)/.test(navigator.platform)) {
				var v = (navigator.appVersion).match(/OS (\d+)_(\d+)_?(\d+)?/);
				if(v && v.length > 0) {
					v = parseInt(v[1], 10);
					if(v >= 1 && v < 8 ) {
						features.isOldIOSPhone = true;
					}
				}
			}

			// Detect old Android (before KitKat)
			// due to bugs related to position:fixed
			// http://stackoverflow.com/questions/7184573/pick-up-the-android-version-in-the-browser-by-javascript
			
			var match = ua.match(/Android\s([0-9\.]*)/);
			var androidversion =  match ? match[1] : 0;
			androidversion = parseFloat(androidversion);
			if(androidversion >= 1 ) {
				if(androidversion < 4.4) {
					features.isOldAndroid = true; // for fixed position bug & performance
				}
				features.androidVersion = androidversion; // for touchend bug
			}	
			features.isMobileOpera = /opera mini|opera mobi/i.test(ua);

			// p.s. yes, yes, UA sniffing is bad, propose your solution for above bugs.
		}
		
		var styleChecks = ['transform', 'perspective', 'animationName'],
			vendors = ['', 'webkit','Moz','ms','O'],
			styleCheckItem,
			styleName;

		for(var i = 0; i < 4; i++) {
			vendor = vendors[i];

			for(var a = 0; a < 3; a++) {
				styleCheckItem = styleChecks[a];

				// uppercase first letter of property name, if vendor is present
				styleName = vendor + (vendor ? 
										styleCheckItem.charAt(0).toUpperCase() + styleCheckItem.slice(1) : 
										styleCheckItem);
			
				if(!features[styleCheckItem] && styleName in helperStyle ) {
					features[styleCheckItem] = styleName;
				}
			}

			if(vendor && !features.raf) {
				vendor = vendor.toLowerCase();
				features.raf = window[vendor+'RequestAnimationFrame'];
				if(features.raf) {
					features.caf = window[vendor+'CancelAnimationFrame'] || 
									window[vendor+'CancelRequestAnimationFrame'];
				}
			}
		}
			
		if(!features.raf) {
			var lastTime = 0;
			features.raf = function(fn) {
				var currTime = new Date().getTime();
				var timeToCall = Math.max(0, 16 - (currTime - lastTime));
				var id = window.setTimeout(function() { fn(currTime + timeToCall); }, timeToCall);
				lastTime = currTime + timeToCall;
				return id;
			};
			features.caf = function(id) { clearTimeout(id); };
		}

		// Detect SVG support
		features.svg = !!document.createElementNS && 
						!!document.createElementNS('http://www.w3.org/2000/svg', 'svg').createSVGRect;

		framework.features = features;

		return features;
	}
};

framework.detectFeatures();

// Override addEventListener for old versions of IE
if(framework.features.oldIE) {

	framework.bind = function(target, type, listener, unbind) {
		
		type = type.split(' ');

		var methodName = (unbind ? 'detach' : 'attach') + 'Event',
			evName,
			_handleEv = function() {
				listener.handleEvent.call(listener);
			};

		for(var i = 0; i < type.length; i++) {
			evName = type[i];
			if(evName) {

				if(typeof listener === 'object' && listener.handleEvent) {
					if(!unbind) {
						listener['oldIE' + evName] = _handleEv;
					} else {
						if(!listener['oldIE' + evName]) {
							return false;
						}
					}

					target[methodName]( 'on' + evName, listener['oldIE' + evName]);
				} else {
					target[methodName]( 'on' + evName, listener);
				}

			}
		}
	};
	
}

/*>>framework-bridge*/

/*>>core*/
//function(template, UiClass, items, options)

var self = this;

/**
 * Static vars, don't change unless you know what you're doing.
 */
var DOUBLE_TAP_RADIUS = 25, 
	NUM_HOLDERS = 3;

/**
 * Options
 */
var _options = {
	allowPanToNext:true,
	spacing: 0.12,
	bgOpacity: 1,
	mouseUsed: false,
	loop: true,
	pinchToClose: true,
	closeOnScroll: true,
	closeOnVerticalDrag: true,
	verticalDragRange: 0.75,
	hideAnimationDuration: 333,
	showAnimationDuration: 333,
	showHideOpacity: false,
	focus: true,
	escKey: true,
	arrowKeys: true,
	mainScrollEndFriction: 0.35,
	panEndFriction: 0.35,
	isClickableElement: function(el) {
        return el.tagName === 'A';
    },
    getDoubleTapZoom: function(isMouseClick, item) {
    	if(isMouseClick) {
    		return 1;
    	} else {
    		return item.initialZoomLevel < 0.7 ? 1 : 1.33;
    	}
    },
    maxSpreadZoom: 1.33,
	modal: true,

	// not fully implemented yet
	scaleMode: 'fit' // TODO
};
framework.extend(_options, options);


/**
 * Private helper variables & functions
 */

var _getEmptyPoint = function() { 
		return {x:0,y:0}; 
	};

var _isOpen,
	_isDestroying,
	_closedByScroll,
	_currentItemIndex,
	_containerStyle,
	_containerShiftIndex,
	_currPanDist = _getEmptyPoint(),
	_startPanOffset = _getEmptyPoint(),
	_panOffset = _getEmptyPoint(),
	_upMoveEvents, // drag move, drag end & drag cancel events array
	_downEvents, // drag start events array
	_globalEventHandlers,
	_viewportSize = {},
	_currZoomLevel,
	_startZoomLevel,
	_translatePrefix,
	_translateSufix,
	_updateSizeInterval,
	_itemsNeedUpdate,
	_currPositionIndex = 0,
	_offset = {},
	_slideSize = _getEmptyPoint(), // size of slide area, including spacing
	_itemHolders,
	_prevItemIndex,
	_indexDiff = 0, // difference of indexes since last content update
	_dragStartEvent,
	_dragMoveEvent,
	_dragEndEvent,
	_dragCancelEvent,
	_transformKey,
	_pointerEventEnabled,
	_isFixedPosition = true,
	_likelyTouchDevice,
	_modules = [],
	_requestAF,
	_cancelAF,
	_initalClassName,
	_initalWindowScrollY,
	_oldIE,
	_currentWindowScrollY,
	_features,
	_windowVisibleSize = {},
	_renderMaxResolution = false,
	_orientationChangeTimeout,


	// Registers PhotoSWipe module (History, Controller ...)
	_registerModule = function(name, module) {
		framework.extend(self, module.publicMethods);
		_modules.push(name);
	},

	_getLoopedId = function(index) {
		var numSlides = _getNumItems();
		if(index > numSlides - 1) {
			return index - numSlides;
		} else  if(index < 0) {
			return numSlides + index;
		}
		return index;
	},
	
	// Micro bind/trigger
	_listeners = {},
	_listen = function(name, fn) {
		if(!_listeners[name]) {
			_listeners[name] = [];
		}
		return _listeners[name].push(fn);
	},
	_shout = function(name) {
		var listeners = _listeners[name];

		if(listeners) {
			var args = Array.prototype.slice.call(arguments);
			args.shift();

			for(var i = 0; i < listeners.length; i++) {
				listeners[i].apply(self, args);
			}
		}
	},

	_getCurrentTime = function() {
		return new Date().getTime();
	},
	_applyBgOpacity = function(opacity) {
		_bgOpacity = opacity;
		self.bg.style.opacity = opacity * _options.bgOpacity;
	},

	_applyZoomTransform = function(styleObj,x,y,zoom,item) {
		if(!_renderMaxResolution || (item && item !== self.currItem) ) {
			zoom = zoom / (item ? item.fitRatio : self.currItem.fitRatio);	
		}
			
		styleObj[_transformKey] = _translatePrefix + x + 'px, ' + y + 'px' + _translateSufix + ' scale(' + zoom + ')';
	},
	_applyCurrentZoomPan = function( allowRenderResolution ) {
		if(_currZoomElementStyle) {

			if(allowRenderResolution) {
				if(_currZoomLevel > self.currItem.fitRatio) {
					if(!_renderMaxResolution) {
						_setImageSize(self.currItem, false, true);
						_renderMaxResolution = true;
					}
				} else {
					if(_renderMaxResolution) {
						_setImageSize(self.currItem);
						_renderMaxResolution = false;
					}
				}
			}
			

			_applyZoomTransform(_currZoomElementStyle, _panOffset.x, _panOffset.y, _currZoomLevel);
		}
	},
	_applyZoomPanToItem = function(item) {
		if(item.container) {

			_applyZoomTransform(item.container.style, 
								item.initialPosition.x, 
								item.initialPosition.y, 
								item.initialZoomLevel,
								item);
		}
	},
	_setTranslateX = function(x, elStyle) {
		elStyle[_transformKey] = _translatePrefix + x + 'px, 0px' + _translateSufix;
	},
	_moveMainScroll = function(x, dragging) {

		if(!_options.loop && dragging) {
			var newSlideIndexOffset = _currentItemIndex + (_slideSize.x * _currPositionIndex - x) / _slideSize.x,
				delta = Math.round(x - _mainScrollPos.x);

			if( (newSlideIndexOffset < 0 && delta > 0) || 
				(newSlideIndexOffset >= _getNumItems() - 1 && delta < 0) ) {
				x = _mainScrollPos.x + delta * _options.mainScrollEndFriction;
			} 
		}
		
		_mainScrollPos.x = x;
		_setTranslateX(x, _containerStyle);
	},
	_calculatePanOffset = function(axis, zoomLevel) {
		var m = _midZoomPoint[axis] - _offset[axis];
		return _startPanOffset[axis] + _currPanDist[axis] + m - m * ( zoomLevel / _startZoomLevel );
	},
	
	_equalizePoints = function(p1, p2) {
		p1.x = p2.x;
		p1.y = p2.y;
		if(p2.id) {
			p1.id = p2.id;
		}
	},
	_roundPoint = function(p) {
		p.x = Math.round(p.x);
		p.y = Math.round(p.y);
	},

	_mouseMoveTimeout = null,
	_onFirstMouseMove = function() {
		// Wait until mouse move event is fired at least twice during 100ms
		// We do this, because some mobile browsers trigger it on touchstart
		if(_mouseMoveTimeout ) { 
			framework.unbind(document, 'mousemove', _onFirstMouseMove);
			framework.addClass(template, 'pswp--has_mouse');
			_options.mouseUsed = true;
			_shout('mouseUsed');
		}
		_mouseMoveTimeout = setTimeout(function() {
			_mouseMoveTimeout = null;
		}, 100);
	},

	_bindEvents = function() {
		framework.bind(document, 'keydown', self);

		if(_features.transform) {
			// don't bind click event in browsers that don't support transform (mostly IE8)
			framework.bind(self.scrollWrap, 'click', self);
		}
		

		if(!_options.mouseUsed) {
			framework.bind(document, 'mousemove', _onFirstMouseMove);
		}

		framework.bind(window, 'resize scroll orientationchange', self);

		_shout('bindEvents');
	},

	_unbindEvents = function() {
		framework.unbind(window, 'resize scroll orientationchange', self);
		framework.unbind(window, 'scroll', _globalEventHandlers.scroll);
		framework.unbind(document, 'keydown', self);
		framework.unbind(document, 'mousemove', _onFirstMouseMove);

		if(_features.transform) {
			framework.unbind(self.scrollWrap, 'click', self);
		}

		if(_isDragging) {
			framework.unbind(window, _upMoveEvents, self);
		}

		clearTimeout(_orientationChangeTimeout);

		_shout('unbindEvents');
	},
	
	_calculatePanBounds = function(zoomLevel, update) {
		var bounds = _calculateItemSize( self.currItem, _viewportSize, zoomLevel );
		if(update) {
			_currPanBounds = bounds;
		}
		return bounds;
	},
	
	_getMinZoomLevel = function(item) {
		if(!item) {
			item = self.currItem;
		}
		return item.initialZoomLevel;
	},
	_getMaxZoomLevel = function(item) {
		if(!item) {
			item = self.currItem;
		}
		return item.w > 0 ? _options.maxSpreadZoom : 1;
	},

	// Return true if offset is out of the bounds
	_modifyDestPanOffset = function(axis, destPanBounds, destPanOffset, destZoomLevel) {
		if(destZoomLevel === self.currItem.initialZoomLevel) {
			destPanOffset[axis] = self.currItem.initialPosition[axis];
			return true;
		} else {
			destPanOffset[axis] = _calculatePanOffset(axis, destZoomLevel); 

			if(destPanOffset[axis] > destPanBounds.min[axis]) {
				destPanOffset[axis] = destPanBounds.min[axis];
				return true;
			} else if(destPanOffset[axis] < destPanBounds.max[axis] ) {
				destPanOffset[axis] = destPanBounds.max[axis];
				return true;
			}
		}
		return false;
	},

	_setupTransforms = function() {

		if(_transformKey) {
			// setup 3d transforms
			var allow3dTransform = _features.perspective && !_likelyTouchDevice;
			_translatePrefix = 'translate' + (allow3dTransform ? '3d(' : '(');
			_translateSufix = _features.perspective ? ', 0px)' : ')';	
			return;
		}

		// Override zoom/pan/move functions in case old browser is used (most likely IE)
		// (so they use left/top/width/height, instead of CSS transform)
	
		_transformKey = 'left';
		framework.addClass(template, 'pswp--ie');

		_setTranslateX = function(x, elStyle) {
			elStyle.left = x + 'px';
		};
		_applyZoomPanToItem = function(item) {

			var zoomRatio = item.fitRatio > 1 ? 1 : item.fitRatio,
				s = item.container.style,
				w = zoomRatio * item.w,
				h = zoomRatio * item.h;

			s.width = w + 'px';
			s.height = h + 'px';
			s.left = item.initialPosition.x + 'px';
			s.top = item.initialPosition.y + 'px';

		};
		_applyCurrentZoomPan = function() {
			if(_currZoomElementStyle) {

				var s = _currZoomElementStyle,
					item = self.currItem,
					zoomRatio = item.fitRatio > 1 ? 1 : item.fitRatio,
					w = zoomRatio * item.w,
					h = zoomRatio * item.h;

				s.width = w + 'px';
				s.height = h + 'px';


				s.left = _panOffset.x + 'px';
				s.top = _panOffset.y + 'px';
			}
			
		};
	},

	_onKeyDown = function(e) {
		var keydownAction = '';
		if(_options.escKey && e.keyCode === 27) { 
			keydownAction = 'close';
		} else if(_options.arrowKeys) {
			if(e.keyCode === 37) {
				keydownAction = 'prev';
			} else if(e.keyCode === 39) { 
				keydownAction = 'next';
			}
		}

		if(keydownAction) {
			// don't do anything if special key pressed to prevent from overriding default browser actions
			// e.g. in Chrome on Mac cmd+arrow-left returns to previous page
			if( !e.ctrlKey && !e.altKey && !e.shiftKey && !e.metaKey ) {
				if(e.preventDefault) {
					e.preventDefault();
				} else {
					e.returnValue = false;
				} 
				self[keydownAction]();
			}
		}
	},

	_onGlobalClick = function(e) {
		if(!e) {
			return;
		}

		// don't allow click event to pass through when triggering after drag or some other gesture
		if(_moved || _zoomStarted || _mainScrollAnimating || _verticalDragInitiated) {
			e.preventDefault();
			e.stopPropagation();
		}
	},

	_updatePageScrollOffset = function() {
		self.setScrollOffset(0, framework.getScrollY());		
	};
	


	



// Micro animation engine
var _animations = {},
	_numAnimations = 0,
	_stopAnimation = function(name) {
		if(_animations[name]) {
			if(_animations[name].raf) {
				_cancelAF( _animations[name].raf );
			}
			_numAnimations--;
			delete _animations[name];
		}
	},
	_registerStartAnimation = function(name) {
		if(_animations[name]) {
			_stopAnimation(name);
		}
		if(!_animations[name]) {
			_numAnimations++;
			_animations[name] = {};
		}
	},
	_stopAllAnimations = function() {
		for (var prop in _animations) {

			if( _animations.hasOwnProperty( prop ) ) {
				_stopAnimation(prop);
			} 
			
		}
	},
	_animateProp = function(name, b, endProp, d, easingFn, onUpdate, onComplete) {
		var startAnimTime = _getCurrentTime(), t;
		_registerStartAnimation(name);

		var animloop = function(){
			if ( _animations[name] ) {
				
				t = _getCurrentTime() - startAnimTime; // time diff
				//b - beginning (start prop)
				//d - anim duration

				if ( t >= d ) {
					_stopAnimation(name);
					onUpdate(endProp);
					if(onComplete) {
						onComplete();
					}
					return;
				}
				onUpdate( (endProp - b) * easingFn(t/d) + b );

				_animations[name].raf = _requestAF(animloop);
			}
		};
		animloop();
	};
	


var publicMethods = {

	// make a few local variables and functions public
	shout: _shout,
	listen: _listen,
	viewportSize: _viewportSize,
	options: _options,

	isMainScrollAnimating: function() {
		return _mainScrollAnimating;
	},
	getZoomLevel: function() {
		return _currZoomLevel;
	},
	getCurrentIndex: function() {
		return _currentItemIndex;
	},
	isDragging: function() {
		return _isDragging;
	},	
	isZooming: function() {
		return _isZooming;
	},
	setScrollOffset: function(x,y) {
		_offset.x = x;
		_currentWindowScrollY = _offset.y = y;
		_shout('updateScrollOffset', _offset);
	},
	applyZoomPan: function(zoomLevel,panX,panY,allowRenderResolution) {
		_panOffset.x = panX;
		_panOffset.y = panY;
		_currZoomLevel = zoomLevel;
		_applyCurrentZoomPan( allowRenderResolution );
	},

	init: function() {

		if(_isOpen || _isDestroying) {
			return;
		}

		var i;

		self.framework = framework; // basic functionality
		self.template = template; // root DOM element of PhotoSwipe
		self.bg = framework.getChildByClass(template, 'pswp__bg');

		_initalClassName = template.className;
		_isOpen = true;
				
		_features = framework.detectFeatures();
		_requestAF = _features.raf;
		_cancelAF = _features.caf;
		_transformKey = _features.transform;
		_oldIE = _features.oldIE;
		
		self.scrollWrap = framework.getChildByClass(template, 'pswp__scroll-wrap');
		self.container = framework.getChildByClass(self.scrollWrap, 'pswp__container');

		_containerStyle = self.container.style; // for fast access

		// Objects that hold slides (there are only 3 in DOM)
		self.itemHolders = _itemHolders = [
			{el:self.container.children[0] , wrap:0, index: -1},
			{el:self.container.children[1] , wrap:0, index: -1},
			{el:self.container.children[2] , wrap:0, index: -1}
		];

		// hide nearby item holders until initial zoom animation finishes (to avoid extra Paints)
		_itemHolders[0].el.style.display = _itemHolders[2].el.style.display = 'none';

		_setupTransforms();

		// Setup global events
		_globalEventHandlers = {
			resize: self.updateSize,

			// Fixes: iOS 10.3 resize event
			// does not update scrollWrap.clientWidth instantly after resize
			// https://github.com/dimsemenov/PhotoSwipe/issues/1315
			orientationchange: function() {
				clearTimeout(_orientationChangeTimeout);
				_orientationChangeTimeout = setTimeout(function() {
					if(_viewportSize.x !== self.scrollWrap.clientWidth) {
						self.updateSize();
					}
				}, 500);
			},
			scroll: _updatePageScrollOffset,
			keydown: _onKeyDown,
			click: _onGlobalClick
		};

		// disable show/hide effects on old browsers that don't support CSS animations or transforms, 
		// old IOS, Android and Opera mobile. Blackberry seems to work fine, even older models.
		var oldPhone = _features.isOldIOSPhone || _features.isOldAndroid || _features.isMobileOpera;
		if(!_features.animationName || !_features.transform || oldPhone) {
			_options.showAnimationDuration = _options.hideAnimationDuration = 0;
		}

		// init modules
		for(i = 0; i < _modules.length; i++) {
			self['init' + _modules[i]]();
		}
		
		// init
		if(UiClass) {
			var ui = self.ui = new UiClass(self, framework);
			ui.init();
		}

		_shout('firstUpdate');
		_currentItemIndex = _currentItemIndex || _options.index || 0;
		// validate index
		if( isNaN(_currentItemIndex) || _currentItemIndex < 0 || _currentItemIndex >= _getNumItems() ) {
			_currentItemIndex = 0;
		}
		self.currItem = _getItemAt( _currentItemIndex );

		
		if(_features.isOldIOSPhone || _features.isOldAndroid) {
			_isFixedPosition = false;
		}
		
		template.setAttribute('aria-hidden', 'false');
		if(_options.modal) {
			if(!_isFixedPosition) {
				template.style.position = 'absolute';
				template.style.top = framework.getScrollY() + 'px';
			} else {
				template.style.position = 'fixed';
			}
		}

		if(_currentWindowScrollY === undefined) {
			_shout('initialLayout');
			_currentWindowScrollY = _initalWindowScrollY = framework.getScrollY();
		}
		
		// add classes to root element of PhotoSwipe
		var rootClasses = 'pswp--open ';
		if(_options.mainClass) {
			rootClasses += _options.mainClass + ' ';
		}
		if(_options.showHideOpacity) {
			rootClasses += 'pswp--animate_opacity ';
		}
		rootClasses += _likelyTouchDevice ? 'pswp--touch' : 'pswp--notouch';
		rootClasses += _features.animationName ? ' pswp--css_animation' : '';
		rootClasses += _features.svg ? ' pswp--svg' : '';
		framework.addClass(template, rootClasses);

		self.updateSize();

		// initial update
		_containerShiftIndex = -1;
		_indexDiff = null;
		for(i = 0; i < NUM_HOLDERS; i++) {
			_setTranslateX( (i+_containerShiftIndex) * _slideSize.x, _itemHolders[i].el.style);
		}

		if(!_oldIE) {
			framework.bind(self.scrollWrap, _downEvents, self); // no dragging for old IE
		}	

		_listen('initialZoomInEnd', function() {
			self.setContent(_itemHolders[0], _currentItemIndex-1);
			self.setContent(_itemHolders[2], _currentItemIndex+1);

			_itemHolders[0].el.style.display = _itemHolders[2].el.style.display = 'block';

			if(_options.focus) {
				// focus causes layout, 
				// which causes lag during the animation, 
				// that's why we delay it untill the initial zoom transition ends
				template.focus();
			}
			 

			_bindEvents();
		});

		// set content for center slide (first time)
		self.setContent(_itemHolders[1], _currentItemIndex);
		
		self.updateCurrItem();

		_shout('afterInit');

		if(!_isFixedPosition) {

			// On all versions of iOS lower than 8.0, we check size of viewport every second.
			// 
			// This is done to detect when Safari top & bottom bars appear, 
			// as this action doesn't trigger any events (like resize). 
			// 
			// On iOS8 they fixed this.
			// 
			// 10 Nov 2014: iOS 7 usage ~40%. iOS 8 usage 56%.
			
			_updateSizeInterval = setInterval(function() {
				if(!_numAnimations && !_isDragging && !_isZooming && (_currZoomLevel === self.currItem.initialZoomLevel)  ) {
					self.updateSize();
				}
			}, 1000);
		}

		framework.addClass(template, 'pswp--visible');
	},

	// Close the gallery, then destroy it
	close: function() {
		if(!_isOpen) {
			return;
		}

		_isOpen = false;
		_isDestroying = true;
		_shout('close');
		_unbindEvents();

		_showOrHide(self.currItem, null, true, self.destroy);
	},

	// destroys the gallery (unbinds events, cleans up intervals and timeouts to avoid memory leaks)
	destroy: function() {
		_shout('destroy');

		if(_showOrHideTimeout) {
			clearTimeout(_showOrHideTimeout);
		}
		
		template.setAttribute('aria-hidden', 'true');
		template.className = _initalClassName;

		if(_updateSizeInterval) {
			clearInterval(_updateSizeInterval);
		}

		framework.unbind(self.scrollWrap, _downEvents, self);

		// we unbind scroll event at the end, as closing animation may depend on it
		framework.unbind(window, 'scroll', self);

		_stopDragUpdateLoop();

		_stopAllAnimations();

		_listeners = null;
	},

	/**
	 * Pan image to position
	 * @param {Number} x     
	 * @param {Number} y     
	 * @param {Boolean} force Will ignore bounds if set to true.
	 */
	panTo: function(x,y,force) {
		if(!force) {
			if(x > _currPanBounds.min.x) {
				x = _currPanBounds.min.x;
			} else if(x < _currPanBounds.max.x) {
				x = _currPanBounds.max.x;
			}

			if(y > _currPanBounds.min.y) {
				y = _currPanBounds.min.y;
			} else if(y < _currPanBounds.max.y) {
				y = _currPanBounds.max.y;
			}
		}
		
		_panOffset.x = x;
		_panOffset.y = y;
		_applyCurrentZoomPan();
	},
	
	handleEvent: function (e) {
		e = e || window.event;
		if(_globalEventHandlers[e.type]) {
			_globalEventHandlers[e.type](e);
		}
	},


	goTo: function(index) {

		index = _getLoopedId(index);

		var diff = index - _currentItemIndex;
		_indexDiff = diff;

		_currentItemIndex = index;
		self.currItem = _getItemAt( _currentItemIndex );
		_currPositionIndex -= diff;
		
		_moveMainScroll(_slideSize.x * _currPositionIndex);
		

		_stopAllAnimations();
		_mainScrollAnimating = false;

		self.updateCurrItem();
	},
	next: function() {
		self.goTo( _currentItemIndex + 1);
	},
	prev: function() {
		self.goTo( _currentItemIndex - 1);
	},

	// update current zoom/pan objects
	updateCurrZoomItem: function(emulateSetContent) {
		if(emulateSetContent) {
			_shout('beforeChange', 0);
		}

		// itemHolder[1] is middle (current) item
		if(_itemHolders[1].el.children.length) {
			var zoomElement = _itemHolders[1].el.children[0];
			if( framework.hasClass(zoomElement, 'pswp__zoom-wrap') ) {
				_currZoomElementStyle = zoomElement.style;
			} else {
				_currZoomElementStyle = null;
			}
		} else {
			_currZoomElementStyle = null;
		}
		
		_currPanBounds = self.currItem.bounds;	
		_startZoomLevel = _currZoomLevel = self.currItem.initialZoomLevel;

		_panOffset.x = _currPanBounds.center.x;
		_panOffset.y = _currPanBounds.center.y;

		if(emulateSetContent) {
			_shout('afterChange');
		}
	},


	invalidateCurrItems: function() {
		_itemsNeedUpdate = true;
		for(var i = 0; i < NUM_HOLDERS; i++) {
			if( _itemHolders[i].item ) {
				_itemHolders[i].item.needsUpdate = true;
			}
		}
	},

	updateCurrItem: function(beforeAnimation) {

		if(_indexDiff === 0) {
			return;
		}

		var diffAbs = Math.abs(_indexDiff),
			tempHolder;

		if(beforeAnimation && diffAbs < 2) {
			return;
		}


		self.currItem = _getItemAt( _currentItemIndex );
		_renderMaxResolution = false;
		
		_shout('beforeChange', _indexDiff);

		if(diffAbs >= NUM_HOLDERS) {
			_containerShiftIndex += _indexDiff + (_indexDiff > 0 ? -NUM_HOLDERS : NUM_HOLDERS);
			diffAbs = NUM_HOLDERS;
		}
		for(var i = 0; i < diffAbs; i++) {
			if(_indexDiff > 0) {
				tempHolder = _itemHolders.shift();
				_itemHolders[NUM_HOLDERS-1] = tempHolder; // move first to last

				_containerShiftIndex++;
				_setTranslateX( (_containerShiftIndex+2) * _slideSize.x, tempHolder.el.style);
				self.setContent(tempHolder, _currentItemIndex - diffAbs + i + 1 + 1);
			} else {
				tempHolder = _itemHolders.pop();
				_itemHolders.unshift( tempHolder ); // move last to first

				_containerShiftIndex--;
				_setTranslateX( _containerShiftIndex * _slideSize.x, tempHolder.el.style);
				self.setContent(tempHolder, _currentItemIndex + diffAbs - i - 1 - 1);
			}
			
		}

		// reset zoom/pan on previous item
		if(_currZoomElementStyle && Math.abs(_indexDiff) === 1) {

			var prevItem = _getItemAt(_prevItemIndex);
			if(prevItem.initialZoomLevel !== _currZoomLevel) {
				_calculateItemSize(prevItem , _viewportSize );
				_setImageSize(prevItem);
				_applyZoomPanToItem( prevItem ); 				
			}

		}

		// reset diff after update
		_indexDiff = 0;

		self.updateCurrZoomItem();

		_prevItemIndex = _currentItemIndex;

		_shout('afterChange');
		
	},



	updateSize: function(force) {
		
		if(!_isFixedPosition && _options.modal) {
			var windowScrollY = framework.getScrollY();
			if(_currentWindowScrollY !== windowScrollY) {
				template.style.top = windowScrollY + 'px';
				_currentWindowScrollY = windowScrollY;
			}
			if(!force && _windowVisibleSize.x === window.innerWidth && _windowVisibleSize.y === window.innerHeight) {
				return;
			}
			_windowVisibleSize.x = window.innerWidth;
			_windowVisibleSize.y = window.innerHeight;

			//template.style.width = _windowVisibleSize.x + 'px';
			template.style.height = _windowVisibleSize.y + 'px';
		}



		_viewportSize.x = self.scrollWrap.clientWidth;
		_viewportSize.y = self.scrollWrap.clientHeight;

		_updatePageScrollOffset();

		_slideSize.x = _viewportSize.x + Math.round(_viewportSize.x * _options.spacing);
		_slideSize.y = _viewportSize.y;

		_moveMainScroll(_slideSize.x * _currPositionIndex);

		_shout('beforeResize'); // even may be used for example to switch image sources


		// don't re-calculate size on inital size update
		if(_containerShiftIndex !== undefined) {

			var holder,
				item,
				hIndex;

			for(var i = 0; i < NUM_HOLDERS; i++) {
				holder = _itemHolders[i];
				_setTranslateX( (i+_containerShiftIndex) * _slideSize.x, holder.el.style);

				hIndex = _currentItemIndex+i-1;

				if(_options.loop && _getNumItems() > 2) {
					hIndex = _getLoopedId(hIndex);
				}

				// update zoom level on items and refresh source (if needsUpdate)
				item = _getItemAt( hIndex );

				// re-render gallery item if `needsUpdate`,
				// or doesn't have `bounds` (entirely new slide object)
				if( item && (_itemsNeedUpdate || item.needsUpdate || !item.bounds) ) {

					self.cleanSlide( item );
					
					self.setContent( holder, hIndex );

					// if "center" slide
					if(i === 1) {
						self.currItem = item;
						self.updateCurrZoomItem(true);
					}

					item.needsUpdate = false;

				} else if(holder.index === -1 && hIndex >= 0) {
					// add content first time
					self.setContent( holder, hIndex );
				}
				if(item && item.container) {
					_calculateItemSize(item, _viewportSize);
					_setImageSize(item);
					_applyZoomPanToItem( item );
				}
				
			}
			_itemsNeedUpdate = false;
		}	

		_startZoomLevel = _currZoomLevel = self.currItem.initialZoomLevel;
		_currPanBounds = self.currItem.bounds;

		if(_currPanBounds) {
			_panOffset.x = _currPanBounds.center.x;
			_panOffset.y = _currPanBounds.center.y;
			_applyCurrentZoomPan( true );
		}
		
		_shout('resize');
	},
	
	// Zoom current item to
	zoomTo: function(destZoomLevel, centerPoint, speed, easingFn, updateFn) {
		/*
			if(destZoomLevel === 'fit') {
				destZoomLevel = self.currItem.fitRatio;
			} else if(destZoomLevel === 'fill') {
				destZoomLevel = self.currItem.fillRatio;
			}
		*/

		if(centerPoint) {
			_startZoomLevel = _currZoomLevel;
			_midZoomPoint.x = Math.abs(centerPoint.x) - _panOffset.x ;
			_midZoomPoint.y = Math.abs(centerPoint.y) - _panOffset.y ;
			_equalizePoints(_startPanOffset, _panOffset);
		}

		var destPanBounds = _calculatePanBounds(destZoomLevel, false),
			destPanOffset = {};

		_modifyDestPanOffset('x', destPanBounds, destPanOffset, destZoomLevel);
		_modifyDestPanOffset('y', destPanBounds, destPanOffset, destZoomLevel);

		var initialZoomLevel = _currZoomLevel;
		var initialPanOffset = {
			x: _panOffset.x,
			y: _panOffset.y
		};

		_roundPoint(destPanOffset);

		var onUpdate = function(now) {
			if(now === 1) {
				_currZoomLevel = destZoomLevel;
				_panOffset.x = destPanOffset.x;
				_panOffset.y = destPanOffset.y;
			} else {
				_currZoomLevel = (destZoomLevel - initialZoomLevel) * now + initialZoomLevel;
				_panOffset.x = (destPanOffset.x - initialPanOffset.x) * now + initialPanOffset.x;
				_panOffset.y = (destPanOffset.y - initialPanOffset.y) * now + initialPanOffset.y;
			}

			if(updateFn) {
				updateFn(now);
			}

			_applyCurrentZoomPan( now === 1 );
		};

		if(speed) {
			_animateProp('customZoomTo', 0, 1, speed, easingFn || framework.easing.sine.inOut, onUpdate);
		} else {
			onUpdate(1);
		}
	}


};


/*>>core*/

/*>>gestures*/
/**
 * Mouse/touch/pointer event handlers.
 * 
 * separated from @core.js for readability
 */

var MIN_SWIPE_DISTANCE = 30,
	DIRECTION_CHECK_OFFSET = 10; // amount of pixels to drag to determine direction of swipe

var _gestureStartTime,
	_gestureCheckSpeedTime,

	// pool of objects that are used during dragging of zooming
	p = {}, // first point
	p2 = {}, // second point (for zoom gesture)
	delta = {},
	_currPoint = {},
	_startPoint = {},
	_currPointers = [],
	_startMainScrollPos = {},
	_releaseAnimData,
	_posPoints = [], // array of points during dragging, used to determine type of gesture
	_tempPoint = {},

	_isZoomingIn,
	_verticalDragInitiated,
	_oldAndroidTouchEndTimeout,
	_currZoomedItemIndex = 0,
	_centerPoint = _getEmptyPoint(),
	_lastReleaseTime = 0,
	_isDragging, // at least one pointer is down
	_isMultitouch, // at least two _pointers are down
	_zoomStarted, // zoom level changed during zoom gesture
	_moved,
	_dragAnimFrame,
	_mainScrollShifted,
	_currentPoints, // array of current touch points
	_isZooming,
	_currPointsDistance,
	_startPointsDistance,
	_currPanBounds,
	_mainScrollPos = _getEmptyPoint(),
	_currZoomElementStyle,
	_mainScrollAnimating, // true, if animation after swipe gesture is running
	_midZoomPoint = _getEmptyPoint(),
	_currCenterPoint = _getEmptyPoint(),
	_direction,
	_isFirstMove,
	_opacityChanged,
	_bgOpacity,
	_wasOverInitialZoom,

	_isEqualPoints = function(p1, p2) {
		return p1.x === p2.x && p1.y === p2.y;
	},
	_isNearbyPoints = function(touch0, touch1) {
		return Math.abs(touch0.x - touch1.x) < DOUBLE_TAP_RADIUS && Math.abs(touch0.y - touch1.y) < DOUBLE_TAP_RADIUS;
	},
	_calculatePointsDistance = function(p1, p2) {
		_tempPoint.x = Math.abs( p1.x - p2.x );
		_tempPoint.y = Math.abs( p1.y - p2.y );
		return Math.sqrt(_tempPoint.x * _tempPoint.x + _tempPoint.y * _tempPoint.y);
	},
	_stopDragUpdateLoop = function() {
		if(_dragAnimFrame) {
			_cancelAF(_dragAnimFrame);
			_dragAnimFrame = null;
		}
	},
	_dragUpdateLoop = function() {
		if(_isDragging) {
			_dragAnimFrame = _requestAF(_dragUpdateLoop);
			_renderMovement();
		}
	},
	_canPan = function() {
		return !(_options.scaleMode === 'fit' && _currZoomLevel ===  self.currItem.initialZoomLevel);
	},
	
	// find the closest parent DOM element
	_closestElement = function(el, fn) {
	  	if(!el || el === document) {
	  		return false;
	  	}

	  	// don't search elements above pswp__scroll-wrap
	  	if(el.getAttribute('class') && el.getAttribute('class').indexOf('pswp__scroll-wrap') > -1 ) {
	  		return false;
	  	}

	  	if( fn(el) ) {
	  		return el;
	  	}

	  	return _closestElement(el.parentNode, fn);
	},

	_preventObj = {},
	_preventDefaultEventBehaviour = function(e, isDown) {
	    _preventObj.prevent = !_closestElement(e.target, _options.isClickableElement);

		_shout('preventDragEvent', e, isDown, _preventObj);
		return _preventObj.prevent;

	},
	_convertTouchToPoint = function(touch, p) {
		p.x = touch.pageX;
		p.y = touch.pageY;
		p.id = touch.identifier;
		return p;
	},
	_findCenterOfPoints = function(p1, p2, pCenter) {
		pCenter.x = (p1.x + p2.x) * 0.5;
		pCenter.y = (p1.y + p2.y) * 0.5;
	},
	_pushPosPoint = function(time, x, y) {
		if(time - _gestureCheckSpeedTime > 50) {
			var o = _posPoints.length > 2 ? _posPoints.shift() : {};
			o.x = x;
			o.y = y; 
			_posPoints.push(o);
			_gestureCheckSpeedTime = time;
		}
	},

	_calculateVerticalDragOpacityRatio = function() {
		var yOffset = _panOffset.y - self.currItem.initialPosition.y; // difference between initial and current position
		return 1 -  Math.abs( yOffset / (_viewportSize.y / 2)  );
	},

	
	// points pool, reused during touch events
	_ePoint1 = {},
	_ePoint2 = {},
	_tempPointsArr = [],
	_tempCounter,
	_getTouchPoints = function(e) {
		// clean up previous points, without recreating array
		while(_tempPointsArr.length > 0) {
			_tempPointsArr.pop();
		}

		if(!_pointerEventEnabled) {
			if(e.type.indexOf('touch') > -1) {

				if(e.touches && e.touches.length > 0) {
					_tempPointsArr[0] = _convertTouchToPoint(e.touches[0], _ePoint1);
					if(e.touches.length > 1) {
						_tempPointsArr[1] = _convertTouchToPoint(e.touches[1], _ePoint2);
					}
				}
				
			} else {
				_ePoint1.x = e.pageX;
				_ePoint1.y = e.pageY;
				_ePoint1.id = '';
				_tempPointsArr[0] = _ePoint1;//_ePoint1;
			}
		} else {
			_tempCounter = 0;
			// we can use forEach, as pointer events are supported only in modern browsers
			_currPointers.forEach(function(p) {
				if(_tempCounter === 0) {
					_tempPointsArr[0] = p;
				} else if(_tempCounter === 1) {
					_tempPointsArr[1] = p;
				}
				_tempCounter++;

			});
		}
		return _tempPointsArr;
	},

	_panOrMoveMainScroll = function(axis, delta) {

		var panFriction,
			overDiff = 0,
			newOffset = _panOffset[axis] + delta[axis],
			startOverDiff,
			dir = delta[axis] > 0,
			newMainScrollPosition = _mainScrollPos.x + delta.x,
			mainScrollDiff = _mainScrollPos.x - _startMainScrollPos.x,
			newPanPos,
			newMainScrollPos;

		// calculate fdistance over the bounds and friction
		if(newOffset > _currPanBounds.min[axis] || newOffset < _currPanBounds.max[axis]) {
			panFriction = _options.panEndFriction;
			// Linear increasing of friction, so at 1/4 of viewport it's at max value. 
			// Looks not as nice as was expected. Left for history.
			// panFriction = (1 - (_panOffset[axis] + delta[axis] + panBounds.min[axis]) / (_viewportSize[axis] / 4) );
		} else {
			panFriction = 1;
		}
		
		newOffset = _panOffset[axis] + delta[axis] * panFriction;

		// move main scroll or start panning
		if(_options.allowPanToNext || _currZoomLevel === self.currItem.initialZoomLevel) {


			if(!_currZoomElementStyle) {
				
				newMainScrollPos = newMainScrollPosition;

			} else if(_direction === 'h' && axis === 'x' && !_zoomStarted ) {
				
				if(dir) {
					if(newOffset > _currPanBounds.min[axis]) {
						panFriction = _options.panEndFriction;
						overDiff = _currPanBounds.min[axis] - newOffset;
						startOverDiff = _currPanBounds.min[axis] - _startPanOffset[axis];
					}
					
					// drag right
					if( (startOverDiff <= 0 || mainScrollDiff < 0) && _getNumItems() > 1 ) {
						newMainScrollPos = newMainScrollPosition;
						if(mainScrollDiff < 0 && newMainScrollPosition > _startMainScrollPos.x) {
							newMainScrollPos = _startMainScrollPos.x;
						}
					} else {
						if(_currPanBounds.min.x !== _currPanBounds.max.x) {
							newPanPos = newOffset;
						}
						
					}

				} else {

					if(newOffset < _currPanBounds.max[axis] ) {
						panFriction =_options.panEndFriction;
						overDiff = newOffset - _currPanBounds.max[axis];
						startOverDiff = _startPanOffset[axis] - _currPanBounds.max[axis];
					}

					if( (startOverDiff <= 0 || mainScrollDiff > 0) && _getNumItems() > 1 ) {
						newMainScrollPos = newMainScrollPosition;

						if(mainScrollDiff > 0 && newMainScrollPosition < _startMainScrollPos.x) {
							newMainScrollPos = _startMainScrollPos.x;
						}

					} else {
						if(_currPanBounds.min.x !== _currPanBounds.max.x) {
							newPanPos = newOffset;
						}
					}

				}


				//
			}

			if(axis === 'x') {

				if(newMainScrollPos !== undefined) {
					_moveMainScroll(newMainScrollPos, true);
					if(newMainScrollPos === _startMainScrollPos.x) {
						_mainScrollShifted = false;
					} else {
						_mainScrollShifted = true;
					}
				}

				if(_currPanBounds.min.x !== _currPanBounds.max.x) {
					if(newPanPos !== undefined) {
						_panOffset.x = newPanPos;
					} else if(!_mainScrollShifted) {
						_panOffset.x += delta.x * panFriction;
					}
				}

				return newMainScrollPos !== undefined;
			}

		}

		if(!_mainScrollAnimating) {
			
			if(!_mainScrollShifted) {
				if(_currZoomLevel > self.currItem.fitRatio) {
					_panOffset[axis] += delta[axis] * panFriction;
				
				}
			}

			
		}
		
	},

	// Pointerdown/touchstart/mousedown handler
	_onDragStart = function(e) {

		// Allow dragging only via left mouse button.
		// As this handler is not added in IE8 - we ignore e.which
		// 
		// http://www.quirksmode.org/js/events_properties.html
		// https://developer.mozilla.org/en-US/docs/Web/API/event.button
		if(e.type === 'mousedown' && e.button > 0  ) {
			return;
		}

		if(_initialZoomRunning) {
			e.preventDefault();
			return;
		}

		if(_oldAndroidTouchEndTimeout && e.type === 'mousedown') {
			return;
		}

		if(_preventDefaultEventBehaviour(e, true)) {
			e.preventDefault();
		}



		_shout('pointerDown');

		if(_pointerEventEnabled) {
			var pointerIndex = framework.arraySearch(_currPointers, e.pointerId, 'id');
			if(pointerIndex < 0) {
				pointerIndex = _currPointers.length;
			}
			_currPointers[pointerIndex] = {x:e.pageX, y:e.pageY, id: e.pointerId};
		}
		


		var startPointsList = _getTouchPoints(e),
			numPoints = startPointsList.length;

		_currentPoints = null;

		_stopAllAnimations();

		// init drag
		if(!_isDragging || numPoints === 1) {

			

			_isDragging = _isFirstMove = true;
			framework.bind(window, _upMoveEvents, self);

			_isZoomingIn = 
				_wasOverInitialZoom = 
				_opacityChanged = 
				_verticalDragInitiated = 
				_mainScrollShifted = 
				_moved = 
				_isMultitouch = 
				_zoomStarted = false;

			_direction = null;

			_shout('firstTouchStart', startPointsList);

			_equalizePoints(_startPanOffset, _panOffset);

			_currPanDist.x = _currPanDist.y = 0;
			_equalizePoints(_currPoint, startPointsList[0]);
			_equalizePoints(_startPoint, _currPoint);

			//_equalizePoints(_startMainScrollPos, _mainScrollPos);
			_startMainScrollPos.x = _slideSize.x * _currPositionIndex;

			_posPoints = [{
				x: _currPoint.x,
				y: _currPoint.y
			}];

			_gestureCheckSpeedTime = _gestureStartTime = _getCurrentTime();

			//_mainScrollAnimationEnd(true);
			_calculatePanBounds( _currZoomLevel, true );
			
			// Start rendering
			_stopDragUpdateLoop();
			_dragUpdateLoop();
			
		}

		// init zoom
		if(!_isZooming && numPoints > 1 && !_mainScrollAnimating && !_mainScrollShifted) {
			_startZoomLevel = _currZoomLevel;
			_zoomStarted = false; // true if zoom changed at least once

			_isZooming = _isMultitouch = true;
			_currPanDist.y = _currPanDist.x = 0;

			_equalizePoints(_startPanOffset, _panOffset);

			_equalizePoints(p, startPointsList[0]);
			_equalizePoints(p2, startPointsList[1]);

			_findCenterOfPoints(p, p2, _currCenterPoint);

			_midZoomPoint.x = Math.abs(_currCenterPoint.x) - _panOffset.x;
			_midZoomPoint.y = Math.abs(_currCenterPoint.y) - _panOffset.y;
			_currPointsDistance = _startPointsDistance = _calculatePointsDistance(p, p2);
		}


	},

	// Pointermove/touchmove/mousemove handler
	_onDragMove = function(e) {

		e.preventDefault();

		if(_pointerEventEnabled) {
			var pointerIndex = framework.arraySearch(_currPointers, e.pointerId, 'id');
			if(pointerIndex > -1) {
				var p = _currPointers[pointerIndex];
				p.x = e.pageX;
				p.y = e.pageY; 
			}
		}

		if(_isDragging) {
			var touchesList = _getTouchPoints(e);
			if(!_direction && !_moved && !_isZooming) {

				if(_mainScrollPos.x !== _slideSize.x * _currPositionIndex) {
					// if main scroll position is shifted – direction is always horizontal
					_direction = 'h';
				} else {
					var diff = Math.abs(touchesList[0].x - _currPoint.x) - Math.abs(touchesList[0].y - _currPoint.y);
					// check the direction of movement
					if(Math.abs(diff) >= DIRECTION_CHECK_OFFSET) {
						_direction = diff > 0 ? 'h' : 'v';
						_currentPoints = touchesList;
					}
				}
				
			} else {
				_currentPoints = touchesList;
			}
		}	
	},
	// 
	_renderMovement =  function() {

		if(!_currentPoints) {
			return;
		}

		var numPoints = _currentPoints.length;

		if(numPoints === 0) {
			return;
		}

		_equalizePoints(p, _currentPoints[0]);

		delta.x = p.x - _currPoint.x;
		delta.y = p.y - _currPoint.y;

		if(_isZooming && numPoints > 1) {
			// Handle behaviour for more than 1 point

			_currPoint.x = p.x;
			_currPoint.y = p.y;
		
			// check if one of two points changed
			if( !delta.x && !delta.y && _isEqualPoints(_currentPoints[1], p2) ) {
				return;
			}

			_equalizePoints(p2, _currentPoints[1]);


			if(!_zoomStarted) {
				_zoomStarted = true;
				_shout('zoomGestureStarted');
			}
			
			// Distance between two points
			var pointsDistance = _calculatePointsDistance(p,p2);

			var zoomLevel = _calculateZoomLevel(pointsDistance);

			// slightly over the of initial zoom level
			if(zoomLevel > self.currItem.initialZoomLevel + self.currItem.initialZoomLevel / 15) {
				_wasOverInitialZoom = true;
			}

			// Apply the friction if zoom level is out of the bounds
			var zoomFriction = 1,
				minZoomLevel = _getMinZoomLevel(),
				maxZoomLevel = _getMaxZoomLevel();

			if ( zoomLevel < minZoomLevel ) {
				
				if(_options.pinchToClose && !_wasOverInitialZoom && _startZoomLevel <= self.currItem.initialZoomLevel) {
					// fade out background if zooming out
					var minusDiff = minZoomLevel - zoomLevel;
					var percent = 1 - minusDiff / (minZoomLevel / 1.2);

					_applyBgOpacity(percent);
					_shout('onPinchClose', percent);
					_opacityChanged = true;
				} else {
					zoomFriction = (minZoomLevel - zoomLevel) / minZoomLevel;
					if(zoomFriction > 1) {
						zoomFriction = 1;
					}
					zoomLevel = minZoomLevel - zoomFriction * (minZoomLevel / 3);
				}
				
			} else if ( zoomLevel > maxZoomLevel ) {
				// 1.5 - extra zoom level above the max. E.g. if max is x6, real max 6 + 1.5 = 7.5
				zoomFriction = (zoomLevel - maxZoomLevel) / ( minZoomLevel * 6 );
				if(zoomFriction > 1) {
					zoomFriction = 1;
				}
				zoomLevel = maxZoomLevel + zoomFriction * minZoomLevel;
			}

			if(zoomFriction < 0) {
				zoomFriction = 0;
			}

			// distance between touch points after friction is applied
			_currPointsDistance = pointsDistance;

			// _centerPoint - The point in the middle of two pointers
			_findCenterOfPoints(p, p2, _centerPoint);
		
			// paning with two pointers pressed
			_currPanDist.x += _centerPoint.x - _currCenterPoint.x;
			_currPanDist.y += _centerPoint.y - _currCenterPoint.y;
			_equalizePoints(_currCenterPoint, _centerPoint);

			_panOffset.x = _calculatePanOffset('x', zoomLevel);
			_panOffset.y = _calculatePanOffset('y', zoomLevel);

			_isZoomingIn = zoomLevel > _currZoomLevel;
			_currZoomLevel = zoomLevel;
			_applyCurrentZoomPan();

		} else {

			// handle behaviour for one point (dragging or panning)

			if(!_direction) {
				return;
			}

			if(_isFirstMove) {
				_isFirstMove = false;

				// subtract drag distance that was used during the detection direction  

				if( Math.abs(delta.x) >= DIRECTION_CHECK_OFFSET) {
					delta.x -= _currentPoints[0].x - _startPoint.x;
				}
				
				if( Math.abs(delta.y) >= DIRECTION_CHECK_OFFSET) {
					delta.y -= _currentPoints[0].y - _startPoint.y;
				}
			}

			_currPoint.x = p.x;
			_currPoint.y = p.y;

			// do nothing if pointers position hasn't changed
			if(delta.x === 0 && delta.y === 0) {
				return;
			}

			if(_direction === 'v' && _options.closeOnVerticalDrag) {
				if(!_canPan()) {
					_currPanDist.y += delta.y;
					_panOffset.y += delta.y;

					var opacityRatio = _calculateVerticalDragOpacityRatio();

					_verticalDragInitiated = true;
					_shout('onVerticalDrag', opacityRatio);

					_applyBgOpacity(opacityRatio);
					_applyCurrentZoomPan();
					return ;
				}
			}

			_pushPosPoint(_getCurrentTime(), p.x, p.y);

			_moved = true;
			_currPanBounds = self.currItem.bounds;
			
			var mainScrollChanged = _panOrMoveMainScroll('x', delta);
			if(!mainScrollChanged) {
				_panOrMoveMainScroll('y', delta);

				_roundPoint(_panOffset);
				_applyCurrentZoomPan();
			}

		}

	},
	
	// Pointerup/pointercancel/touchend/touchcancel/mouseup event handler
	_onDragRelease = function(e) {

		if(_features.isOldAndroid ) {

			if(_oldAndroidTouchEndTimeout && e.type === 'mouseup') {
				return;
			}

			// on Android (v4.1, 4.2, 4.3 & possibly older) 
			// ghost mousedown/up event isn't preventable via e.preventDefault,
			// which causes fake mousedown event
			// so we block mousedown/up for 600ms
			if( e.type.indexOf('touch') > -1 ) {
				clearTimeout(_oldAndroidTouchEndTimeout);
				_oldAndroidTouchEndTimeout = setTimeout(function() {
					_oldAndroidTouchEndTimeout = 0;
				}, 600);
			}
			
		}

		_shout('pointerUp');

		if(_preventDefaultEventBehaviour(e, false)) {
			e.preventDefault();
		}

		var releasePoint;

		if(_pointerEventEnabled) {
			var pointerIndex = framework.arraySearch(_currPointers, e.pointerId, 'id');
			
			if(pointerIndex > -1) {
				releasePoint = _currPointers.splice(pointerIndex, 1)[0];

				if(navigator.pointerEnabled) {
					releasePoint.type = e.pointerType || 'mouse';
				} else {
					var MSPOINTER_TYPES = {
						4: 'mouse', // event.MSPOINTER_TYPE_MOUSE
						2: 'touch', // event.MSPOINTER_TYPE_TOUCH 
						3: 'pen' // event.MSPOINTER_TYPE_PEN
					};
					releasePoint.type = MSPOINTER_TYPES[e.pointerType];

					if(!releasePoint.type) {
						releasePoint.type = e.pointerType || 'mouse';
					}
				}

			}
		}

		var touchList = _getTouchPoints(e),
			gestureType,
			numPoints = touchList.length;

		if(e.type === 'mouseup') {
			numPoints = 0;
		}

		// Do nothing if there were 3 touch points or more
		if(numPoints === 2) {
			_currentPoints = null;
			return true;
		}

		// if second pointer released
		if(numPoints === 1) {
			_equalizePoints(_startPoint, touchList[0]);
		}				


		// pointer hasn't moved, send "tap release" point
		if(numPoints === 0 && !_direction && !_mainScrollAnimating) {
			if(!releasePoint) {
				if(e.type === 'mouseup') {
					releasePoint = {x: e.pageX, y: e.pageY, type:'mouse'};
				} else if(e.changedTouches && e.changedTouches[0]) {
					releasePoint = {x: e.changedTouches[0].pageX, y: e.changedTouches[0].pageY, type:'touch'};
				}		
			}

			_shout('touchRelease', e, releasePoint);
		}

		// Difference in time between releasing of two last touch points (zoom gesture)
		var releaseTimeDiff = -1;

		// Gesture completed, no pointers left
		if(numPoints === 0) {
			_isDragging = false;
			framework.unbind(window, _upMoveEvents, self);

			_stopDragUpdateLoop();

			if(_isZooming) {
				// Two points released at the same time
				releaseTimeDiff = 0;
			} else if(_lastReleaseTime !== -1) {
				releaseTimeDiff = _getCurrentTime() - _lastReleaseTime;
			}
		}
		_lastReleaseTime = numPoints === 1 ? _getCurrentTime() : -1;
		
		if(releaseTimeDiff !== -1 && releaseTimeDiff < 150) {
			gestureType = 'zoom';
		} else {
			gestureType = 'swipe';
		}

		if(_isZooming && numPoints < 2) {
			_isZooming = false;

			// Only second point released
			if(numPoints === 1) {
				gestureType = 'zoomPointerUp';
			}
			_shout('zoomGestureEnded');
		}

		_currentPoints = null;
		if(!_moved && !_zoomStarted && !_mainScrollAnimating && !_verticalDragInitiated) {
			// nothing to animate
			return;
		}
	
		_stopAllAnimations();

		
		if(!_releaseAnimData) {
			_releaseAnimData = _initDragReleaseAnimationData();
		}
		
		_releaseAnimData.calculateSwipeSpeed('x');


		if(_verticalDragInitiated) {

			var opacityRatio = _calculateVerticalDragOpacityRatio();

			if(opacityRatio < _options.verticalDragRange) {
				self.close();
			} else {
				var initalPanY = _panOffset.y,
					initialBgOpacity = _bgOpacity;

				_animateProp('verticalDrag', 0, 1, 300, framework.easing.cubic.out, function(now) {
					
					_panOffset.y = (self.currItem.initialPosition.y - initalPanY) * now + initalPanY;

					_applyBgOpacity(  (1 - initialBgOpacity) * now + initialBgOpacity );
					_applyCurrentZoomPan();
				});

				_shout('onVerticalDrag', 1);
			}

			return;
		}


		// main scroll 
		if(  (_mainScrollShifted || _mainScrollAnimating) && numPoints === 0) {
			var itemChanged = _finishSwipeMainScrollGesture(gestureType, _releaseAnimData);
			if(itemChanged) {
				return;
			}
			gestureType = 'zoomPointerUp';
		}

		// prevent zoom/pan animation when main scroll animation runs
		if(_mainScrollAnimating) {
			return;
		}
		
		// Complete simple zoom gesture (reset zoom level if it's out of the bounds)  
		if(gestureType !== 'swipe') {
			_completeZoomGesture();
			return;
		}
	
		// Complete pan gesture if main scroll is not shifted, and it's possible to pan current image
		if(!_mainScrollShifted && _currZoomLevel > self.currItem.fitRatio) {
			_completePanGesture(_releaseAnimData);
		}
	},


	// Returns object with data about gesture
	// It's created only once and then reused
	_initDragReleaseAnimationData  = function() {
		// temp local vars
		var lastFlickDuration,
			tempReleasePos;

		// s = this
		var s = {
			lastFlickOffset: {},
			lastFlickDist: {},
			lastFlickSpeed: {},
			slowDownRatio:  {},
			slowDownRatioReverse:  {},
			speedDecelerationRatio:  {},
			speedDecelerationRatioAbs:  {},
			distanceOffset:  {},
			backAnimDestination: {},
			backAnimStarted: {},
			calculateSwipeSpeed: function(axis) {
				

				if( _posPoints.length > 1) {
					lastFlickDuration = _getCurrentTime() - _gestureCheckSpeedTime + 50;
					tempReleasePos = _posPoints[_posPoints.length-2][axis];
				} else {
					lastFlickDuration = _getCurrentTime() - _gestureStartTime; // total gesture duration
					tempReleasePos = _startPoint[axis];
				}
				s.lastFlickOffset[axis] = _currPoint[axis] - tempReleasePos;
				s.lastFlickDist[axis] = Math.abs(s.lastFlickOffset[axis]);
				if(s.lastFlickDist[axis] > 20) {
					s.lastFlickSpeed[axis] = s.lastFlickOffset[axis] / lastFlickDuration;
				} else {
					s.lastFlickSpeed[axis] = 0;
				}
				if( Math.abs(s.lastFlickSpeed[axis]) < 0.1 ) {
					s.lastFlickSpeed[axis] = 0;
				}
				
				s.slowDownRatio[axis] = 0.95;
				s.slowDownRatioReverse[axis] = 1 - s.slowDownRatio[axis];
				s.speedDecelerationRatio[axis] = 1;
			},

			calculateOverBoundsAnimOffset: function(axis, speed) {
				if(!s.backAnimStarted[axis]) {

					if(_panOffset[axis] > _currPanBounds.min[axis]) {
						s.backAnimDestination[axis] = _currPanBounds.min[axis];
						
					} else if(_panOffset[axis] < _currPanBounds.max[axis]) {
						s.backAnimDestination[axis] = _currPanBounds.max[axis];
					}

					if(s.backAnimDestination[axis] !== undefined) {
						s.slowDownRatio[axis] = 0.7;
						s.slowDownRatioReverse[axis] = 1 - s.slowDownRatio[axis];
						if(s.speedDecelerationRatioAbs[axis] < 0.05) {

							s.lastFlickSpeed[axis] = 0;
							s.backAnimStarted[axis] = true;

							_animateProp('bounceZoomPan'+axis,_panOffset[axis], 
								s.backAnimDestination[axis], 
								speed || 300, 
								framework.easing.sine.out, 
								function(pos) {
									_panOffset[axis] = pos;
									_applyCurrentZoomPan();
								}
							);

						}
					}
				}
			},

			// Reduces the speed by slowDownRatio (per 10ms)
			calculateAnimOffset: function(axis) {
				if(!s.backAnimStarted[axis]) {
					s.speedDecelerationRatio[axis] = s.speedDecelerationRatio[axis] * (s.slowDownRatio[axis] + 
												s.slowDownRatioReverse[axis] - 
												s.slowDownRatioReverse[axis] * s.timeDiff / 10);

					s.speedDecelerationRatioAbs[axis] = Math.abs(s.lastFlickSpeed[axis] * s.speedDecelerationRatio[axis]);
					s.distanceOffset[axis] = s.lastFlickSpeed[axis] * s.speedDecelerationRatio[axis] * s.timeDiff;
					_panOffset[axis] += s.distanceOffset[axis];

				}
			},

			panAnimLoop: function() {
				if ( _animations.zoomPan ) {
					_animations.zoomPan.raf = _requestAF(s.panAnimLoop);

					s.now = _getCurrentTime();
					s.timeDiff = s.now - s.lastNow;
					s.lastNow = s.now;
					
					s.calculateAnimOffset('x');
					s.calculateAnimOffset('y');

					_applyCurrentZoomPan();
					
					s.calculateOverBoundsAnimOffset('x');
					s.calculateOverBoundsAnimOffset('y');


					if (s.speedDecelerationRatioAbs.x < 0.05 && s.speedDecelerationRatioAbs.y < 0.05) {

						// round pan position
						_panOffset.x = Math.round(_panOffset.x);
						_panOffset.y = Math.round(_panOffset.y);
						_applyCurrentZoomPan();
						
						_stopAnimation('zoomPan');
						return;
					}
				}

			}
		};
		return s;
	},

	_completePanGesture = function(animData) {
		// calculate swipe speed for Y axis (paanning)
		animData.calculateSwipeSpeed('y');

		_currPanBounds = self.currItem.bounds;
		
		animData.backAnimDestination = {};
		animData.backAnimStarted = {};

		// Avoid acceleration animation if speed is too low
		if(Math.abs(animData.lastFlickSpeed.x) <= 0.05 && Math.abs(animData.lastFlickSpeed.y) <= 0.05 ) {
			animData.speedDecelerationRatioAbs.x = animData.speedDecelerationRatioAbs.y = 0;

			// Run pan drag release animation. E.g. if you drag image and release finger without momentum.
			animData.calculateOverBoundsAnimOffset('x');
			animData.calculateOverBoundsAnimOffset('y');
			return true;
		}

		// Animation loop that controls the acceleration after pan gesture ends
		_registerStartAnimation('zoomPan');
		animData.lastNow = _getCurrentTime();
		animData.panAnimLoop();
	},


	_finishSwipeMainScrollGesture = function(gestureType, _releaseAnimData) {
		var itemChanged;
		if(!_mainScrollAnimating) {
			_currZoomedItemIndex = _currentItemIndex;
		}


		
		var itemsDiff;

		if(gestureType === 'swipe') {
			var totalShiftDist = _currPoint.x - _startPoint.x,
				isFastLastFlick = _releaseAnimData.lastFlickDist.x < 10;

			// if container is shifted for more than MIN_SWIPE_DISTANCE, 
			// and last flick gesture was in right direction
			if(totalShiftDist > MIN_SWIPE_DISTANCE && 
				(isFastLastFlick || _releaseAnimData.lastFlickOffset.x > 20) ) {
				// go to prev item
				itemsDiff = -1;
			} else if(totalShiftDist < -MIN_SWIPE_DISTANCE && 
				(isFastLastFlick || _releaseAnimData.lastFlickOffset.x < -20) ) {
				// go to next item
				itemsDiff = 1;
			}
		}

		var nextCircle;

		if(itemsDiff) {
			
			_currentItemIndex += itemsDiff;

			if(_currentItemIndex < 0) {
				_currentItemIndex = _options.loop ? _getNumItems()-1 : 0;
				nextCircle = true;
			} else if(_currentItemIndex >= _getNumItems()) {
				_currentItemIndex = _options.loop ? 0 : _getNumItems()-1;
				nextCircle = true;
			}

			if(!nextCircle || _options.loop) {
				_indexDiff += itemsDiff;
				_currPositionIndex -= itemsDiff;
				itemChanged = true;
			}
			

			
		}

		var animateToX = _slideSize.x * _currPositionIndex;
		var animateToDist = Math.abs( animateToX - _mainScrollPos.x );
		var finishAnimDuration;


		if(!itemChanged && animateToX > _mainScrollPos.x !== _releaseAnimData.lastFlickSpeed.x > 0) {
			// "return to current" duration, e.g. when dragging from slide 0 to -1
			finishAnimDuration = 333; 
		} else {
			finishAnimDuration = Math.abs(_releaseAnimData.lastFlickSpeed.x) > 0 ? 
									animateToDist / Math.abs(_releaseAnimData.lastFlickSpeed.x) : 
									333;

			finishAnimDuration = Math.min(finishAnimDuration, 400);
			finishAnimDuration = Math.max(finishAnimDuration, 250);
		}

		if(_currZoomedItemIndex === _currentItemIndex) {
			itemChanged = false;
		}
		
		_mainScrollAnimating = true;
		
		_shout('mainScrollAnimStart');

		_animateProp('mainScroll', _mainScrollPos.x, animateToX, finishAnimDuration, framework.easing.cubic.out, 
			_moveMainScroll,
			function() {
				_stopAllAnimations();
				_mainScrollAnimating = false;
				_currZoomedItemIndex = -1;
				
				if(itemChanged || _currZoomedItemIndex !== _currentItemIndex) {
					self.updateCurrItem();
				}
				
				_shout('mainScrollAnimComplete');
			}
		);

		if(itemChanged) {
			self.updateCurrItem(true);
		}

		return itemChanged;
	},

	_calculateZoomLevel = function(touchesDistance) {
		return  1 / _startPointsDistance * touchesDistance * _startZoomLevel;
	},

	// Resets zoom if it's out of bounds
	_completeZoomGesture = function() {
		var destZoomLevel = _currZoomLevel,
			minZoomLevel = _getMinZoomLevel(),
			maxZoomLevel = _getMaxZoomLevel();

		if ( _currZoomLevel < minZoomLevel ) {
			destZoomLevel = minZoomLevel;
		} else if ( _currZoomLevel > maxZoomLevel ) {
			destZoomLevel = maxZoomLevel;
		}

		var destOpacity = 1,
			onUpdate,
			initialOpacity = _bgOpacity;

		if(_opacityChanged && !_isZoomingIn && !_wasOverInitialZoom && _currZoomLevel < minZoomLevel) {
			//_closedByScroll = true;
			self.close();
			return true;
		}

		if(_opacityChanged) {
			onUpdate = function(now) {
				_applyBgOpacity(  (destOpacity - initialOpacity) * now + initialOpacity );
			};
		}

		self.zoomTo(destZoomLevel, 0, 200,  framework.easing.cubic.out, onUpdate);
		return true;
	};


_registerModule('Gestures', {
	publicMethods: {

		initGestures: function() {

			// helper function that builds touch/pointer/mouse events
			var addEventNames = function(pref, down, move, up, cancel) {
				_dragStartEvent = pref + down;
				_dragMoveEvent = pref + move;
				_dragEndEvent = pref + up;
				if(cancel) {
					_dragCancelEvent = pref + cancel;
				} else {
					_dragCancelEvent = '';
				}
			};

			_pointerEventEnabled = _features.pointerEvent;
			if(_pointerEventEnabled && _features.touch) {
				// we don't need touch events, if browser supports pointer events
				_features.touch = false;
			}

			if(_pointerEventEnabled) {
				if(navigator.pointerEnabled) {
					addEventNames('pointer', 'down', 'move', 'up', 'cancel');
				} else {
					// IE10 pointer events are case-sensitive
					addEventNames('MSPointer', 'Down', 'Move', 'Up', 'Cancel');
				}
			} else if(_features.touch) {
				addEventNames('touch', 'start', 'move', 'end', 'cancel');
				_likelyTouchDevice = true;
			} else {
				addEventNames('mouse', 'down', 'move', 'up');	
			}

			_upMoveEvents = _dragMoveEvent + ' ' + _dragEndEvent  + ' ' +  _dragCancelEvent;
			_downEvents = _dragStartEvent;

			if(_pointerEventEnabled && !_likelyTouchDevice) {
				_likelyTouchDevice = (navigator.maxTouchPoints > 1) || (navigator.msMaxTouchPoints > 1);
			}
			// make variable public
			self.likelyTouchDevice = _likelyTouchDevice; 
			
			_globalEventHandlers[_dragStartEvent] = _onDragStart;
			_globalEventHandlers[_dragMoveEvent] = _onDragMove;
			_globalEventHandlers[_dragEndEvent] = _onDragRelease; // the Kraken

			if(_dragCancelEvent) {
				_globalEventHandlers[_dragCancelEvent] = _globalEventHandlers[_dragEndEvent];
			}

			// Bind mouse events on device with detected hardware touch support, in case it supports multiple types of input.
			if(_features.touch) {
				_downEvents += ' mousedown';
				_upMoveEvents += ' mousemove mouseup';
				_globalEventHandlers.mousedown = _globalEventHandlers[_dragStartEvent];
				_globalEventHandlers.mousemove = _globalEventHandlers[_dragMoveEvent];
				_globalEventHandlers.mouseup = _globalEventHandlers[_dragEndEvent];
			}

			if(!_likelyTouchDevice) {
				// don't allow pan to next slide from zoomed state on Desktop
				_options.allowPanToNext = false;
			}
		}

	}
});


/*>>gestures*/

/*>>show-hide-transition*/
/**
 * show-hide-transition.js:
 *
 * Manages initial opening or closing transition.
 *
 * If you're not planning to use transition for gallery at all,
 * you may set options hideAnimationDuration and showAnimationDuration to 0,
 * and just delete startAnimation function.
 * 
 */


var _showOrHideTimeout,
	_showOrHide = function(item, img, out, completeFn) {

		if(_showOrHideTimeout) {
			clearTimeout(_showOrHideTimeout);
		}

		_initialZoomRunning = true;
		_initialContentSet = true;
		
		// dimensions of small thumbnail {x:,y:,w:}.
		// Height is optional, as calculated based on large image.
		var thumbBounds; 
		if(item.initialLayout) {
			thumbBounds = item.initialLayout;
			item.initialLayout = null;
		} else {
			thumbBounds = _options.getThumbBoundsFn && _options.getThumbBoundsFn(_currentItemIndex);
		}

		var duration = out ? _options.hideAnimationDuration : _options.showAnimationDuration;

		var onComplete = function() {
			_stopAnimation('initialZoom');
			if(!out) {
				_applyBgOpacity(1);
				if(img) {
					img.style.display = 'block';
				}
				framework.addClass(template, 'pswp--animated-in');
				_shout('initialZoom' + (out ? 'OutEnd' : 'InEnd'));
			} else {
				self.template.removeAttribute('style');
				self.bg.removeAttribute('style');
			}

			if(completeFn) {
				completeFn();
			}
			_initialZoomRunning = false;
		};

		// if bounds aren't provided, just open gallery without animation
		if(!duration || !thumbBounds || thumbBounds.x === undefined) {

			_shout('initialZoom' + (out ? 'Out' : 'In') );

			_currZoomLevel = item.initialZoomLevel;
			_equalizePoints(_panOffset,  item.initialPosition );
			_applyCurrentZoomPan();

			template.style.opacity = out ? 0 : 1;
			_applyBgOpacity(1);

			if(duration) {
				setTimeout(function() {
					onComplete();
				}, duration);
			} else {
				onComplete();
			}

			return;
		}

		var startAnimation = function() {
			var closeWithRaf = _closedByScroll,
				fadeEverything = !self.currItem.src || self.currItem.loadError || _options.showHideOpacity;
			
			// apply hw-acceleration to image
			if(item.miniImg) {
				item.miniImg.style.webkitBackfaceVisibility = 'hidden';
			}

			if(!out) {
				_currZoomLevel = thumbBounds.w / item.w;
				_panOffset.x = thumbBounds.x;
				_panOffset.y = thumbBounds.y - _initalWindowScrollY;

				self[fadeEverything ? 'template' : 'bg'].style.opacity = 0.001;
				_applyCurrentZoomPan();
			}

			_registerStartAnimation('initialZoom');
			
			if(out && !closeWithRaf) {
				framework.removeClass(template, 'pswp--animated-in');
			}

			if(fadeEverything) {
				if(out) {
					framework[ (closeWithRaf ? 'remove' : 'add') + 'Class' ](template, 'pswp--animate_opacity');
				} else {
					setTimeout(function() {
						framework.addClass(template, 'pswp--animate_opacity');
					}, 30);
				}
			}

			_showOrHideTimeout = setTimeout(function() {

				_shout('initialZoom' + (out ? 'Out' : 'In') );
				

				if(!out) {

					// "in" animation always uses CSS transitions (instead of rAF).
					// CSS transition work faster here, 
					// as developer may also want to animate other things, 
					// like ui on top of sliding area, which can be animated just via CSS
					
					_currZoomLevel = item.initialZoomLevel;
					_equalizePoints(_panOffset,  item.initialPosition );
					_applyCurrentZoomPan();
					_applyBgOpacity(1);

					if(fadeEverything) {
						template.style.opacity = 1;
					} else {
						_applyBgOpacity(1);
					}

					_showOrHideTimeout = setTimeout(onComplete, duration + 20);
				} else {

					// "out" animation uses rAF only when PhotoSwipe is closed by browser scroll, to recalculate position
					var destZoomLevel = thumbBounds.w / item.w,
						initialPanOffset = {
							x: _panOffset.x,
							y: _panOffset.y
						},
						initialZoomLevel = _currZoomLevel,
						initalBgOpacity = _bgOpacity,
						onUpdate = function(now) {
							
							if(now === 1) {
								_currZoomLevel = destZoomLevel;
								_panOffset.x = thumbBounds.x;
								_panOffset.y = thumbBounds.y  - _currentWindowScrollY;
							} else {
								_currZoomLevel = (destZoomLevel - initialZoomLevel) * now + initialZoomLevel;
								_panOffset.x = (thumbBounds.x - initialPanOffset.x) * now + initialPanOffset.x;
								_panOffset.y = (thumbBounds.y - _currentWindowScrollY - initialPanOffset.y) * now + initialPanOffset.y;
							}
							
							_applyCurrentZoomPan();
							if(fadeEverything) {
								template.style.opacity = 1 - now;
							} else {
								_applyBgOpacity( initalBgOpacity - now * initalBgOpacity );
							}
						};

					if(closeWithRaf) {
						_animateProp('initialZoom', 0, 1, duration, framework.easing.cubic.out, onUpdate, onComplete);
					} else {
						onUpdate(1);
						_showOrHideTimeout = setTimeout(onComplete, duration + 20);
					}
				}
			
			}, out ? 25 : 90); // Main purpose of this delay is to give browser time to paint and
					// create composite layers of PhotoSwipe UI parts (background, controls, caption, arrows).
					// Which avoids lag at the beginning of scale transition.
		};
		startAnimation();

		
	};

/*>>show-hide-transition*/

/*>>items-controller*/
/**
*
* Controller manages gallery items, their dimensions, and their content.
* 
*/

var _items,
	_tempPanAreaSize = {},
	_imagesToAppendPool = [],
	_initialContentSet,
	_initialZoomRunning,
	_controllerDefaultOptions = {
		index: 0,
		errorMsg: '<div class="pswp__error-msg"><a href="%url%" target="_blank">The image</a> could not be loaded.</div>',
		forceProgressiveLoading: false, // TODO
		preload: [1,1],
		getNumItemsFn: function() {
			return _items.length;
		}
	};


var _getItemAt,
	_getNumItems,
	_initialIsLoop,
	_getZeroBounds = function() {
		return {
			center:{x:0,y:0}, 
			max:{x:0,y:0}, 
			min:{x:0,y:0}
		};
	},
	_calculateSingleItemPanBounds = function(item, realPanElementW, realPanElementH ) {
		var bounds = item.bounds;

		// position of element when it's centered
		bounds.center.x = Math.round((_tempPanAreaSize.x - realPanElementW) / 2);
		bounds.center.y = Math.round((_tempPanAreaSize.y - realPanElementH) / 2) + item.vGap.top;

		// maximum pan position
		bounds.max.x = (realPanElementW > _tempPanAreaSize.x) ? 
							Math.round(_tempPanAreaSize.x - realPanElementW) : 
							bounds.center.x;
		
		bounds.max.y = (realPanElementH > _tempPanAreaSize.y) ? 
							Math.round(_tempPanAreaSize.y - realPanElementH) + item.vGap.top : 
							bounds.center.y;
		
		// minimum pan position
		bounds.min.x = (realPanElementW > _tempPanAreaSize.x) ? 0 : bounds.center.x;
		bounds.min.y = (realPanElementH > _tempPanAreaSize.y) ? item.vGap.top : bounds.center.y;
	},
	_calculateItemSize = function(item, viewportSize, zoomLevel) {

		if (item.src && !item.loadError) {
			var isInitial = !zoomLevel;
			
			if(isInitial) {
				if(!item.vGap) {
					item.vGap = {top:0,bottom:0};
				}
				// allows overriding vertical margin for individual items
				_shout('parseVerticalMargin', item);
			}


			_tempPanAreaSize.x = viewportSize.x;
			_tempPanAreaSize.y = viewportSize.y - item.vGap.top - item.vGap.bottom;

			if (isInitial) {
				var hRatio = _tempPanAreaSize.x / item.w;
				var vRatio = _tempPanAreaSize.y / item.h;

				item.fitRatio = hRatio < vRatio ? hRatio : vRatio;
				//item.fillRatio = hRatio > vRatio ? hRatio : vRatio;

				var scaleMode = _options.scaleMode;

				if (scaleMode === 'orig') {
					zoomLevel = 1;
				} else if (scaleMode === 'fit') {
					zoomLevel = item.fitRatio;
				}

				if (zoomLevel > 1) {
					zoomLevel = 1;
				}

				item.initialZoomLevel = zoomLevel;
				
				if(!item.bounds) {
					// reuse bounds object
					item.bounds = _getZeroBounds(); 
				}
			}

			if(!zoomLevel) {
				return;
			}

			_calculateSingleItemPanBounds(item, item.w * zoomLevel, item.h * zoomLevel);

			if (isInitial && zoomLevel === item.initialZoomLevel) {
				item.initialPosition = item.bounds.center;
			}

			return item.bounds;
		} else {
			item.w = item.h = 0;
			item.initialZoomLevel = item.fitRatio = 1;
			item.bounds = _getZeroBounds();
			item.initialPosition = item.bounds.center;

			// if it's not image, we return zero bounds (content is not zoomable)
			return item.bounds;
		}
		
	},

	


	_appendImage = function(index, item, baseDiv, img, preventAnimation, keepPlaceholder) {
		

		if(item.loadError) {
			return;
		}

		if(img) {

			item.imageAppended = true;
			_setImageSize(item, img, (item === self.currItem && _renderMaxResolution) );
			
			baseDiv.appendChild(img);

			if(keepPlaceholder) {
				setTimeout(function() {
					if(item && item.loaded && item.placeholder) {
						item.placeholder.style.display = 'none';
						item.placeholder = null;
					}
				}, 500);
			}
		}
	},
	


	_preloadImage = function(item) {
		item.loading = true;
		item.loaded = false;
		var img = item.img = framework.createEl('pswp__img', 'img');
		var onComplete = function() {
			item.loading = false;
			item.loaded = true;

			if(item.loadComplete) {
				item.loadComplete(item);
			} else {
				item.img = null; // no need to store image object
			}
			img.onload = img.onerror = null;
			img = null;
		};
		img.onload = onComplete;
		img.onerror = function() {
			item.loadError = true;
			onComplete();
		};		

		img.src = item.src;// + '?a=' + Math.random();

		return img;
	},
	_checkForError = function(item, cleanUp) {
		if(item.src && item.loadError && item.container) {

			if(cleanUp) {
				item.container.innerHTML = '';
			}

			item.container.innerHTML = _options.errorMsg.replace('%url%',  item.src );
			return true;
			
		}
	},
	_setImageSize = function(item, img, maxRes) {
		if(!item.src) {
			return;
		}

		if(!img) {
			img = item.container.lastChild;
		}

		var w = maxRes ? item.w : Math.round(item.w * item.fitRatio),
			h = maxRes ? item.h : Math.round(item.h * item.fitRatio);
		
		if(item.placeholder && !item.loaded) {
			item.placeholder.style.width = w + 'px';
			item.placeholder.style.height = h + 'px';
		}

		img.style.width = w + 'px';
		img.style.height = h + 'px';
	},
	_appendImagesPool = function() {

		if(_imagesToAppendPool.length) {
			var poolItem;

			for(var i = 0; i < _imagesToAppendPool.length; i++) {
				poolItem = _imagesToAppendPool[i];
				if( poolItem.holder.index === poolItem.index ) {
					_appendImage(poolItem.index, poolItem.item, poolItem.baseDiv, poolItem.img, false, poolItem.clearPlaceholder);
				}
			}
			_imagesToAppendPool = [];
		}
	};
	


_registerModule('Controller', {

	publicMethods: {

		lazyLoadItem: function(index) {
			index = _getLoopedId(index);
			var item = _getItemAt(index);

			if(!item || ((item.loaded || item.loading) && !_itemsNeedUpdate)) {
				return;
			}

			_shout('gettingData', index, item);

			if (!item.src) {
				return;
			}

			_preloadImage(item);
		},
		initController: function() {
			framework.extend(_options, _controllerDefaultOptions, true);
			self.items = _items = items;
			_getItemAt = self.getItemAt;
			_getNumItems = _options.getNumItemsFn; //self.getNumItems;



			_initialIsLoop = _options.loop;
			if(_getNumItems() < 3) {
				_options.loop = false; // disable loop if less then 3 items
			}

			_listen('beforeChange', function(diff) {

				var p = _options.preload,
					isNext = diff === null ? true : (diff >= 0),
					preloadBefore = Math.min(p[0], _getNumItems() ),
					preloadAfter = Math.min(p[1], _getNumItems() ),
					i;


				for(i = 1; i <= (isNext ? preloadAfter : preloadBefore); i++) {
					self.lazyLoadItem(_currentItemIndex+i);
				}
				for(i = 1; i <= (isNext ? preloadBefore : preloadAfter); i++) {
					self.lazyLoadItem(_currentItemIndex-i);
				}
			});

			_listen('initialLayout', function() {
				self.currItem.initialLayout = _options.getThumbBoundsFn && _options.getThumbBoundsFn(_currentItemIndex);
			});

			_listen('mainScrollAnimComplete', _appendImagesPool);
			_listen('initialZoomInEnd', _appendImagesPool);



			_listen('destroy', function() {
				var item;
				for(var i = 0; i < _items.length; i++) {
					item = _items[i];
					// remove reference to DOM elements, for GC
					if(item.container) {
						item.container = null; 
					}
					if(item.placeholder) {
						item.placeholder = null;
					}
					if(item.img) {
						item.img = null;
					}
					if(item.preloader) {
						item.preloader = null;
					}
					if(item.loadError) {
						item.loaded = item.loadError = false;
					}
				}
				_imagesToAppendPool = null;
			});
		},


		getItemAt: function(index) {
			if (index >= 0) {
				return _items[index] !== undefined ? _items[index] : false;
			}
			return false;
		},

		allowProgressiveImg: function() {
			// 1. Progressive image loading isn't working on webkit/blink 
			//    when hw-acceleration (e.g. translateZ) is applied to IMG element.
			//    That's why in PhotoSwipe parent element gets zoom transform, not image itself.
			//    
			// 2. Progressive image loading sometimes blinks in webkit/blink when applying animation to parent element.
			//    That's why it's disabled on touch devices (mainly because of swipe transition)
			//    
			// 3. Progressive image loading sometimes doesn't work in IE (up to 11).

			// Don't allow progressive loading on non-large touch devices
			return _options.forceProgressiveLoading || !_likelyTouchDevice || _options.mouseUsed || screen.width > 1200; 
			// 1200 - to eliminate touch devices with large screen (like Chromebook Pixel)
		},

		setContent: function(holder, index) {

			if(_options.loop) {
				index = _getLoopedId(index);
			}

			var prevItem = self.getItemAt(holder.index);
			if(prevItem) {
				prevItem.container = null;
			}
	
			var item = self.getItemAt(index),
				img;
			
			if(!item) {
				holder.el.innerHTML = '';
				return;
			}

			// allow to override data
			_shout('gettingData', index, item);

			holder.index = index;
			holder.item = item;

			// base container DIV is created only once for each of 3 holders
			var baseDiv = item.container = framework.createEl('pswp__zoom-wrap'); 

			

			if(!item.src && item.html) {
				if(item.html.tagName) {
					baseDiv.appendChild(item.html);
				} else {
					baseDiv.innerHTML = item.html;
				}
			}

			_checkForError(item);

			_calculateItemSize(item, _viewportSize);
			
			if(item.src && !item.loadError && !item.loaded) {

				item.loadComplete = function(item) {

					// gallery closed before image finished loading
					if(!_isOpen) {
						return;
					}

					// check if holder hasn't changed while image was loading
					if(holder && holder.index === index ) {
						if( _checkForError(item, true) ) {
							item.loadComplete = item.img = null;
							_calculateItemSize(item, _viewportSize);
							_applyZoomPanToItem(item);

							if(holder.index === _currentItemIndex) {
								// recalculate dimensions
								self.updateCurrZoomItem();
							}
							return;
						}
						if( !item.imageAppended ) {
							if(_features.transform && (_mainScrollAnimating || _initialZoomRunning) ) {
								_imagesToAppendPool.push({
									item:item,
									baseDiv:baseDiv,
									img:item.img,
									index:index,
									holder:holder,
									clearPlaceholder:true
								});
							} else {
								_appendImage(index, item, baseDiv, item.img, _mainScrollAnimating || _initialZoomRunning, true);
							}
						} else {
							// remove preloader & mini-img
							if(!_initialZoomRunning && item.placeholder) {
								item.placeholder.style.display = 'none';
								item.placeholder = null;
							}
						}
					}

					item.loadComplete = null;
					item.img = null; // no need to store image element after it's added

					_shout('imageLoadComplete', index, item);
				};

				if(framework.features.transform) {
					
					var placeholderClassName = 'pswp__img pswp__img--placeholder'; 
					placeholderClassName += (item.msrc ? '' : ' pswp__img--placeholder--blank');

					var placeholder = framework.createEl(placeholderClassName, item.msrc ? 'img' : '');
					if(item.msrc) {
						placeholder.src = item.msrc;
					}
					
					_setImageSize(item, placeholder);

					baseDiv.appendChild(placeholder);
					item.placeholder = placeholder;

				}
				

				

				if(!item.loading) {
					_preloadImage(item);
				}


				if( self.allowProgressiveImg() ) {
					// just append image
					if(!_initialContentSet && _features.transform) {
						_imagesToAppendPool.push({
							item:item, 
							baseDiv:baseDiv, 
							img:item.img, 
							index:index, 
							holder:holder
						});
					} else {
						_appendImage(index, item, baseDiv, item.img, true, true);
					}
				}
				
			} else if(item.src && !item.loadError) {
				// image object is created every time, due to bugs of image loading & delay when switching images
				img = framework.createEl('pswp__img', 'img');
				img.style.opacity = 1;
				img.src = item.src;
				_setImageSize(item, img);
				_appendImage(index, item, baseDiv, img, true);
			}
			

			if(!_initialContentSet && index === _currentItemIndex) {
				_currZoomElementStyle = baseDiv.style;
				_showOrHide(item, (img ||item.img) );
			} else {
				_applyZoomPanToItem(item);
			}

			holder.el.innerHTML = '';
			holder.el.appendChild(baseDiv);
		},

		cleanSlide: function( item ) {
			if(item.img ) {
				item.img.onload = item.img.onerror = null;
			}
			item.loaded = item.loading = item.img = item.imageAppended = false;
		}

	}
});

/*>>items-controller*/

/*>>tap*/
/**
 * tap.js:
 *
 * Displatches tap and double-tap events.
 * 
 */

var tapTimer,
	tapReleasePoint = {},
	_dispatchTapEvent = function(origEvent, releasePoint, pointerType) {		
		var e = document.createEvent( 'CustomEvent' ),
			eDetail = {
				origEvent:origEvent, 
				target:origEvent.target, 
				releasePoint: releasePoint, 
				pointerType:pointerType || 'touch'
			};

		e.initCustomEvent( 'pswpTap', true, true, eDetail );
		origEvent.target.dispatchEvent(e);
	};

_registerModule('Tap', {
	publicMethods: {
		initTap: function() {
			_listen('firstTouchStart', self.onTapStart);
			_listen('touchRelease', self.onTapRelease);
			_listen('destroy', function() {
				tapReleasePoint = {};
				tapTimer = null;
			});
		},
		onTapStart: function(touchList) {
			if(touchList.length > 1) {
				clearTimeout(tapTimer);
				tapTimer = null;
			}
		},
		onTapRelease: function(e, releasePoint) {
			if(!releasePoint) {
				return;
			}

			if(!_moved && !_isMultitouch && !_numAnimations) {
				var p0 = releasePoint;
				if(tapTimer) {
					clearTimeout(tapTimer);
					tapTimer = null;

					// Check if taped on the same place
					if ( _isNearbyPoints(p0, tapReleasePoint) ) {
						_shout('doubleTap', p0);
						return;
					}
				}

				if(releasePoint.type === 'mouse') {
					_dispatchTapEvent(e, releasePoint, 'mouse');
					return;
				}

				var clickedTagName = e.target.tagName.toUpperCase();
				// avoid double tap delay on buttons and elements that have class pswp__single-tap
				if(clickedTagName === 'BUTTON' || framework.hasClass(e.target, 'pswp__single-tap') ) {
					_dispatchTapEvent(e, releasePoint);
					return;
				}

				_equalizePoints(tapReleasePoint, p0);

				tapTimer = setTimeout(function() {
					_dispatchTapEvent(e, releasePoint);
					tapTimer = null;
				}, 300);
			}
		}
	}
});

/*>>tap*/

/*>>desktop-zoom*/
/**
 *
 * desktop-zoom.js:
 *
 * - Binds mousewheel event for paning zoomed image.
 * - Manages "dragging", "zoomed-in", "zoom-out" classes.
 *   (which are used for cursors and zoom icon)
 * - Adds toggleDesktopZoom function.
 * 
 */

var _wheelDelta;
	
_registerModule('DesktopZoom', {

	publicMethods: {

		initDesktopZoom: function() {

			if(_oldIE) {
				// no zoom for old IE (<=8)
				return;
			}

			if(_likelyTouchDevice) {
				// if detected hardware touch support, we wait until mouse is used,
				// and only then apply desktop-zoom features
				_listen('mouseUsed', function() {
					self.setupDesktopZoom();
				});
			} else {
				self.setupDesktopZoom(true);
			}

		},

		setupDesktopZoom: function(onInit) {

			_wheelDelta = {};

			var events = 'wheel mousewheel DOMMouseScroll';
			
			_listen('bindEvents', function() {
				framework.bind(template, events,  self.handleMouseWheel);
			});

			_listen('unbindEvents', function() {
				if(_wheelDelta) {
					framework.unbind(template, events, self.handleMouseWheel);
				}
			});

			self.mouseZoomedIn = false;

			var hasDraggingClass,
				updateZoomable = function() {
					if(self.mouseZoomedIn) {
						framework.removeClass(template, 'pswp--zoomed-in');
						self.mouseZoomedIn = false;
					}
					if(_currZoomLevel < 1) {
						framework.addClass(template, 'pswp--zoom-allowed');
					} else {
						framework.removeClass(template, 'pswp--zoom-allowed');
					}
					removeDraggingClass();
				},
				removeDraggingClass = function() {
					if(hasDraggingClass) {
						framework.removeClass(template, 'pswp--dragging');
						hasDraggingClass = false;
					}
				};

			_listen('resize' , updateZoomable);
			_listen('afterChange' , updateZoomable);
			_listen('pointerDown', function() {
				if(self.mouseZoomedIn) {
					hasDraggingClass = true;
					framework.addClass(template, 'pswp--dragging');
				}
			});
			_listen('pointerUp', removeDraggingClass);

			if(!onInit) {
				updateZoomable();
			}
			
		},

		handleMouseWheel: function(e) {

			if(_currZoomLevel <= self.currItem.fitRatio) {
				if( _options.modal ) {

					if (!_options.closeOnScroll || _numAnimations || _isDragging) {
						e.preventDefault();
					} else if(_transformKey && Math.abs(e.deltaY) > 2) {
						// close PhotoSwipe
						// if browser supports transforms & scroll changed enough
						_closedByScroll = true;
						self.close();
					}

				}
				return true;
			}

			// allow just one event to fire
			e.stopPropagation();

			// https://developer.mozilla.org/en-US/docs/Web/Events/wheel
			_wheelDelta.x = 0;

			if('deltaX' in e) {
				if(e.deltaMode === 1 /* DOM_DELTA_LINE */) {
					// 18 - average line height
					_wheelDelta.x = e.deltaX * 18;
					_wheelDelta.y = e.deltaY * 18;
				} else {
					_wheelDelta.x = e.deltaX;
					_wheelDelta.y = e.deltaY;
				}
			} else if('wheelDelta' in e) {
				if(e.wheelDeltaX) {
					_wheelDelta.x = -0.16 * e.wheelDeltaX;
				}
				if(e.wheelDeltaY) {
					_wheelDelta.y = -0.16 * e.wheelDeltaY;
				} else {
					_wheelDelta.y = -0.16 * e.wheelDelta;
				}
			} else if('detail' in e) {
				_wheelDelta.y = e.detail;
			} else {
				return;
			}

			_calculatePanBounds(_currZoomLevel, true);

			var newPanX = _panOffset.x - _wheelDelta.x,
				newPanY = _panOffset.y - _wheelDelta.y;

			// only prevent scrolling in nonmodal mode when not at edges
			if (_options.modal ||
				(
				newPanX <= _currPanBounds.min.x && newPanX >= _currPanBounds.max.x &&
				newPanY <= _currPanBounds.min.y && newPanY >= _currPanBounds.max.y
				) ) {
				e.preventDefault();
			}

			// TODO: use rAF instead of mousewheel?
			self.panTo(newPanX, newPanY);
		},

		toggleDesktopZoom: function(centerPoint) {
			centerPoint = centerPoint || {x:_viewportSize.x/2 + _offset.x, y:_viewportSize.y/2 + _offset.y };

			var doubleTapZoomLevel = _options.getDoubleTapZoom(true, self.currItem);
			var zoomOut = _currZoomLevel === doubleTapZoomLevel;
			
			self.mouseZoomedIn = !zoomOut;

			self.zoomTo(zoomOut ? self.currItem.initialZoomLevel : doubleTapZoomLevel, centerPoint, 333);
			framework[ (!zoomOut ? 'add' : 'remove') + 'Class'](template, 'pswp--zoomed-in');
		}

	}
});


/*>>desktop-zoom*/

/*>>history*/
/**
 *
 * history.js:
 *
 * - Back button to close gallery.
 * 
 * - Unique URL for each slide: example.com/&pid=1&gid=3
 *   (where PID is picture index, and GID and gallery index)
 *   
 * - Switch URL when slides change.
 * 
 */


var _historyDefaultOptions = {
	history: true,
	galleryUID: 1
};

var _historyUpdateTimeout,
	_hashChangeTimeout,
	_hashAnimCheckTimeout,
	_hashChangedByScript,
	_hashChangedByHistory,
	_hashReseted,
	_initialHash,
	_historyChanged,
	_closedFromURL,
	_urlChangedOnce,
	_windowLoc,

	_supportsPushState,

	_getHash = function() {
		return _windowLoc.hash.substring(1);
	},
	_cleanHistoryTimeouts = function() {

		if(_historyUpdateTimeout) {
			clearTimeout(_historyUpdateTimeout);
		}

		if(_hashAnimCheckTimeout) {
			clearTimeout(_hashAnimCheckTimeout);
		}
	},

	// pid - Picture index
	// gid - Gallery index
	_parseItemIndexFromURL = function() {
		var hash = _getHash(),
			params = {};

		if(hash.length < 5) { // pid=1
			return params;
		}

		var i, vars = hash.split('&');
		for (i = 0; i < vars.length; i++) {
			if(!vars[i]) {
				continue;
			}
			var pair = vars[i].split('=');	
			if(pair.length < 2) {
				continue;
			}
			params[pair[0]] = pair[1];
		}
		if(_options.galleryPIDs) {
			// detect custom pid in hash and search for it among the items collection
			var searchfor = params.pid;
			params.pid = 0; // if custom pid cannot be found, fallback to the first item
			for(i = 0; i < _items.length; i++) {
				if(_items[i].pid === searchfor) {
					params.pid = i;
					break;
				}
			}
		} else {
			params.pid = parseInt(params.pid,10)-1;
		}
		if( params.pid < 0 ) {
			params.pid = 0;
		}
		return params;
	},
	_updateHash = function() {

		if(_hashAnimCheckTimeout) {
			clearTimeout(_hashAnimCheckTimeout);
		}


		if(_numAnimations || _isDragging) {
			// changing browser URL forces layout/paint in some browsers, which causes noticable lag during animation
			// that's why we update hash only when no animations running
			_hashAnimCheckTimeout = setTimeout(_updateHash, 500);
			return;
		}
		
		if(_hashChangedByScript) {
			clearTimeout(_hashChangeTimeout);
		} else {
			_hashChangedByScript = true;
		}


		var pid = (_currentItemIndex + 1);
		var item = _getItemAt( _currentItemIndex );
		if(item.hasOwnProperty('pid')) {
			// carry forward any custom pid assigned to the item
			pid = item.pid;
		}
		var newHash = _initialHash + '&'  +  'gid=' + _options.galleryUID + '&' + 'pid=' + pid;

		if(!_historyChanged) {
			if(_windowLoc.hash.indexOf(newHash) === -1) {
				_urlChangedOnce = true;
			}
			// first time - add new hisory record, then just replace
		}

		var newURL = _windowLoc.href.split('#')[0] + '#' +  newHash;

		if( _supportsPushState ) {

			if('#' + newHash !== window.location.hash) {
				history[_historyChanged ? 'replaceState' : 'pushState']('', document.title, newURL);
			}

		} else {
			if(_historyChanged) {
				_windowLoc.replace( newURL );
			} else {
				_windowLoc.hash = newHash;
			}
		}
		
		

		_historyChanged = true;
		_hashChangeTimeout = setTimeout(function() {
			_hashChangedByScript = false;
		}, 60);
	};



	

_registerModule('History', {

	

	publicMethods: {
		initHistory: function() {

			framework.extend(_options, _historyDefaultOptions, true);

			if( !_options.history ) {
				return;
			}


			_windowLoc = window.location;
			_urlChangedOnce = false;
			_closedFromURL = false;
			_historyChanged = false;
			_initialHash = _getHash();
			_supportsPushState = ('pushState' in history);


			if(_initialHash.indexOf('gid=') > -1) {
				_initialHash = _initialHash.split('&gid=')[0];
				_initialHash = _initialHash.split('?gid=')[0];
			}
			

			_listen('afterChange', self.updateURL);
			_listen('unbindEvents', function() {
				framework.unbind(window, 'hashchange', self.onHashChange);
			});


			var returnToOriginal = function() {
				_hashReseted = true;
				if(!_closedFromURL) {

					if(_urlChangedOnce) {
						history.back();
					} else {

						if(_initialHash) {
							_windowLoc.hash = _initialHash;
						} else {
							if (_supportsPushState) {

								// remove hash from url without refreshing it or scrolling to top
								history.pushState('', document.title,  _windowLoc.pathname + _windowLoc.search );
							} else {
								_windowLoc.hash = '';
							}
						}
					}
					
				}

				_cleanHistoryTimeouts();
			};


			_listen('unbindEvents', function() {
				if(_closedByScroll) {
					// if PhotoSwipe is closed by scroll, we go "back" before the closing animation starts
					// this is done to keep the scroll position
					returnToOriginal();
				}
			});
			_listen('destroy', function() {
				if(!_hashReseted) {
					returnToOriginal();
				}
			});
			_listen('firstUpdate', function() {
				_currentItemIndex = _parseItemIndexFromURL().pid;
			});

			

			
			var index = _initialHash.indexOf('pid=');
			if(index > -1) {
				_initialHash = _initialHash.substring(0, index);
				if(_initialHash.slice(-1) === '&') {
					_initialHash = _initialHash.slice(0, -1);
				}
			}
			

			setTimeout(function() {
				if(_isOpen) { // hasn't destroyed yet
					framework.bind(window, 'hashchange', self.onHashChange);
				}
			}, 40);
			
		},
		onHashChange: function() {

			if(_getHash() === _initialHash) {

				_closedFromURL = true;
				self.close();
				return;
			}
			if(!_hashChangedByScript) {

				_hashChangedByHistory = true;
				self.goTo( _parseItemIndexFromURL().pid );
				_hashChangedByHistory = false;
			}
			
		},
		updateURL: function() {

			// Delay the update of URL, to avoid lag during transition, 
			// and to not to trigger actions like "refresh page sound" or "blinking favicon" to often
			
			_cleanHistoryTimeouts();
			

			if(_hashChangedByHistory) {
				return;
			}

			if(!_historyChanged) {
				_updateHash(); // first time
			} else {
				_historyUpdateTimeout = setTimeout(_updateHash, 800);
			}
		}
	
	}
});


/*>>history*/
	framework.extend(self, publicMethods); };
	return PhotoSwipe;
});

/*! PhotoSwipe Default UI - 4.1.2 - 2017-04-05
* http://photoswipe.com
* Copyright (c) 2017 Dmitry Semenov; */
/**
*
* UI on top of main sliding area (caption, arrows, close button, etc.).
* Built just using public methods/properties of PhotoSwipe.
* 
*/
(function (root, factory) { 
	if (typeof define === 'function' && define.amd) {
		define(factory);
	} else if (typeof exports === 'object') {
		module.exports = factory();
	} else {
		root.PhotoSwipeUI_Default = factory();
	}
})(this, function () {

	'use strict';



var PhotoSwipeUI_Default =
 function(pswp, framework) {

	var ui = this;
	var _overlayUIUpdated = false,
		_controlsVisible = true,
		_fullscrenAPI,
		_controls,
		_captionContainer,
		_fakeCaptionContainer,
		_indexIndicator,
		_shareButton,
		_shareModal,
		_shareModalHidden = true,
		_initalCloseOnScrollValue,
		_isIdle,
		_listen,

		_loadingIndicator,
		_loadingIndicatorHidden,
		_loadingIndicatorTimeout,

		_galleryHasOneSlide,

		_options,
		_defaultUIOptions = {
			barsSize: {top:44, bottom:'auto'},
			closeElClasses: ['item', 'caption', 'zoom-wrap', 'ui', 'top-bar'], 
			timeToIdle: 4000, 
			timeToIdleOutside: 1000,
			loadingIndicatorDelay: 1000, // 2s
			
			addCaptionHTMLFn: function(item, captionEl /*, isFake */) {
				if(!item.title) {
					captionEl.children[0].innerHTML = '';
					return false;
				}
				captionEl.children[0].innerHTML = item.title;
				return true;
			},

			closeEl:true,
			captionEl: true,
			fullscreenEl: true,
			zoomEl: true,
			shareEl: true,
			counterEl: true,
			arrowEl: true,
			preloaderEl: true,

			tapToClose: false,
			tapToToggleControls: true,

			clickToCloseNonZoomable: true,

			shareButtons: [
				{id:'facebook', label:'Share on Facebook', url:'https://www.facebook.com/sharer/sharer.php?u={{url}}'},
				{id:'twitter', label:'Tweet', url:'https://twitter.com/intent/tweet?text={{text}}&url={{url}}'},
				{id:'pinterest', label:'Pin it', url:'http://www.pinterest.com/pin/create/button/'+
													'?url={{url}}&media={{image_url}}&description={{text}}'},
				{id:'download', label:'Download image', url:'{{raw_image_url}}', download:true}
			],
			getImageURLForShare: function( /* shareButtonData */ ) {
				return pswp.currItem.src || '';
			},
			getPageURLForShare: function( /* shareButtonData */ ) {
				return window.location.href;
			},
			getTextForShare: function( /* shareButtonData */ ) {
				return pswp.currItem.title || '';
			},
				
			indexIndicatorSep: ' / ',
			fitControlsWidth: 1200

		},
		_blockControlsTap,
		_blockControlsTapTimeout;



	var _onControlsTap = function(e) {
			if(_blockControlsTap) {
				return true;
			}


			e = e || window.event;

			if(_options.timeToIdle && _options.mouseUsed && !_isIdle) {
				// reset idle timer
				_onIdleMouseMove();
			}


			var target = e.target || e.srcElement,
				uiElement,
				clickedClass = target.getAttribute('class') || '',
				found;

			for(var i = 0; i < _uiElements.length; i++) {
				uiElement = _uiElements[i];
				if(uiElement.onTap && clickedClass.indexOf('pswp__' + uiElement.name ) > -1 ) {
					uiElement.onTap();
					found = true;

				}
			}

			if(found) {
				if(e.stopPropagation) {
					e.stopPropagation();
				}
				_blockControlsTap = true;

				// Some versions of Android don't prevent ghost click event 
				// when preventDefault() was called on touchstart and/or touchend.
				// 
				// This happens on v4.3, 4.2, 4.1, 
				// older versions strangely work correctly, 
				// but just in case we add delay on all of them)	
				var tapDelay = framework.features.isOldAndroid ? 600 : 30;
				_blockControlsTapTimeout = setTimeout(function() {
					_blockControlsTap = false;
				}, tapDelay);
			}

		},
		_fitControlsInViewport = function() {
			return !pswp.likelyTouchDevice || _options.mouseUsed || screen.width > _options.fitControlsWidth;
		},
		_togglePswpClass = function(el, cName, add) {
			framework[ (add ? 'add' : 'remove') + 'Class' ](el, 'pswp__' + cName);
		},

		// add class when there is just one item in the gallery
		// (by default it hides left/right arrows and 1ofX counter)
		_countNumItems = function() {
			var hasOneSlide = (_options.getNumItemsFn() === 1);

			if(hasOneSlide !== _galleryHasOneSlide) {
				_togglePswpClass(_controls, 'ui--one-slide', hasOneSlide);
				_galleryHasOneSlide = hasOneSlide;
			}
		},
		_toggleShareModalClass = function() {
			_togglePswpClass(_shareModal, 'share-modal--hidden', _shareModalHidden);
		},
		_toggleShareModal = function() {

			_shareModalHidden = !_shareModalHidden;
			
			
			if(!_shareModalHidden) {
				_toggleShareModalClass();
				setTimeout(function() {
					if(!_shareModalHidden) {
						framework.addClass(_shareModal, 'pswp__share-modal--fade-in');
					}
				}, 30);
			} else {
				framework.removeClass(_shareModal, 'pswp__share-modal--fade-in');
				setTimeout(function() {
					if(_shareModalHidden) {
						_toggleShareModalClass();
					}
				}, 300);
			}
			
			if(!_shareModalHidden) {
				_updateShareURLs();
			}
			return false;
		},

		_openWindowPopup = function(e) {
			e = e || window.event;
			var target = e.target || e.srcElement;

			pswp.shout('shareLinkClick', e, target);

			if(!target.href) {
				return false;
			}

			if( target.hasAttribute('download') ) {
				return true;
			}

			window.open(target.href, 'pswp_share', 'scrollbars=yes,resizable=yes,toolbar=no,'+
										'location=yes,width=550,height=420,top=100,left=' + 
										(window.screen ? Math.round(screen.width / 2 - 275) : 100)  );

			if(!_shareModalHidden) {
				_toggleShareModal();
			}
			
			return false;
		},
		_updateShareURLs = function() {
			var shareButtonOut = '',
				shareButtonData,
				shareURL,
				image_url,
				page_url,
				share_text;

			for(var i = 0; i < _options.shareButtons.length; i++) {
				shareButtonData = _options.shareButtons[i];

				image_url = _options.getImageURLForShare(shareButtonData);
				page_url = _options.getPageURLForShare(shareButtonData);
				share_text = _options.getTextForShare(shareButtonData);

				shareURL = shareButtonData.url.replace('{{url}}', encodeURIComponent(page_url) )
									.replace('{{image_url}}', encodeURIComponent(image_url) )
									.replace('{{raw_image_url}}', image_url )
									.replace('{{text}}', encodeURIComponent(share_text) );

				shareButtonOut += '<a href="' + shareURL + '" target="_blank" '+
									'class="pswp__share--' + shareButtonData.id + '"' +
									(shareButtonData.download ? 'download' : '') + '>' + 
									shareButtonData.label + '</a>';

				if(_options.parseShareButtonOut) {
					shareButtonOut = _options.parseShareButtonOut(shareButtonData, shareButtonOut);
				}
			}
			_shareModal.children[0].innerHTML = shareButtonOut;
			_shareModal.children[0].onclick = _openWindowPopup;

		},
		_hasCloseClass = function(target) {
			for(var  i = 0; i < _options.closeElClasses.length; i++) {
				if( framework.hasClass(target, 'pswp__' + _options.closeElClasses[i]) ) {
					return true;
				}
			}
		},
		_idleInterval,
		_idleTimer,
		_idleIncrement = 0,
		_onIdleMouseMove = function() {
			clearTimeout(_idleTimer);
			_idleIncrement = 0;
			if(_isIdle) {
				ui.setIdle(false);
			}
		},
		_onMouseLeaveWindow = function(e) {
			e = e ? e : window.event;
			var from = e.relatedTarget || e.toElement;
			if (!from || from.nodeName === 'HTML') {
				clearTimeout(_idleTimer);
				_idleTimer = setTimeout(function() {
					ui.setIdle(true);
				}, _options.timeToIdleOutside);
			}
		},
		_setupFullscreenAPI = function() {
			if(_options.fullscreenEl && !framework.features.isOldAndroid) {
				if(!_fullscrenAPI) {
					_fullscrenAPI = ui.getFullscreenAPI();
				}
				if(_fullscrenAPI) {
					framework.bind(document, _fullscrenAPI.eventK, ui.updateFullscreen);
					ui.updateFullscreen();
					framework.addClass(pswp.template, 'pswp--supports-fs');
				} else {
					framework.removeClass(pswp.template, 'pswp--supports-fs');
				}
			}
		},
		_setupLoadingIndicator = function() {
			// Setup loading indicator
			if(_options.preloaderEl) {
			
				_toggleLoadingIndicator(true);

				_listen('beforeChange', function() {

					clearTimeout(_loadingIndicatorTimeout);

					// display loading indicator with delay
					_loadingIndicatorTimeout = setTimeout(function() {

						if(pswp.currItem && pswp.currItem.loading) {

							if( !pswp.allowProgressiveImg() || (pswp.currItem.img && !pswp.currItem.img.naturalWidth)  ) {
								// show preloader if progressive loading is not enabled, 
								// or image width is not defined yet (because of slow connection)
								_toggleLoadingIndicator(false); 
								// items-controller.js function allowProgressiveImg
							}
							
						} else {
							_toggleLoadingIndicator(true); // hide preloader
						}

					}, _options.loadingIndicatorDelay);
					
				});
				_listen('imageLoadComplete', function(index, item) {
					if(pswp.currItem === item) {
						_toggleLoadingIndicator(true);
					}
				});

			}
		},
		_toggleLoadingIndicator = function(hide) {
			if( _loadingIndicatorHidden !== hide ) {
				_togglePswpClass(_loadingIndicator, 'preloader--active', !hide);
				_loadingIndicatorHidden = hide;
			}
		},
		_applyNavBarGaps = function(item) {
			var gap = item.vGap;

			if( _fitControlsInViewport() ) {
				
				var bars = _options.barsSize; 
				if(_options.captionEl && bars.bottom === 'auto') {
					if(!_fakeCaptionContainer) {
						_fakeCaptionContainer = framework.createEl('pswp__caption pswp__caption--fake');
						_fakeCaptionContainer.appendChild( framework.createEl('pswp__caption__center') );
						_controls.insertBefore(_fakeCaptionContainer, _captionContainer);
						framework.addClass(_controls, 'pswp__ui--fit');
					}
					if( _options.addCaptionHTMLFn(item, _fakeCaptionContainer, true) ) {

						var captionSize = _fakeCaptionContainer.clientHeight;
						gap.bottom = parseInt(captionSize,10) || 44;
					} else {
						gap.bottom = bars.top; // if no caption, set size of bottom gap to size of top
					}
				} else {
					gap.bottom = bars.bottom === 'auto' ? 0 : bars.bottom;
				}
				
				// height of top bar is static, no need to calculate it
				gap.top = bars.top;
			} else {
				gap.top = gap.bottom = 0;
			}
		},
		_setupIdle = function() {
			// Hide controls when mouse is used
			if(_options.timeToIdle) {
				_listen('mouseUsed', function() {
					
					framework.bind(document, 'mousemove', _onIdleMouseMove);
					framework.bind(document, 'mouseout', _onMouseLeaveWindow);

					_idleInterval = setInterval(function() {
						_idleIncrement++;
						if(_idleIncrement === 2) {
							ui.setIdle(true);
						}
					}, _options.timeToIdle / 2);
				});
			}
		},
		_setupHidingControlsDuringGestures = function() {

			// Hide controls on vertical drag
			_listen('onVerticalDrag', function(now) {
				if(_controlsVisible && now < 0.95) {
					ui.hideControls();
				} else if(!_controlsVisible && now >= 0.95) {
					ui.showControls();
				}
			});

			// Hide controls when pinching to close
			var pinchControlsHidden;
			_listen('onPinchClose' , function(now) {
				if(_controlsVisible && now < 0.9) {
					ui.hideControls();
					pinchControlsHidden = true;
				} else if(pinchControlsHidden && !_controlsVisible && now > 0.9) {
					ui.showControls();
				}
			});

			_listen('zoomGestureEnded', function() {
				pinchControlsHidden = false;
				if(pinchControlsHidden && !_controlsVisible) {
					ui.showControls();
				}
			});

		};



	var _uiElements = [
		{ 
			name: 'caption', 
			option: 'captionEl',
			onInit: function(el) {  
				_captionContainer = el; 
			} 
		},
		{ 
			name: 'share-modal', 
			option: 'shareEl',
			onInit: function(el) {  
				_shareModal = el;
			},
			onTap: function() {
				_toggleShareModal();
			} 
		},
		{ 
			name: 'button--share', 
			option: 'shareEl',
			onInit: function(el) { 
				_shareButton = el;
			},
			onTap: function() {
				_toggleShareModal();
			} 
		},
		{ 
			name: 'button--zoom', 
			option: 'zoomEl',
			onTap: pswp.toggleDesktopZoom
		},
		{ 
			name: 'counter', 
			option: 'counterEl',
			onInit: function(el) {  
				_indexIndicator = el;
			} 
		},
		{ 
			name: 'button--close', 
			option: 'closeEl',
			onTap: pswp.close
		},
		{ 
			name: 'button--arrow--left', 
			option: 'arrowEl',
			onTap: pswp.prev
		},
		{ 
			name: 'button--arrow--right', 
			option: 'arrowEl',
			onTap: pswp.next
		},
		{ 
			name: 'button--fs', 
			option: 'fullscreenEl',
			onTap: function() {  
				if(_fullscrenAPI.isFullscreen()) {
					_fullscrenAPI.exit();
				} else {
					_fullscrenAPI.enter();
				}
			} 
		},
		{ 
			name: 'preloader', 
			option: 'preloaderEl',
			onInit: function(el) {  
				_loadingIndicator = el;
			} 
		}

	];

	var _setupUIElements = function() {
		var item,
			classAttr,
			uiElement;

		var loopThroughChildElements = function(sChildren) {
			if(!sChildren) {
				return;
			}

			var l = sChildren.length;
			for(var i = 0; i < l; i++) {
				item = sChildren[i];
				classAttr = item.className;

				for(var a = 0; a < _uiElements.length; a++) {
					uiElement = _uiElements[a];

					if(classAttr.indexOf('pswp__' + uiElement.name) > -1  ) {

						if( _options[uiElement.option] ) { // if element is not disabled from options
							
							framework.removeClass(item, 'pswp__element--disabled');
							if(uiElement.onInit) {
								uiElement.onInit(item);
							}
							
							//item.style.display = 'block';
						} else {
							framework.addClass(item, 'pswp__element--disabled');
							//item.style.display = 'none';
						}
					}
				}
			}
		};
		loopThroughChildElements(_controls.children);

		var topBar =  framework.getChildByClass(_controls, 'pswp__top-bar');
		if(topBar) {
			loopThroughChildElements( topBar.children );
		}
	};


	

	ui.init = function() {

		// extend options
		framework.extend(pswp.options, _defaultUIOptions, true);

		// create local link for fast access
		_options = pswp.options;

		// find pswp__ui element
		_controls = framework.getChildByClass(pswp.scrollWrap, 'pswp__ui');

		// create local link
		_listen = pswp.listen;


		_setupHidingControlsDuringGestures();

		// update controls when slides change
		_listen('beforeChange', ui.update);

		// toggle zoom on double-tap
		_listen('doubleTap', function(point) {
			var initialZoomLevel = pswp.currItem.initialZoomLevel;
			if(pswp.getZoomLevel() !== initialZoomLevel) {
				pswp.zoomTo(initialZoomLevel, point, 333);
			} else {
				pswp.zoomTo(_options.getDoubleTapZoom(false, pswp.currItem), point, 333);
			}
		});

		// Allow text selection in caption
		_listen('preventDragEvent', function(e, isDown, preventObj) {
			var t = e.target || e.srcElement;
			if(
				t && 
				t.getAttribute('class') && e.type.indexOf('mouse') > -1 && 
				( t.getAttribute('class').indexOf('__caption') > 0 || (/(SMALL|STRONG|EM)/i).test(t.tagName) ) 
			) {
				preventObj.prevent = false;
			}
		});

		// bind events for UI
		_listen('bindEvents', function() {
			framework.bind(_controls, 'pswpTap click', _onControlsTap);
			framework.bind(pswp.scrollWrap, 'pswpTap', ui.onGlobalTap);

			if(!pswp.likelyTouchDevice) {
				framework.bind(pswp.scrollWrap, 'mouseover', ui.onMouseOver);
			}
		});

		// unbind events for UI
		_listen('unbindEvents', function() {
			if(!_shareModalHidden) {
				_toggleShareModal();
			}

			if(_idleInterval) {
				clearInterval(_idleInterval);
			}
			framework.unbind(document, 'mouseout', _onMouseLeaveWindow);
			framework.unbind(document, 'mousemove', _onIdleMouseMove);
			framework.unbind(_controls, 'pswpTap click', _onControlsTap);
			framework.unbind(pswp.scrollWrap, 'pswpTap', ui.onGlobalTap);
			framework.unbind(pswp.scrollWrap, 'mouseover', ui.onMouseOver);

			if(_fullscrenAPI) {
				framework.unbind(document, _fullscrenAPI.eventK, ui.updateFullscreen);
				if(_fullscrenAPI.isFullscreen()) {
					_options.hideAnimationDuration = 0;
					_fullscrenAPI.exit();
				}
				_fullscrenAPI = null;
			}
		});


		// clean up things when gallery is destroyed
		_listen('destroy', function() {
			if(_options.captionEl) {
				if(_fakeCaptionContainer) {
					_controls.removeChild(_fakeCaptionContainer);
				}
				framework.removeClass(_captionContainer, 'pswp__caption--empty');
			}

			if(_shareModal) {
				_shareModal.children[0].onclick = null;
			}
			framework.removeClass(_controls, 'pswp__ui--over-close');
			framework.addClass( _controls, 'pswp__ui--hidden');
			ui.setIdle(false);
		});
		

		if(!_options.showAnimationDuration) {
			framework.removeClass( _controls, 'pswp__ui--hidden');
		}
		_listen('initialZoomIn', function() {
			if(_options.showAnimationDuration) {
				framework.removeClass( _controls, 'pswp__ui--hidden');
			}
		});
		_listen('initialZoomOut', function() {
			framework.addClass( _controls, 'pswp__ui--hidden');
		});

		_listen('parseVerticalMargin', _applyNavBarGaps);
		
		_setupUIElements();

		if(_options.shareEl && _shareButton && _shareModal) {
			_shareModalHidden = true;
		}

		_countNumItems();

		_setupIdle();

		_setupFullscreenAPI();

		_setupLoadingIndicator();
	};

	ui.setIdle = function(isIdle) {
		_isIdle = isIdle;
		_togglePswpClass(_controls, 'ui--idle', isIdle);
	};

	ui.update = function() {
		// Don't update UI if it's hidden
		if(_controlsVisible && pswp.currItem) {
			
			ui.updateIndexIndicator();

			if(_options.captionEl) {
				_options.addCaptionHTMLFn(pswp.currItem, _captionContainer);

				_togglePswpClass(_captionContainer, 'caption--empty', !pswp.currItem.title);
			}

			_overlayUIUpdated = true;

		} else {
			_overlayUIUpdated = false;
		}

		if(!_shareModalHidden) {
			_toggleShareModal();
		}

		_countNumItems();
	};

	ui.updateFullscreen = function(e) {

		if(e) {
			// some browsers change window scroll position during the fullscreen
			// so PhotoSwipe updates it just in case
			setTimeout(function() {
				pswp.setScrollOffset( 0, framework.getScrollY() );
			}, 50);
		}
		
		// toogle pswp--fs class on root element
		framework[ (_fullscrenAPI.isFullscreen() ? 'add' : 'remove') + 'Class' ](pswp.template, 'pswp--fs');
	};

	ui.updateIndexIndicator = function() {
		if(_options.counterEl) {
			_indexIndicator.innerHTML = (pswp.getCurrentIndex()+1) + 
										_options.indexIndicatorSep + 
										_options.getNumItemsFn();
		}
	};
	
	ui.onGlobalTap = function(e) {
		e = e || window.event;
		var target = e.target || e.srcElement;

		if(_blockControlsTap) {
			return;
		}

		if(e.detail && e.detail.pointerType === 'mouse') {

			// close gallery if clicked outside of the image
			if(_hasCloseClass(target)) {
				pswp.close();
				return;
			}

			if(framework.hasClass(target, 'pswp__img')) {
				if(pswp.getZoomLevel() === 1 && pswp.getZoomLevel() <= pswp.currItem.fitRatio) {
					if(_options.clickToCloseNonZoomable) {
						pswp.close();
					}
				} else {
					pswp.toggleDesktopZoom(e.detail.releasePoint);
				}
			}
			
		} else {

			// tap anywhere (except buttons) to toggle visibility of controls
			if(_options.tapToToggleControls) {
				if(_controlsVisible) {
					ui.hideControls();
				} else {
					ui.showControls();
				}
			}

			// tap to close gallery
			if(_options.tapToClose && (framework.hasClass(target, 'pswp__img') || _hasCloseClass(target)) ) {
				pswp.close();
				return;
			}
			
		}
	};
	ui.onMouseOver = function(e) {
		e = e || window.event;
		var target = e.target || e.srcElement;

		// add class when mouse is over an element that should close the gallery
		_togglePswpClass(_controls, 'ui--over-close', _hasCloseClass(target));
	};

	ui.hideControls = function() {
		framework.addClass(_controls,'pswp__ui--hidden');
		_controlsVisible = false;
	};

	ui.showControls = function() {
		_controlsVisible = true;
		if(!_overlayUIUpdated) {
			ui.update();
		}
		framework.removeClass(_controls,'pswp__ui--hidden');
	};

	ui.supportsFullscreen = function() {
		var d = document;
		return !!(d.exitFullscreen || d.mozCancelFullScreen || d.webkitExitFullscreen || d.msExitFullscreen);
	};

	ui.getFullscreenAPI = function() {
		var dE = document.documentElement,
			api,
			tF = 'fullscreenchange';

		if (dE.requestFullscreen) {
			api = {
				enterK: 'requestFullscreen',
				exitK: 'exitFullscreen',
				elementK: 'fullscreenElement',
				eventK: tF
			};

		} else if(dE.mozRequestFullScreen ) {
			api = {
				enterK: 'mozRequestFullScreen',
				exitK: 'mozCancelFullScreen',
				elementK: 'mozFullScreenElement',
				eventK: 'moz' + tF
			};

			

		} else if(dE.webkitRequestFullscreen) {
			api = {
				enterK: 'webkitRequestFullscreen',
				exitK: 'webkitExitFullscreen',
				elementK: 'webkitFullscreenElement',
				eventK: 'webkit' + tF
			};

		} else if(dE.msRequestFullscreen) {
			api = {
				enterK: 'msRequestFullscreen',
				exitK: 'msExitFullscreen',
				elementK: 'msFullscreenElement',
				eventK: 'MSFullscreenChange'
			};
		}

		if(api) {
			api.enter = function() { 
				// disable close-on-scroll in fullscreen
				_initalCloseOnScrollValue = _options.closeOnScroll; 
				_options.closeOnScroll = false; 

				if(this.enterK === 'webkitRequestFullscreen') {
					pswp.template[this.enterK]( Element.ALLOW_KEYBOARD_INPUT );
				} else {
					return pswp.template[this.enterK](); 
				}
			};
			api.exit = function() { 
				_options.closeOnScroll = _initalCloseOnScrollValue;

				return document[this.exitK](); 

			};
			api.isFullscreen = function() { return document[this.elementK]; };
		}

		return api;
	};

};
return PhotoSwipeUI_Default;


});

