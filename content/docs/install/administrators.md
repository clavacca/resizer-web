# Guide for Server Administrators

The Image Resizer IIS Module **requires no coding skills to install or use**. If you run into a problem installing it, [just email us for (free) help](/support)!

# Installing the HttpModule into an empty web site

1. Copy the contents of the `Samples\BasicIISSite\` folder of [the download](/download) into the new website.
2. Browse to the web site and type '/resizer.debug.ashx' directly after the domain or IP address. You should get a page of diagnostic information if everything is working. If you need help, [just ask](/support)!

## Installing the HttpModule into an existing web site

1. Copy `ImageResizer.dll` and `ImageResizer.pdb` [from the .zip download](/download) into the 'bin' folder of the website, creating it if it doesn't exist.
3. Save [this file](/attachments/Web.config.txt) into the root of the website and rename it to "Web.config". If a Web.config fie already exists, [you will need to edit it](/docs/install/web-config).
4. Browse to the web site and type '/resizer.debug.ashx' directly after the domain or IP address. You should get a page of diagnostic information if everything is working. If you need help, [just ask](/support)!

## Basic usage

The Image Resizer allows you to resize an image by just modifying the URL a little.

So given 'http://localhost/image.jpg', you could resize the image to 40px wide by using 'http://localhost/image.jpg?width=40'. You can do this from your browser's address bar, and HTML page, or anything. No more Photoshop just to do basic image changes.

[View more usage examples](/docs/examples)


## If you're not using IIS

If you're not hosting your website on a Windows server, consider having a secondary server or VM, and pointing a subdomain (like `images.mydomain.com`) to an IIS site to host your images. You can even do this on the same server, if (for example), you use Windows/Apache instead of Windows/IIS, or have an IIS website that is somehow incompatible with the Image Resizer (although that hasn't happened yet).

## Notes on IIS5, IIS6, and IIS7 Classic Mode

* By default, the aforementioned platforms do not allow the ImageResizer to interact with requests that don't end in ".ashx". So [without some more configuration](/docs/cleanurls), you will need to use the 'image.jpg.ashx?width=100' instead of the 'image.jpg?width=100' syntax. IIS7 or higher in Integrated mode doesn't have this problem.

## Notes on nested applications

* IIS permits an application (or web site) to have another application inside it. Nested applications inherit the web.config from the parent application, so they will also expect to find ImageResizer.dll in their /bin folder. So, you can either do [some fancy web.config editing to avoid the inheritance](http://aspdotnetfaq.com/Faq/how-to-disable-web-config-inheritance-for-child-applications-in-subfolders-in-asp-net.aspx), or just copy the bin folder into all the sub-applications, which is probably a less error-prone choice.

## Notes on existing ASP.NET MVC websites

Sometimes an ASP.NET MVC website can be configured to block the Image Resizer from working. This can be fixed by adding 2 lines of code in the Global.asax.cs file of the website.

In Global.asax.cs, search for RegisterRoutes

You should see either

	public static void RegisterRoutes(RouteCollection routes) {

or

	Public Static Sub RegisterRoutes(routes as RouteCollection)

Directly after, insert the following to lines:

		routes.IgnoreRoute("resizer\\debug(\\.ashx)?");
		routes.IgnoreRoute("[^?]+\\.(psd|bmp|gif|exif|png|tif|tiff|tff|jpg|jpeg|jpe|jif|jfif|jfi)(\\.ashx)?");

If the line started with "Public Static Sub", then remove the semicolon (;) from the end of the two lines of code.