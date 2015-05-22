/**
* @version     1.5.1
* @module      WebRotate 360 Product Viewer for OpenCart
* @author      WebRotate 360 LLC
* @copyright   Copyright (C) 2014 WebRotate 360 LLC. All rights reserved.
* @license     GNU General Public License version 2 or later (http://www.gnu.org/copyleft/gpl.html).
*/

function WR360InitEmbededViewer(licensePath, graphicsPath, configFileURL, divID, viewerWidth, viewerHeight, rootPath, baseWidth)
{
	var imageDiv = jQuery(divID);
	if (imageDiv.length <= 0)
		return;

	if (viewerWidth != "")
		imageDiv.css("width", viewerWidth);

	if (viewerHeight != "")
		imageDiv.css("height", viewerHeight)
	
	imageDiv.css("padding", 0);

    var baseWidthInt = parseInt(baseWidth);
	
	var newHtml = "<div id='wr360PlayerId'> \
        <script language='javascript' type='text/javascript'> \
            _imageRotator.settings.graphicsPath   = '" + graphicsPath + "'; \
            _imageRotator.settings.configFileURL  = '" + configFileURL + "'; \
            _imageRotator.settings.rootPath  = '" + rootPath + "'; \
            _imageRotator.settings.responsiveBaseWidth  = " + baseWidthInt + "; \
            _imageRotator.licenseFileURL = '" + licensePath + "'; \
        </script> \
    </div>";

	imageDiv.html(newHtml);
	imageDiv.css("visibility", "visible");
	_imageRotator.runImageRotator("wr360PlayerId");
}

function WR360InitGallery(skin)
{
    jQuery("a[rel^='prettyPhoto']").prettyPhoto({animation_speed:0, deeplinking:false, theme:skin});
}

function WR360InitPopupViewer(hrefParam, srcThumbPath, divID)
{
    var popupElm = jQuery(divID);
    if (popupElm.length <= 0)
        return;

    var vqmodThumb = popupElm.find("a.thumbnail");
    if (vqmodThumb.length <= 0)
    {
        var newHtml = "<a href='" + hrefParam + "'" + "rel='prettyPhoto'><img src='" + srcThumbPath + "'/></a>";
        popupElm.html(newHtml);
    }
    else
    {
        vqmodThumb.attr("href", hrefParam);
        var popupElmImg = vqmodThumb.find("img");
        if (popupElmImg.length > 0)
            popupElmImg.attr("src", srcThumbPath);
    }
}

