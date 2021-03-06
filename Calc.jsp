<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="js">
<head>
<title>Calorie Calculator - Daily Caloric Needs</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="icon" type="image/png" href="/apple-touch-icon.png">
<link rel="preload" href="/images/freedieting-logo.png" as="image">
<link rel="preload" as="font" href="/fonts/source-sans-pro-v11-latin-regular.woff2" type="font/woff2" crossorigin/>
<link rel="preload" as="font" href="/fonts/source-sans-pro-v11-latin-700.woff2" type="font/woff2" crossorigin/>
<link href="https://fonts.googleapis.com/css?family=Gloria+Hallelujah" rel="stylesheet">
	<link rel="stylesheet" href="calc.css">
	<link rel="stylesheet" href="calcBeautified.css">
	<link rel="stylesheet" href="loginCSS.css?v=1.3">
	<link rel="stylesheet" href="menu.css?v=1.7"> 	

  </head>
<body>
<div id="wrap">
  <div id="regbar">
    <div id="navthing">
      <h2><a href="#" id="loginform">Login</a> | <a href="#">Register</a></h2>
    <div class="login">
      <div class="arrow-up"></div>
      <div class="formholder">
        <div class="randompad">
           <fieldset>
             <label name="email">Email</label>
             <input type="email" placeholder="example@example.com" />
             <label name="password">Password</label>
             <input type="password" placeholder="Password" />
             <input type="submit" value="Login" /> 
           </fieldset>
        </div>
      </div>
    </div>
    </div>
  </div>
</div>

<nav role="navigation">
  <div id="menuToggle">
   <input type="checkbox" />
   
   <span></span>
    <span></span>
    <span></span>
   
    <ul id="menu">
      <a href="login.jsp">
        <li>Home</li>
      </a>
      <a href="Article.jsp">
        <li>Articles</li>
      </a>
      <a href="Calc.jsp">
        <li>Calorie calculator</li>
      </a>
      <a href="bmi.jsp">
        <li>Body mass index</li>
      </a>
      <a href="Challenges.jsp">
        <li>Challenges</li>
      </a>
		 <a href="Diet.jsp">
        <li>Diet</li>
		</a>
    </ul>
  </div>
</nav>
<section class="container" style="margin-left:25%;width:750px;font-size:17px;">
<center><h1 style=" background-image: url(https://lazarangelov.academy/assets/img/png/program-workout-black-pattern.png);
width:90%;color:white;font-family: 'Gloria Hallelujah', cursive;font-size:50px;text-align:center;">Calorie Calculator</h1></center>
<style type="text/css">
.displayNone { display:none; }
.displayBlock { display:block !important; }
#advanced { background-color: #FFFFFF; border: 1px solid #DEDEDE; display: none; font-size: 0.8125em; margin-left: auto; margin-right: auto; max-width: 350px; padding: 2%; }
.tooltable td { border-width:0; }
#zigResultsTable td { padding: 0px 4px 0px 4px; border:1px solid #d9d9d9; border-right:0; border-left:0; }
#zigResultsTable { width:100%; }
.small { font-size:13px; }
table.formulas .small { font-size:12px; }10
#nowwhat { min-width:75%; background: #d6d6d6; background: rgba(0, 0, 0, 0.06); border-radius: 3px; padding: 6px 12px; }
</style>
<script>

function init() {
	get("age").focus();
	oForm = document.calc;
	if (oForm.height[0].checked) { 
	   showFeet(); }
	   else 
	   {
	showCM();
	}
}

document.addEventListener('DOMContentLoaded', init, false);

function showFeet() {
	var divblock = document.getElementById("feetlabel");
	divblock.style.display = "block";
	var cmblock = document.getElementById("cmlabel");
	cmblock.style.display = "none";
}

function showCM() {
	var divblock = document.getElementById("feetlabel");
	divblock.style.display = "none";
	var cmblock = document.getElementById("cmlabel");
	cmblock.style.display = "block";
}

function toggleMe(trigger, div) {
  toggleClass(document.getElementById(div),"displayBlock");
}</script>
 <noscript>
      <div class="alert">Hey! You have JavaScript disabled on your browser. The calculator will not work. <a target="_blank" href="http://www.enable-javascript.com/">See how to enable JavaScript on your browser.</a></div>
      </noscript>
<div class="tooltable">
        <form name="calc" class="no-space-bottom">
          <h2 style="background: linear-gradient(to bottom right, #ffffff 27%, #d8c3ba 100%);color:#893838;">DAILY CALORIC INTAKE CALCULATOR</h2>
          <div class="label-align">
            <label>Age</label>
            <span id="ageerror"><span class="tip"></span>
            <input name="age" type="number" id="age" autocorrect="off">
            <label class="inline">Years </label>
            </span> </div>
          <div class="label-align">
            <label>Gender</label>
            <input type="radio" name="sex" id="sexFem" value="F" checked>
            <label for="sexFem" class="inline">Female</label>
            <input type="radio" name="sex" id="sexMale" value="M">
            <label for="sexMale" class="inline">Male</label>
          </div>
          <div class="label-align">
            <label>Current Weight</label>
            <span id="weighterror"><span class="tip"></span>
            <input name="weight"  type="number" id="weight"  autocorrect="off">
            </span>
            <input name="weighttype" type="radio" class="rad" id="weighttype1" value="P" checked>
            <label for="weighttype1" class="inline">Pounds</label>
            <input name="weighttype" type="radio" class="rad" id="weighttype2" value="K">
            <label for="weighttype2" class="inline">Kilos</label>
          </div>
          <div class="label-align">
            <label>Height</label>
            <input name="height" type="radio" class="rad" id="heightFeet" value="F" checked onclick="showFeet();">
            <label class="inline" for="heightFeet">Feet &amp; Inches</label>
            <input name="height" type="radio" class="rad" id="heightCM" value="C" onclick="showCM();">
            <label  class="inline" for="heightCM">CMs</label>
            <div id="feetlabel">
              <label>Feet</label>
              <span id="feeterror"><span class="tip"></span>
              <input name="feet" type="number" id="feet" autocorrect="off" >
              </span>
              <label class="inline">Inches</label>
              <span id="incheserror"><span class="tip"></span>
              <input name="inches" type="number"  id="inches" autocorrect="off">
              </span> </div>
            <div id="cmlabel" style="display:none;">
              <label>CM</label>
              <span id="cmerror"><span class="tip"></span>
              <input name="cm" type="number" id="cm" autocorrect="off">
              </span> </div>
          </div>
          <div class="label-align">
            <label>Exercise level</label>
            <select name="activity" id="activity">
              <option value="1.0" >Basal Metabolic Rate</option>
              <option value="1.2" >Little/no exercise</option>
              <option  selected="true" value="1.375">3 times/week</option>
              <option value="1.4187">4 times/week</option>
              <option value="1.4625">5 times/week</option>
              <option value="1.550">Daily</option>
              <option value="1.6375">5 times/week (intense)</option>
              <option value="1.725">Daily (intense) or twice daily</option>
              <option value="1.9">Daily exercise + physical job</option>
            </select>
            <div class="formnote">Exercise = 15-30 mins elevated heart rate. <br />
              Intense = 45+ mins elevated heart rate.</div>
          </div>
          <div class="text-center dropdown-calc"> <a class="btn" href="#" onClick="toggleMe(this,'advanced');return false;"><i class="icon-cogs"></i> Advanced Options</a></div>
          <div id="advanced">
            <label class="text-bold">Results in</label>
            <input name="optResults" type="radio" class="rad" id="optResults" value="C" checked>
            <label for="optResults" class="inline">Calories</label>
            <input name="optResults" type="radio" class="rad" id="optResults2" value="K">
            <label for="optResults2" class="inline">Kilojoules</label>
            <label class="text-bold">Formula</label>
            <input type="radio" class="rad" name="optFormula" id="optMS" value="M" checked onClick="document.getElementById('txtBF').disabled=true;">
            <label for="optMS" class="inline">Mifflin-St Jeor</label>
            <br />
            <input type="radio" class="rad"  name="optFormula" id="optLM" value="L"   onClick="document.getElementById('txtBF').disabled=false;document.getElementById('txtBF').focus();">
            <label for="optLM" class="inline">Katch-McArdle: Enter <a href="https://www.freedieting.com/body-fat-calculator" target="_blank">Body Fat %</a></label>
            <span id="bferror"><span class="tip"></span>
            <input name="txtBF" type="number" class="text-small input-inline" id="txtBF" size="2" disabled="disabled">
            <br />
            <input type="radio" class="rad"  name="optFormula" id="optHB" value="H" onClick="document.getElementById('txtBF').disabled=true;">
            <label for="optHB" class="inline">Harris-Benedict</label>
            </span>
            <div class="text-center"> <a href="/calorie-needs" target="_blank">Explain formulas</a></div>
          </div>
          <div class="space-top-large">
            <input type="submit" class="btn btn-blue btn-large float-center text-tall" value="Calculate" style="padding: 7px 40px;float:center;background: #893838;" onClick="calcalcIt();cancelDefaultAction(event);" id="Button1" name="Button1">
          </div>
          <div id="printArea" style="display:none;">
            <div id="printAreainset">
               <h2 id="results" style="background: linear-gradient(to bottom right, #ffffff 27%, #d8c3ba 100%);color:#893838;">TOTAL CALORIES</h2>
              <div class="tooltable float-center" style="min-width:80%;padding-right:0;padding-left:0;">
                <p><label class="text-center">Including Exercise</label></p>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="box-shadow:none;">
                  <tr>
                    <td align="right" class="tooltable-cell-width"><label class="biglabel"><a href="/weight-loss-guide">Maintenance</a></label></td>
                    <td align="left" class="tooltable-cell-width"><div class="calwrap" style="color: #893838;"><span id="answer">?</span><span id="cal1" class="cal">CALORIES/DAY</span></div></td>
                  </tr>
                  <tr>
                    <td align="right"><label class="biglabel"><a href="/weight-loss-guide">Fat Loss</a></label></td>
                    <td align="left"><div class="calwrap" style="color: #893838;"><span id="lose">?</span><span id="cal2" class="cal">CALORIES/DAY</span></div></td>
                  </tr>
                  <tr>
                    <td align="right" valign="middle"><label class="biglabel"><a  href="/weight-loss-fast">Extreme Fat Loss</a></label></td>
                    <td  align="left"><div class="calwrap" style="color: #893838;"><span id="loseExt">?</span><span id="cal3" class="cal">CALORIES/DAY</span></div></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center"><div class="dropdown-calc"><a class="btn btn-blue" href="#" onClick="toggleMe(this,'zigResults');return false;">7 day calorie cycle (zig-zag)</a></div></td>
                  </tr>
                </table>
                <div id="zigResults" class="displayNone scrollable" style="background-color:#fff;box-shadow:-5px 0 10px -5px #555 inset;">
                  <table id="zigResultsTable"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>&nbsp;</td>
                      <td align="right"><strong>Maintain</strong></td>
                      <td align="right" bgcolor="#efefef"><strong>Fat Loss</strong></td>
                      <td align="right"><strong>Extreme Fat Loss</strong></td>
                    </tr>
                    <tr>
                      <td><strong>Monday</strong></td>
                      <td align="right">&nbsp;</td>
                      <td align="right" bgcolor="#efefef">&nbsp;</td>
                      <td align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><strong>Tuesday</strong></td>
                      <td align="right">&nbsp;</td>
                      <td align="right" bgcolor="#efefef">&nbsp;</td>
                      <td align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><strong>Wednesday</strong></td>
                      <td align="right">&nbsp;</td>
                      <td align="right" bgcolor="#efefef">&nbsp;</td>
                      <td align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><strong>Thursday</strong></td>
                      <td align="right">&nbsp;</td>
                      <td align="right" bgcolor="#efefef">&nbsp;</td>
                      <td align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><strong>Friday</strong></td>
                      <td align="right">&nbsp;</td>
                      <td align="right" bgcolor="#efefef">&nbsp;</td>
                      <td align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><strong>Saturday</strong></td>
                      <td align="right">&nbsp;</td>
                      <td align="right" bgcolor="#efefef">&nbsp;</td>
                      <td align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><strong>Sunday</strong></td>
                      <td align="right">&nbsp;</td>
                      <td align="right" bgcolor="#efefef">&nbsp;</td>
                      <td align="right">&nbsp;</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
 <div style="margin:10px 0px 10px 0;text-align:right;display:none" ><a style="text-decoration:none;color:#aaa; " href="#" onClick="printThis('printAreainset');return false;" title="Print results"><img src="/images/print-icon.png" style="vertical-align:middle;" width="17" height="19" alt="Print results"> Print</a></div>
            <div id="nowwhat" class="float-center"><b>Now what?</b>
              <ol>           
                <li style="display:none">Experts: Tweak carb/fat/protein with our <a href="/nutrient-calculator" id="linkNutrient" >macro calculator</a>.</li>
               </ol>
            </div>
          </div>
        </form>
      </div>
 </div>
</section><br><br>
<footer style="background: linear-gradient(to bottom right, #ffffff 27%, #d8c3ba 100%);height:50%">
  <center>
<a style="font-size:22px;font-family: 'IM Fell Great Primer SC', serif;" href="SiteMap.jsp">Site Map</a> | 
<a style="font-size:22px;font-family: 'IM Fell Great Primer SC', serif;"href="#">Privacy Policy</a>
<img  border="0" class="img_zoom" src="footer\twitter.png" style="height:40px;width:40px; float:center;" title="Twitter" alt="Twitter">
<img border="0" class="img_zoom" src="footer\facebook.png" style="height:40px;width:40px; float:center;" title="Facebook" alt="Facebook">
<img border="0" class="img_zoom" src="footer\ldn.png" style="height:40px;width:40px; float:center;" title="linkedin" alt="linkedin">
<img border="0" class="img_zoom" src="footer\googleplus.png" style="height:40px;width:40px; float:center;"  title="GooglePlus" alt="GooglePlus">
<p style="font-size:20px;font-family: 'IM Fell Great Primer SC', serif;">Nume Site &copy;. All rights reserved.</p>
</center>
</footer>

<script  src="calcBeautified.js" type="text/javascript"></script>


</body>
</html>
