/*
Copyright © 2015 Annpoint, s.r.o.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

-------------------------------------------------------------------------

NOTE: Reuse requires the following acknowledgement (see also NOTICE):
This product includes DayPilot (http://www.daypilot.org) developed by Annpoint, s.r.o.
*/

if (typeof DayPilot === 'undefined') {
	var DayPilot = {};
}

if (typeof DayPilot.Global === 'undefined') {
    DayPilot.Global = {};
}

(function() {

    if (typeof DayPilot.Navigator !== 'undefined') {
        return;
    }

    function loadDefaultCss() {
        if (DayPilot.Global.defaultNavigatorCss) {
            return;
        }
        
        var sheet = DayPilot.sheet();
        
        sheet.add(".navigator_default_main", "border-left: 1px solid #A0A0A0;border-right: 1px solid #A0A0A0;border-bottom: 1px solid #A0A0A0;background-color: white;color: #000000;");
        sheet.add(".navigator_default_month", "font-family: Tahoma;font-size: 11px;");
        sheet.add(".navigator_default_day", "color: black;");
        sheet.add(".navigator_default_weekend", "background-color: #f0f0f0;");
        sheet.add(".navigator_default_dayheader", "color: black;");
        sheet.add(".navigator_default_line", "border-bottom: 1px solid #A0A0A0;");
        sheet.add(".navigator_default_dayother", "color: gray;");
        sheet.add(".navigator_default_todaybox", "border: 1px solid red;");
        sheet.add(".navigator_default_select, .navigator_default_weekend.navigator_default_select", "background-color: #FFE794;");
        sheet.add(".navigator_default_title, .navigator_default_titleleft, .navigator_default_titleright", 'border-top: 1px solid #A0A0A0;color: #666;background: #eee;background: -webkit-gradient(linear, left top, left bottom, from(#eeeeee), to(#dddddd));background: -webkit-linear-gradient(top, #eeeeee 0%, #dddddd);background: -moz-linear-gradient(top, #eeeeee 0%, #dddddd);background: -ms-linear-gradient(top, #eeeeee 0%, #dddddd);background: -o-linear-gradient(top, #eeeeee 0%, #dddddd);background: linear-gradient(top, #eeeeee 0%, #dddddd);filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr="#eeeeee", endColorStr="#dddddd");');
        sheet.add(".navigator_default_busy", "font-weight: bold;");
        sheet.commit();
        
        DayPilot.Global.defaultNavigatorCss = true;
    }
    
    DayPilotNavigator = {};
    DayPilot.Navigator = function(id) {
        this.v = '153-lite';
        var calendar = this;
        this.id = id;
        this.api = 2;
        this.isNavigator = true;

        this.cssClassPrefix = "navigator_default";
        this.weekStarts = 'Auto'; // 0 = Sunday, 1 = Monday, ... 'Auto' = according to locale
        this.selectMode = 'day'; // day/week/month/none
        this.titleHeight = 20;
        this.dayHeaderHeight = 20;
        this.cellWidth = 20;
        this.cellHeight = 20;
        this.cssOnly = true;
        this.selectionStart = new DayPilot.Date().getDatePart();  // today
        this.selectionEnd = null;
        this.selectionDay = null;
        this.showMonths = 1;
        this.skipMonths = 1;
        this.command = "navigate";
        this.year = new DayPilot.Date().getYear();
        this.month = new DayPilot.Date().getMonth() + 1;
        this.locale = "en-us";

        this.timeRangeSelectedHandling = "Bind";

        this._prepare = function() {
            
            this.root.dp = this;
            
            if (this.cssOnly) {
                this.root.className = this._prefixCssClass('_main');
            }
            else {
                this.root.className = this._prefixCssClass('main');
            }

            this.root.style.width = (this.cellWidth * 7) + 'px';
            this.root.style.position = "relative";

            var vsph = document.createElement("input");
            vsph.type = 'hidden';
            vsph.name = calendar.id + "_state";
            vsph.id = vsph.name;
            this.root.appendChild(vsph);
            this.state = vsph;

            if (!this.startDate) {
                this.startDate = new DayPilot.Date(DayPilot.Date.firstDayOfMonth(this.year, this.month));
            }
            else { // make sure it's the first day
                this.startDate = new DayPilot.Date(this.startDate).firstDayOfMonth();
            }

            this.calendars = [];
            this.selected = [];
            this.months = [];
        };

        this._api2 = function() {
            return calendar.api === 2;
        };
        
        this._clearTable = function() {
            // TODO do something smarter here
            this.root.innerHTML = '';
        };

        this._prefixCssClass = function(part) {
            var prefix = this.theme || this.cssClassPrefix;
            if (prefix) {
                return prefix + part;
            }
            else {
                return "";
            }
        };
        
        this._addClass = function(object, name) {
            var fullName = this.cssOnly ? this._prefixCssClass("_" + name) : this._prefixCssClass(name);
            DayPilot.Util.addClass(object, fullName);
        };

        this._removeClass = function(object, name) {
            var fullName = this.cssOnly ? this._prefixCssClass("_" + name) : this._prefixCssClass(name);
            DayPilot.Util.removeClass(object, fullName);
        };

        this._drawTable = function(j, showLinks) {
            var month = {};
            month.cells = [];
            month.days = [];
            month.weeks = [];

            var startDate = this.startDate.addMonths(j);
            
            var showBefore = showLinks.before;
            var showAfter = showLinks.after;

            var firstOfMonth = startDate.firstDayOfMonth();
            var first = firstOfMonth.firstDayOfWeek(resolved.weekStarts());

            var last = firstOfMonth.addMonths(1);
            var days = DayPilot.Date.daysDiff(first.d, last.d);

            var rowCount = 6;
            month.rowCount = rowCount;
            var today = (new DayPilot.Date()).getDatePart();
            
            var width = this.cellWidth * 7;
            var height = this.cellHeight * rowCount + this.titleHeight + this.dayHeaderHeight;
            month.height = height;

            var main = document.createElement("div");
            main.style.width = (width) + 'px';
            main.style.height = (height) + 'px';
            main.style.position = 'relative';
            if (this.cssOnly) {
                main.className = this._prefixCssClass('_month');
            }
            else {
                main.className = this._prefixCssClass('month');
            }
            
            main.style.cursor = 'default';
            main.style.MozUserSelect = 'none';
            main.style.KhtmlUserSelect = 'none';
            main.style.WebkitUserSelect = 'none';
            
            main.month = month;

            this.root.appendChild(main);

            var totalHeaderHeight = this.titleHeight + this.dayHeaderHeight;

            // title left
            var tl = document.createElement("div");
            tl.style.position = 'absolute';
            tl.style.left = '0px';
            tl.style.top = '0px';
            tl.style.width = this.cellWidth + 'px';
            tl.style.height = this.titleHeight + 'px';
            tl.style.lineHeight = this.titleHeight + 'px';
            tl.style.textAlign = 'left';
            tl.setAttribute("unselectable", "on");
            if (this.cssOnly) {
                tl.className = this._prefixCssClass('_titleleft');
            }
            else {
                tl.className = this._prefixCssClass('titleleft');
            }
            if (showLinks.left) {
                tl.style.cursor = 'pointer';
                tl.innerHTML = "<span style='margin-left:2px;'>&lt;</span>";
                tl.onclick = this._clickLeft;
            }
            main.appendChild(tl);
            this.tl = tl;

            // title center
            var ti = document.createElement("div");
            ti.style.position = 'absolute';
            ti.style.left = this.cellWidth + 'px';
            ti.style.top = '0px';
            ti.style.width = (this.cellWidth * 5) + 'px';
            ti.style.height = this.titleHeight + 'px';
            ti.style.lineHeight = this.titleHeight + 'px';
            ti.style.textAlign = 'center';
            ti.setAttribute("unselectable", "on");
            if (this.cssOnly) {
                ti.className = this._prefixCssClass('_title');
            }
            else {
                ti.className = this._prefixCssClass('title');
            }
            ti.innerHTML = resolved.locale().monthNames[startDate.getMonth()] + ' ' + startDate.getYear();
            main.appendChild(ti);
            this.ti = ti;

            // title right
            var tr = document.createElement("div");
            tr.style.position = 'absolute';
            tr.style.left = (this.cellWidth * 6) + 'px';
            tr.style.top = '0px';
            tr.style.width = this.cellWidth + 'px';
            tr.style.height = this.titleHeight + 'px';
            tr.style.lineHeight = this.titleHeight + 'px';
            tr.style.textAlign = 'right';
            tr.setAttribute("unselectable", "on");
            if (this.cssOnly) {
                tr.className = this._prefixCssClass('_titleright');
            }
            else {
                tr.className = this._prefixCssClass('titleright');
            }
            if (showLinks.right) {
                tr.style.cursor = 'pointer';
                tr.innerHTML = "<span style='margin-right:2px;'>&gt;</span>";
                tr.onclick = this._clickRight;
            }
            main.appendChild(tr);
            this.tr = tr;

            for (var x = 0; x < 7; x++) {
                month.cells[x] = [];

                // day header
                var dh = document.createElement("div");
                dh.style.position = 'absolute';
                dh.style.left = (x * this.cellWidth) + 'px';
                dh.style.top = this.titleHeight + 'px';
                dh.style.width = this.cellWidth + 'px';
                dh.style.height = this.dayHeaderHeight + 'px';
                dh.style.lineHeight = this.dayHeaderHeight + 'px';
                dh.style.textAlign = 'right';
                dh.setAttribute("unselectable", "on");
                if (this.cssOnly) {
                    dh.className = this._prefixCssClass('_dayheader');
                }
                else {
                    dh.className = this._prefixCssClass('dayheader');
                }
                dh.innerHTML = "<span style='margin-right: 2px'>" + this._getDayName(x) + "</span>";
                main.appendChild(dh);
                month.days.push(dh);

                for (var y = 0; y < rowCount; y++) {
                    var day = first.addDays(y * 7 + x);

                    var isSelected = this._isSelected(day) && this.selectMode !== 'none';

                    var isCurrentMonth = day.getMonth() === startDate.getMonth();
                    var isPrevMonth = day.getTime() < startDate.getTime();
                    //var isNextMonth = day.getYear() > startDate.getYear() || (day.getYear() == startDate.getYear() && day.getMonth() > startDate.getMonth());
                    var isNextMonth = day.getTime() > startDate.getTime();

                    var dayClass;

                    var dc = document.createElement("div");

                    dc.day = day;
                    dc.x = x;
                    dc.y = y;
                    dc.isCurrentMonth = isCurrentMonth;

                    if (this.cssOnly) {
                        dc.className = this._prefixCssClass((isCurrentMonth ? '_day' : '_dayother'));
                    }
                    else {
                        dc.className = this._prefixCssClass((isCurrentMonth ? 'day' : 'dayother'));
                    }
                    if (day.getTime() === today.getTime() && isCurrentMonth) {
                        this._addClass(dc, 'today');
                    }
                    if (day.dayOfWeek() === 0 || day.dayOfWeek() === 6) {
                        this._addClass(dc, 'weekend');
                    }

                    dc.style.position = 'absolute';
                    dc.style.left = (x * this.cellWidth) + 'px';
                    dc.style.top = (y * this.cellHeight + totalHeaderHeight) + 'px';
                    dc.style.width = this.cellWidth + 'px';
                    dc.style.height = this.cellHeight + 'px';
                    dc.style.lineHeight = this.cellHeight + 'px'; // vertical alignment
                    dc.style.textAlign = 'right';
                    //dc.style.border = '1px solid white';

                    var inner = document.createElement("div");
                    inner.style.position = 'absolute';
                    if (this.cssOnly) {
                        inner.className = (day.getTime() === today.getTime() && isCurrentMonth) ? this._prefixCssClass('_todaybox') : this._prefixCssClass('_daybox');
                    }
                    else {
                        inner.className = (day.getTime() === today.getTime() && isCurrentMonth) ? this._prefixCssClass('todaybox') : this._prefixCssClass('daybox');
                    }
                    inner.style.left = '0px';
                    inner.style.top = '0px';
                    inner.style.width = (this.cellWidth - 2) + 'px';
                    inner.style.height = (this.cellHeight - 2) + 'px';
                    dc.appendChild(inner);

                    /*
                    if (isCurrentMonth) {
                    dc.style.cursor = 'pointer';
                    }
                    */

                    var cell = null;
                    if (this.cells && this.cells[day.toStringSortable()]) {
                        cell = this.cells[day.toStringSortable()];
                        if (cell.css) {
                            this._addClass(dc, cell.css);
                        }
                    }

                    var span = null;
                    if (isCurrentMonth || (showBefore && isPrevMonth) || (showAfter && isNextMonth)) {
                        span = document.createElement("span");
                        span.innerHTML = day.getDay();

                        dc.style.cursor = 'pointer';
                        dc.isClickable = true;
                        if (isSelected) {
                            this._addClass(dc, 'select');
                        }

                        if (cell && cell.html) {
                            span.innerHTML = cell.html;
                        }

                        span.style.marginRight = '2px';
                        dc.appendChild(span);

                    }


                    dc.setAttribute("unselectable", "on");

                    dc.onclick = this._cellClick;
                    dc.onmousedown = this._cellMouseDown;
                    dc.onmousemove = this._cellMouseMove;

                    if (isSelected) {
                        this.selected.push(dc);
                    }

                    main.appendChild(dc);

                    month.cells[x][y] = dc;
                }
            }

            var line = document.createElement("div");
            line.style.position = 'absolute';
            line.style.left = '0px';
            line.style.top = (totalHeaderHeight - 2) + 'px';
            line.style.width = (this.cellWidth * 7) + 'px';
            line.style.height = '1px';
            line.style.fontSize = '1px';
            line.style.lineHeight = '1px';
            if (this.cssOnly) {
                line.className = this._prefixCssClass("_line");
            }
            else {
                line.className = this._prefixCssClass("line");
            }
            //line.style.borderBottom = '1px solid black';

            main.appendChild(line);
            this.months.push(month);
        };

        this._adjustSelection = function() {
            // ignores selectionEnd
            // uses selectMode
            switch (this.selectMode) {
                case 'day':
                    this.selectionEnd = this.selectionStart;
                    break;
                case 'week':
                    this.selectionStart = this.selectionStart.firstDayOfWeek(resolved.weekStarts());
                    this.selectionEnd = this.selectionStart.addDays(6);
                    break;
                case 'month':
                    this.selectionStart = this.selectionStart.firstDayOfMonth();
                    this.selectionEnd = this.selectionStart.lastDayOfMonth();
                    break;
                case 'none':
                    this.selectionEnd = this.selectionStart;
                    break;
                default:
                    throw "Unkown selectMode value.";
            }

        };

        this.select = function(date) {
            var focus = true;

            var originalStart = this.selectionStart;
            var originalEnd = this.selectionEnd;

            this.selectionStart = new DayPilot.Date(date).getDatePart();
            this.selectionDay = this.selectionStart;

            var startChanged = false;
            if (focus) {

                var newStart = this.startDate;
                if (this.selectionStart.getTime() < this.visibleStart().getTime() || this.selectionStart.getTime() > this.visibleEnd().getTime()) {
                    newStart = this.selectionStart.firstDayOfMonth();
                }

                if (newStart.toStringSortable() !== this.startDate.toStringSortable()) {
                    startChanged = true;
                }

                this.startDate = newStart;
            }

            this._adjustSelection();

            // redraw
            this._clearTable();
            this._prepare();
            this._drawMonths();

            if (!originalStart.equals(this.selectionStart) || !originalEnd.equals(this.selectionEnd)) {
                //alert('time range');
                this._timeRangeSelectedDispatch();
            }

        };
        
        this.update = function() {
            // redraw
            this._clearTable();
            this._prepare();
            this._drawMonths();
        };

        this._getDayName = function(i) {
            var x = i + resolved.weekStarts();
            if (x > 6) {
                x -= 7;
            }
            return resolved.locale().dayNamesShort[x];

        };

        this._isSelected = function(date) {
            if (this.selectionStart === null || this.selectionEnd === null) {
                return false;
            }

            if (this.selectionStart.getTime() <= date.getTime() && date.getTime() <= this.selectionEnd.getTime()) {
                return true;
            }

            return false;
        };

        this._cellMouseDown = function(ev) {
        };

        this._cellMouseMove = function(ev) {
        };

        this._cellClick = function(ev) {
            var month = this.parentNode.month;

            var x = this.x;
            var y = this.y;
            var day = month.cells[x][y].day;

            if (!month.cells[x][y].isClickable) {
                return;
            }

            calendar.clearSelection();
            
            calendar.selectionDay = day;

            var day = calendar.selectionDay;
            switch (calendar.selectMode) {
                case 'none':
                    //var s = month.cells[x][y];
                    calendar.selectionStart = day;
                    calendar.selectionEnd = day;
                    break;
                case 'day':
                    var s = month.cells[x][y];
                    calendar._addClass(s, 'select');
                    calendar.selected.push(s);
                    calendar.selectionStart = s.day;
                    calendar.selectionEnd = s.day;
                    break;
                case 'week':
                    for (var j = 0; j < 7; j++) {
                        calendar._addClass(month.cells[j][y], 'select');
                        calendar.selected.push(month.cells[j][y]);
                    }
                    calendar.selectionStart = month.cells[0][y].day;
                    calendar.selectionEnd = month.cells[6][y].day;
                    break;
                case 'month':
                    var start = null;
                    var end = null;
                    for (var y = 0; y < 6; y++) {
                        for (var x = 0; x < 7; x++) {
                            var s = month.cells[x][y];
                            if (!s) {
                                continue;
                            }
                            if (s.day.getYear() === day.getYear() && s.day.getMonth() === day.getMonth()) {
                                calendar._addClass(s, 'select');
                                calendar.selected.push(s);
                                if (start === null) {
                                    start = s.day;
                                }
                                end = s.day;
                            }
                        }
                    }
                    calendar.selectionStart = start;
                    calendar.selectionEnd = end;
                    break;
                default:
                    throw 'unknown selectMode';
            }

            calendar._timeRangeSelectedDispatch();
        };

        this._timeRangeSelectedDispatch = function() {
            var start = calendar.selectionStart;
            var end = calendar.selectionEnd.addDays(1);
            var days = DayPilot.Date.daysDiff(start.d, end.d);
            var day = calendar.selectionDay;

            if (calendar._api2()) {
                
                var args = {};
                args.start = start;
                args.end = end;
                args.day = day;
                args.days =  days;
                args.preventDefault = function() {
                    this.preventDefault.value = true;
                };
                
                if (typeof calendar.onTimeRangeSelect === 'function') {
                    calendar.onTimeRangeSelect(args);
                    if (args.preventDefault.value) {
                        return;
                    }
                }

                // now perform the default builtin action
                switch (calendar.timeRangeSelectedHandling) {
                    case 'Bind':
                        var bound = eval(calendar.bound);
                        if (bound) {
                            var selection = {};
                            selection.start = start;
                            selection.end = end;
                            selection.days = days;
                            selection.day = day;
                            bound.commandCallBack(calendar.command, selection);
                        }
                        break;
                    case 'None':
                        break;
                }
                
                if (typeof calendar.onTimeRangeSelected === 'function') {
                    calendar.onTimeRangeSelected(args);
                }
                
            }
            else {
                switch (calendar.timeRangeSelectedHandling) {
                    case 'Bind':
                        var bound = eval(calendar.bound);
                        if (bound) {
                            var selection = {};
                            selection.start = start;
                            selection.end = end;
                            selection.days = days;
                            selection.day = day;
                            bound.commandCallBack(calendar.command, selection);
                        }
                        break;
                    case 'JavaScript':
                        calendar.onTimeRangeSelected(start, end, day);
                        break;
                    case 'None':
                        break;
                }
            }
        };

        this._clickRight = function(ev) {
            calendar._moveMonth(calendar.skipMonths);
        };

        this._clickLeft = function(ev) {
            calendar._moveMonth(-calendar.skipMonths);
        };

        this._moveMonth = function(i) {
            this.startDate = this.startDate.addMonths(i);
            this._clearTable();
            this._prepare();
            this._drawMonths();
        };

        this.visibleStart = function() {
            return calendar.startDate.firstDayOfMonth().firstDayOfWeek(resolved.weekStarts());
        };

        this.visibleEnd = function() {
            return calendar.startDate.firstDayOfMonth().addMonths(this.showMonths - 1).firstDayOfWeek(resolved.weekStarts()).addDays(42);
        };

        this._drawMonths = function() {
            for (var j = 0; j < this.showMonths; j++) {
                var showLinks = this._getShowLinks(j);
                this._drawTable(j, showLinks);
            }
			
    	    this.root.style.height = this._getHeight() + "px"; 
        };
        
        this._getHeight = function() {
            var total = 0;
            for (var i = 0; i < this.months.length; i++) {
                var month = this.months[i];
                total += month.height;
            }
            return total;
        };
        
        this._getShowLinks = function(j) {
            if (this.internal.showLinks) {
                return this.internal.showLinks;
            }

            var showLinks = {};
            showLinks.left = (j === 0);
            showLinks.right = (j === 0);
            showLinks.before = j === 0;
            showLinks.after = j === this.showMonths - 1;

            return showLinks;
        };
        
        this.internal = {};
		
        this._resolved = {};
        var resolved = this._resolved;
        
        resolved.locale = function() {
            return DayPilot.Locale.find(calendar.locale);
        };
        
        resolved.weekStarts = function() {
            if (calendar.weekStarts === 'Auto') {
                var locale = resolved.locale();
                if (locale) {
                    return locale.weekStarts;
                }
                else {
                    return 0; // Sunday
                }
            }
            else {
                return calendar.weekStarts;
            }
        };

        this.clearSelection = function() {
            for (var j = 0; j < this.selected.length; j++) {
                this._removeClass(this.selected[j], 'select');
            }
            this.selected = [];
        };
        
        this._loadFromServer = function() {
            // make sure it has a place to ask
            if (this.backendUrl || typeof WebForm_DoCallback === 'function') {
                return (typeof calendar.items === 'undefined') || (!calendar.items);
            }
            else {
                return false;
            }
        };

        this.init = function() {
            this.root = document.getElementById(id);
            
            loadDefaultCss();
            
            if (this.root.dp) { // already initialized
                return;
            }
            
            this._adjustSelection();
            this._prepare();
            this._drawMonths();
            this._registerDispose();
            
            this.initialized = true;
        };
        
        this.dispose = function() {
            var c = calendar;
            
            if (!c.root) {
                return;
            }
            
            c.root.removeAttribute("style");
            c.root.removeAttribute("class");
            c.root.dp = null;
            c.root.innerHTML = null;
            c.root = null;
            
        };
        
        this._registerDispose = function() {
            var root = document.getElementById(id);
            root.dispose = this.dispose;
        };        
		
        this.Init = this.init;

    };

    // experimental jQuery bindings
    if (typeof jQuery !== 'undefined') {
        (function($) {
            $.fn.daypilotNavigator = function(options) {
                var first = null;
                var j = this.each(function() {
                    if (this.daypilot) { // already initialized
                        return;
                    };

                    var daypilot = new DayPilot.Navigator(this.id);
                    this.daypilot = daypilot;
                    for (var name in options) {
                        daypilot[name] = options[name];
                    }
                    daypilot.Init();
                    if (!first) {
                        first = daypilot;
                    }
                });
                if (this.length === 1) {
                    return first;
                }
                else {
                    return j;
                }
            };
        })(jQuery);
    }

    if (typeof Sys !== 'undefined' && Sys.Application && Sys.Application.notifyScriptLoaded) {
        Sys.Application.notifyScriptLoaded();
    }


})();
