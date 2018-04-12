function countUp(e, t, n, r, o, a) {
    for (var i = 0, s = ["webkit", "moz", "ms"], l = 0; l < s.length && !window.requestAnimationFrame; ++l) window.requestAnimationFrame = window[s[l] + "RequestAnimationFrame"], window.cancelAnimationFrame = window[s[l] + "CancelAnimationFrame"] || window[s[l] + "CancelRequestAnimationFrame"];
    window.requestAnimationFrame || (window.requestAnimationFrame = function(e, t) {
        var n = (new Date).getTime(),
            r = Math.max(0, 16 - (n - i)),
            o = window.setTimeout(function() {
                e(n + r)
            }, r);
        return i = n + r, o
    }), window.cancelAnimationFrame || (window.cancelAnimationFrame = function(e) {
        clearTimeout(e)
    }), this.options = a || {
        useEasing: !0,
        useGrouping: !0,
        separator: ",",
        decimal: "."
    }, "" == this.options.separator && (this.options.useGrouping = !1);
    var c = this;
    this.d = "string" == typeof e ? document.getElementById(e) : e, this.startVal = Number(t), this.endVal = Number(n), this.countDown = this.startVal > this.endVal, this.startTime = null, this.timestamp = null, this.remaining = null, this.frameVal = this.startVal, this.rAF = null, this.decimals = Math.max(0, r || 0), this.dec = Math.pow(10, this.decimals), this.duration = 1e3 * o || 2e3, this.version = function() {
        return "1.1.1"
    }, this.easeOutExpo = function(e, t, n, r) {
        return n * (1 - Math.pow(2, -10 * e / r)) * 1024 / 1023 + t
    }, this.count = function(e) {
        null === c.startTime && (c.startTime = e), c.timestamp = e;
        var t = e - c.startTime;
        if (c.remaining = c.duration - t, c.options.useEasing)
            if (c.countDown) {
                var n = c.easeOutExpo(t, 0, c.startVal - c.endVal, c.duration);
                c.frameVal = c.startVal - n
            } else c.frameVal = c.easeOutExpo(t, c.startVal, c.endVal - c.startVal, c.duration);
        else if (c.countDown) {
            var n = (c.startVal - c.endVal) * (t / c.duration);
            c.frameVal = c.startVal - n
        } else c.frameVal = c.startVal + (c.endVal - c.startVal) * (t / c.duration);
        c.frameVal = Math.round(c.frameVal * c.dec) / c.dec, c.countDown ? c.frameVal = c.frameVal < c.endVal ? c.endVal : c.frameVal : c.frameVal = c.frameVal > c.endVal ? c.endVal : c.frameVal, c.d.innerHTML = c.formatNumber(c.frameVal.toFixed(c.decimals)), t < c.duration ? c.rAF = requestAnimationFrame(c.count) : null != c.callback && c.callback()
    }, this.start = function(e) {
        return c.callback = e, isNaN(c.endVal) || isNaN(c.startVal) ? (console.log("countUp error: startVal or endVal is not a number"), c.d.innerHTML = "--") : c.rAF = requestAnimationFrame(c.count), !1
    }, this.stop = function() {
        cancelAnimationFrame(c.rAF)
    }, this.reset = function() {
        c.startTime = null, cancelAnimationFrame(c.rAF), c.d.innerHTML = c.formatNumber(c.startVal.toFixed(c.decimals))
    }, this.resume = function() {
        c.startTime = null, c.duration = c.remaining, c.startVal = c.frameVal, requestAnimationFrame(c.count)
    }, this.formatNumber = function(e) {
        e += "";
        var t, n, r, o;
        if (t = e.split("."), n = t[0], r = t.length > 1 ? c.options.decimal + t[1] : "", o = /(\d+)(\d{3})/, c.options.useGrouping)
            for (; o.test(n);) n = n.replace(o, "$1" + c.options.separator + "$2");
        return n + r
    }, c.d.innerHTML = c.formatNumber(c.startVal.toFixed(c.decimals))
}

function addBullets(e, t, n) {
    for (var r = 0; r < e.length; r++)
        if (e[r].textContent == t) {
            for (var o = e[r].nextSibling; o && (console.log(o), "UL" != o.nodeName); o = o.nextSibling);
            o.classList.add("bullet", n);
            break
        }
}

function get(e) {
    return document.getElementById(e)
}

function formSet(e) {
    var t = document.getElementById(e);
    t && void 0 != Session.get(e) && ("radio" == t.type ? t.checked = Session.get(e) : "activity" == e ? t[Session.get(e)].selected = !0 : t.value = Session.get(e))
}

function focusit(e) {
    var t = document.getElementById(e);
    t.focus(), t.select()
}

function setSuccess(e) {
    e = document.getElementById(e), hasClass(e, "error") && removeClass(e, "error")
}

function setError(e, t) {
    e = document.getElementById(e), addClass(e, "error");
    var n = e.getElementsByTagName("span")[0];
    n && (n.innerHTML = t)
}

function cancelDefaultAction(e) {
    var t = e || window.event;
    return t.preventDefault && t.preventDefault(), t.returnValue = !1, !1
}

function isNum(e, t, n) {
    return !!/(^\d+$)|(^\d+\.\d+$)/.test(e) || (setError(n, "Enter numbers only"), t = document.getElementById(t), t.focus(), t.select(), !1)
}

function isNumeric(e, t, n) {
    return !!/(^\d+$)|(^\d+\.\d+$)/.test(e) || (t && (alert(t + " Please enter numbers only."), get(n).focus(), get(n).select()), !1)
}

function printThis(e) {
    "string" == typeof e && (e = document.getElementById(e));
    var t = document.getElementsByTagName("link"),
        n = document.getElementsByTagName("style"),
        r = window.open("", "printWindow", "left=50,top=50,width=500,height=500,scrollbars=yes,status=yes,resizable=yes"),
        o = r.document;
    return o.open(), o.writeln("<html><head><title>" + document.title + "</title>"), t && o.writeln("<link rel='stylesheet' type='text/css' href='" + t[1].getAttribute("href") + "'/>"), n && n.length > 0 && o.writeln("<style type='text/css'>" + n[0].innerHTML + "</style>"), o.writeln("</head><body>"), o.writeln(e.innerHTML), o.writeln("</body></html>"), o.close(), r.print(), r.close(), !1
}

function addLoadEvent(e) {
    var t = window.onload;
    "function" != typeof window.onload ? window.onload = e : window.onload = function() {
        t(), e()
    }
}

function calcalcIt() {
    var e = document.calc;
    Session.set("weight", e.weight.value), Session.set("age", e.age.value), Session.set("feet", e.feet.value), Session.set("inches", e.inches.value), Session.set("cm", e.cm.value), Session.set("sexFem", e.sexFem.checked), Session.set("sexMale", e.sexMale.checked), Session.set("weighttype1", e.weighttype1.checked), Session.set("weighttype2", e.weighttype2.checked), Session.set("heightFeet", e.heightFeet.checked), Session.set("heightCM", e.heightCM.checked), Session.set("activity", e.activity.selectedIndex);
    var t = parseInt(1 * e.weight.value, 10),
        n = parseInt(1 * e.age.value, 10),
        r = parseInt(1 * e.feet.value, 10),
        o = parseInt(1 * e.inches.value, 10),
        a = parseInt(1 * e.cm.value, 10),
        i = parseInt(1 * e.txtBF.value, 10),
        s = 0,
        l = 0;
    if (!isNum(n, "age", "ageerror")) return !1;
    if (n <= 12 || n > 80) return setError("ageerror", "Between 13 and 80"), focusit("age"), !1;
    if (setSuccess("ageerror"), !isNum(t, "weight", "weighterror")) return !1;
    if (t <= 40 || t > 600) return setError("weighterror", "Enter a valid weight"), focusit("weight"), !1;
    if (setSuccess("weighterror"), e.height[0].checked) {
        if (!isNum(r, "feet", "feeterror")) return !1;
        if (r < 4 || r > 7) return setError("feeterror", "Between 4 and 7 feet"), focusit("feet"), !1;
        if (setSuccess("feeterror"), !isNum(o, "inches", "incheserror")) return !1;
        if (o > 11) return setError("incheserror", "Less than 12"), focusit("inches"), !1;
        setSuccess("incheserror"), s = 2.54 * (12 * r + o)
    } else {
        if (!isNum(a, "cm", "cmerror")) return !1;
        if (a < 50) return setError("cmerror", "Height required"), focusit("cm"), !1;
        setSuccess("cmerror"), s = a
    }
    if (e.optFormula[1].checked) {
        if (!isNum(i, "txtBF", "bferror")) return !1;
        if (i <= 3) return setError("bferror", "Body Fat % Required"), focusit("txtBF"), !1;
        setSuccess("bferror")
    }
    if (e.weighttype[0].checked && (t /= 2.2), e.optFormula[2].checked) l = e.sex[1].checked ? 66.5 + 13.75 * t + 5.003 * s - 6.775 * n : 655.1 + 9.563 * t + 1.85 * s - 4.676 * n;
    else if (e.optFormula[1].checked) {
        var c = t - t * (i / 100);
        l = 21.6 * c + 370
    } else l = e.sex[1].checked ? 5 + 10 * t + 6.25 * s - 5 * n : 10 * t - 161 + 6.25 * s - 5 * n;
    var u = l * e.activity.options[e.activity.selectedIndex].value,
        d = !1;
    1 == e.activity.options[e.activity.selectedIndex].value && (d = !0);
    var h = 2.2 * t * 8,
        f = "CALORIES/DAY";
    if (e.optResults[0].checked) {
        var m = get("linkNutrient").href; - 1 != m.indexOf("?") && (m = m.substring(0, m.indexOf("?"))), m += "?cals=" + Math.round(u), get("linkNutrient").href = m
    } else u *= 4.184, h *= 4.184, f = "kJ PER DAY";
    get("cal1").innerHTML = f, get("cal2").innerHTML = f, get("cal3").innerHTML = f;
    var g = Math.round(u);
    get("answer").innerHTML = g;
    var v = u - .2 * u;
    v < h && h <= u && (v = h), g = Math.round(v), get("lose").innerHTML = g;
    var p = u - .4 * u;
    p < h && h <= u && (p = h), g = Math.round(p), get("loseExt").innerHTML = g;
    var w = u + .2 * u;
    g = Math.round(w);
    for (var y = new Array(1, .8, 1.2, 1, .9, 1.1, 1), E = document.getElementById("zigResultsTable"), b, S = 1; S < E.rows.length; ++S)
        for (var T = E.rows[S], k = 1; k < T.cells.length; ++k) 1 == k && (b = u * y[S - 1]), 2 == k && (b = v * y[S - 1]), 3 == k && (b = p * y[S - 1]), 4 == k && (b = w * y[S - 1]), b < h && (b = h), T.cells[k].innerHTML = Math.ceil(b), d && (T.cells[k].innerHTML = "-");
    get("printArea").style.display = "block", smoothScroll(document.getElementById("Button1"), 500);
    var N = {
            useEasing: !1,
            useGrouping: !1,
            separator: "",
            decimal: "."
        },
        C = new countUp("answer", 500, Math.round(u), 0, .5, N),
        x = new countUp("lose", 500, Math.round(v), 0, .5, N),
        M = new countUp("loseExt", 500, Math.round(p), 0, .5, N);
    return C.start(), d ? (get("loseExt").innerHTML = "-", get("lose").innerHTML = "-") : (x.start(), p == v ? get("loseExt").innerHTML = '<span class="cal">TOO LOW!</span>' : M.start()), !0
}

var width = window.innerWidth || document.documentElement.clientWidth;
if ((width <= 992 || window.hidead) && (document.getElementById("adsidebar").className = ""), function e() {
        for (var t = document.getElementsByTagName("a"), n = 0; n < t.length; n++) - 1 != t[n].href.indexOf("freedieting") || t[n].onclick || (t[n].onclick = function() {
            var e = this.href.substring(7);
            "undefined" != typeof _gaq && _gaq.push(["_trackEvent", "Outbound", e])
        })
    }(), JSON && JSON.stringify && JSON.parse) var Session = Session || function() {
    function e() {
        var e = "store",
            t = document.cookie.match(new RegExp("store=([^;]+)"));
        return t ? JSON.parse(t[1]) : {}
    }

    function t(e) {
        var t;
        if (e) {
            var n = new Date;
            n.setTime(n.getTime() + 24 * e * 60 * 60 * 1e3), t = "; expires=" + n.toGMTString()
        } else t = "";
        document.cookie = "store=" + JSON.stringify(r) + t + "; path=/"
    }

    function n() {
        t(365)
    }
    var r = e();
    return window.addEventListener ? window.addEventListener("unload", n, !1) : window.attachEvent ? window.attachEvent("onunload", n) : window.onunload = n, {
        set: function(e, t) {
            r[e] = t
        },
        get: function(e) {
            return r[e] ? r[e] : void 0
        },
        clear: function() {
            r = {}, t(-1)
        }
    }
}();
var toStore = Session.get("age");
void 0 != toStore && (console.log("Restored from cookies" + toStore), formSet("age"), formSet("weight"), formSet("feet"), formSet("inches"), formSet("cm"), formSet("sexFem"), formSet("sexMale"), formSet("weighttype1"), formSet("weighttype2"), formSet("heightFeet"), formSet("heightCM"), formSet("activity"));
var hasClass = function(e, t) {
        return new RegExp(" " + t + " ").test(" " + e.className + " ")
    },
    removeClass = function(e, t) {
        var n = " " + e.className.replace(/[\t\r\n]/g, " ") + " ";
        if (hasClass(e, t)) {
            for (; n.indexOf(" " + t + " ") >= 0;) n = n.replace(" " + t + " ", " ");
            e.className = n.replace(/^\s+|\s+$/g, "")
        }
    },
    addClass = function(e, t) {
        hasClass(e, t) || (e.className += " " + t)
    },
    toggleClass = function(e, t) {
        hasClass(e, t) ? removeClass(e, t) : addClass(e, t)
    },
    getSiblings = function(e) {
        for (var t = [], n = e.parentNode.firstChild, r = e; n; n = n.nextSibling) 1 == n.nodeType && n != e && t.push(n);
        return t
    };
if ("querySelector" in document && "addEventListener" in window) {
    var dropToggle = document.querySelectorAll(".dropdown > a"),
        dropWrapper = document.querySelectorAll(".dropdown"),
        dropContent = document.querySelectorAll(".dropdown-menu");
    document.addEventListener("click", function(e) {
        [].forEach.call(dropToggle, function(e) {
            removeClass(e, "active")
        }), [].forEach.call(dropWrapper, function(e) {
            removeClass(e, "active")
        }), [].forEach.call(dropContent, function(e) {
            removeClass(e, "active")
        })
    }, !1), [].forEach.call(dropToggle, function(e) {
        e.addEventListener("click", function(t) {
            t.stopPropagation(), t.preventDefault();
            var n = e.nextElementSibling,
                r = e.parentNode,
                o = getSiblings(r);
            toggleClass(e, "active"), toggleClass(n, "active"), toggleClass(r, "active"), [].forEach.call(o, function(e) {
                var t = e.children;
                removeClass(e, "active"), [].forEach.call(t, function(e) {
                    removeClass(e, "active")
                })
            })
        }, !1)
    }), [].forEach.call(dropContent, function(e) {
        e.addEventListener("click", function(e) {
            e.stopPropagation()
        }, !1)
    })
}
    smoothScroll = function(e, t) {
        var n = window.pageYOffset,
            r = e.offsetTop,
            o = r - n,
            a = o / (t / 16),
            i = function() {
                window.scrollBy(0, a), s()
            };
        if (a >= 0) var s = function() {
            var e = window.pageYOffset;
            (e >= r - a || window.innerHeight + e >= document.body.offsetHeight) && clearInterval(l)
        };
        else var s = function() {
            window.pageYOffset <= (r || 0) && clearInterval(l)
        };
        var l = setInterval(i, 16)
    };
if ("querySelector" in document && "addEventListener" in window && Array.prototype.forEach) {
    var showTab = function(e) {
            var t = e.getAttribute("data-target"),
                n = document.querySelector(t),
                r = getSiblings(n),
                o = e.parentNode,
                a = getSiblings(o);
            addClass(e, "active"), addClass(o, "active"), [].forEach.call(a, function(e) {
                removeClass(e, "active")
            }), addClass(n, "active"), [].forEach.call(r, function(e) {
                removeClass(e, "active")
            })
        },
        tabToggle = document.querySelectorAll(".tabs a, .tabs button");
    [].forEach.call(tabToggle, function(e) {
        e.addEventListener("click", function(t) {
            t.preventDefault(), showTab(e)
        }, !1)
    })
}