window.console = window.console || function (t) {
};
window.open = function () {
    console.log('window.open is disabled.');
};
window.print = function () {
    console.log('window.print is disabled.');
};
// Support hover state for mobile.
if (false) {
    window.ontouchstart = function () {
    };
}

if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage('resize', "*");
}

var nodes = document.querySelectorAll('li'), _nodes = [].slice.call(nodes, 0);
var getDirection = function (ev, obj) {
    var w = obj.offsetWidth, h = obj.offsetHeight, x = ev.pageX - obj.offsetLeft - w / 2 * (w > h ? h / w : 1), y = ev.pageY - obj.offsetTop - h / 2 * (h > w ? w / h : 1), d = Math.round(Math.atan2(y, x) / 1.57079633 + 5) % 4;
    return d;
};
var addClass = function (ev, obj, state) {
    var direction = getDirection(ev, obj), class_suffix = '';
    obj.className = '';
    switch (direction) {
        case 0:
            class_suffix = '-top';
            break;
        case 1:
            class_suffix = '-right';
            break;
        case 2:
            class_suffix = '-bottom';
            break;
        case 3:
            class_suffix = '-left';
            break;
    }
    obj.classList.add(state + class_suffix);
};
_nodes.forEach(function (el) {
    el.addEventListener('mouseover', function (ev) {
        addClass(ev, this, 'in');
    }, false);
    el.addEventListener('mouseout', function (ev) {
        addClass(ev, this, 'out');
    }, false);
});