## Architecture advice and assisted installation

Developing a future-proof image management system isn't easy. A multitude of pitfalls and hidden costs exist, and nearly all the sample code and articles you'll find online will lead you straight into them. 

I've helped hundreds of enterprises achieve their scalability and performance goals, and it's much less expensive to avoid architectural errors before they're implemented.

For tech details about some of the challenges, [listen to my podcast with Scott Hanselman](http://www.hanselminutes.com/313/deep-inside-image-resizing-and-scaling-with-aspnet-and-iis-with-imageresizingnet-author-na).

Let me help your business ensure your design is scalable and secure with a 30-minute Q&A phone session. Payment by PayPal, Google Checkout, or credit card is accepted.

* $70 USD - 30 minute Q&A phone conference
* $130 USD - 1 Aided install + 30 minute Q&A
* $190 USD - 2 Aided installs + 30 minute Q&A

<form action="https://www.e-junkie.com/ecom/gb.php?c=cart&amp;i=939690&amp;cl=41912&amp;ejc=2" target="ej_ejc" method="POST" accept-charset="UTF-8">
Support Type<br/>
<select name="o1">
<option value="30 Minute QA">30 Minute QA ($70)</option>
<option value="1 Aided install + 30 Minute QA">1 Aided install + 30 Minute QA ($130)</option>
<option value="2 Aided installs + 30 Minute Q&amp;A">2 Aided installs + 30 Minute Q&amp;A ($190)</option>
<option value="Support Incident (Business)">Support Incident ($135)</option>
</select>

<input type="image" src="http://www.e-junkie.com/ej/ej_add_to_cart.gif" border="0"  alt="Add to Cart" class="ec_ejc_thkbx" onClick="javascript:return EJEJC_lc(this.parentNode);"/>
<a href="https://www.e-junkie.com/ecom/gb.php?c=cart&amp;cl=41912&amp;ejc=2" target="ej_ejc" class="ec_ejc_thkbx" onClick="javascript:return EJEJC_lc(this);"><img src="http://www.e-junkie.com/ej/ej_view_cart.gif" border="0" alt="View Cart"/></a>
</form>

<script language="javascript" type="text/javascript">
<!--
function EJEJC_lc(th) { return false; }
// -->
</script>
<script src='http://www.e-junkie.com/ecom/box.js' type='text/javascript'></script>

It's best to purchase the session a day before you'd like to schedule it, so we can choose a time that is optimal for everyone. 

Please download [TeamViewer light](http://s.ndj7.com) and have your ID and passcode ready when you call. 

## Typical availability


<script language="javascript">
function isDstInEffect(off){
	var d = new Date();
	//get the start and end dates for dst:(these rules are US only)
	var     y= d.getUTCFullYear(), countstart= 8, countend= 1,
	dstart= new Date(Date.UTC(y, 2, 8, 2, 0, 0, 0)),
	dend= new Date(Date.UTC(y, 10, 1, 2, 0, 0, 0));
	while(dstart.getUTCDay()!== 0) dstart.setUTCDate(++countstart);
	while(dend.getUTCDay()!== 0) dend.setUTCDate(++countend);

	//get the GMT time for the localized dst start and end times:
	//dstart.setUTCMinutes(off);
	//dend.setUTCMinutes(off);

	// if the date passed in is between dst start and dst end, adjust the offset and label:
	return (dstart<= d && dend>= d);
}
var now = new Date();


var edtOffset = isDstInEffect(-5 * 60) ? -4: -5;//-4, -5
var localOffset = now.getTimezoneOffset() / -60;


var a = (localOffset - edtOffset + 9) % 24;
var b = (localOffset - edtOffset + 21) % 24;
var mins =  now.getMinutes().toString(); 
if (mins.length == 1) mins = mins + '0';

document.write("Mon-Fri <strong>" + a + ":00 to " + b + ":00</strong> based on your estimated local time of " + now.getHours() + ":" + mins + ". This is 9am to 9pm EDT (my time zone).");
</script>
