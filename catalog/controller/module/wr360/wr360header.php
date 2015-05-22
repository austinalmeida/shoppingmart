<?php
/**
* @version     1.5.1
* @module      WebRotate 360 Product Viewer for OpenCart
* @author      WebRotate 360 LLC
* @copyright   Copyright (C) 2014 WebRotate 360 LLC. All rights reserved.
* @license     GNU General Public License version 2 or later (http://www.gnu.org/copyleft/gpl.html).
*/


// TODO: copy joomla css to svn first than here.

class WebRotate360HeaderHook
{
    private $_controller;
    private $_db;
    private $_scriptsPath;
    private $_headersArray = array();
    private $_popupGallery;
    private $_popupEnabled;
    private $_rootPath;
    private $_confFileURL;
    private $_viewEnabled;
    private $_masterConfigURL;
    private $_pagePlaceholder;
    private $_viewerWidth;
    private $_viewerHeight;
    private $_licensePath;
    private $_baseWidth;
    private $_graphicsPath;
    private $_viewerSkin;
    private $_viewerInPopup;

    public function __construct($controller, $db)
    {
        $this->_controller = $controller;
        $this->_db = $db;

        $catalogPath = "catalog";
        if (defined("DIR_APPLICATION"))
            $catalogPath = preg_replace('/.*\/([^\/].*)\//is', '$1', DIR_APPLICATION);

        $this->_scriptsPath  = $catalogPath . "/controller/module/wr360";
        $this->_rootPath     = "";
        $this->_confFileURL  = "";
        $this->_viewEnabled  = false;
    }

    public function isCanProceed()
    {
        if (defined("webrotate360_headers"))
            return (false);

        if (!isset($GLOBALS["request"]))
            return (false);

        if (!isset($GLOBALS["request"]->get["route"]))
            return (false);

        if (!preg_match("/product/is", $GLOBALS["request"]->get["route"]))
            return (false);

        if (!isset($GLOBALS["request"]->get["product_id"]))
            return (false);

        $moduleStatus = $this->_controller->config->get("webrotate360_status");
        if (empty($moduleStatus))
            return (false);

        return (true);
    }

    public function initProductRecord()
    {
        try
        {
            $tableName = DB_PREFIX . "wr360product";
            $query = $this->_db->query("SELECT * FROM `$tableName` WHERE product_id = '" . $GLOBALS["request"]->get["product_id"] . "'");

            foreach ($query->rows as $result)
            {
                $this->_rootPath    = $result["root_path"];
                $this->_confFileURL = $result["config_file_url"];
                $this->_viewEnabled = $result["wr360_enabled"];
                break;
            }
        }
        catch (Exception $exp)
        {
            return (false);
        }

        return (true);
    }

    public function initConfigSettings()
    {
        try
        {
            $this->_masterConfigURL = $this->_controller->config->get("webrotate360_configFileURL");
            $this->_pagePlaceholder = $this->_controller->config->get("webrotate360_divID");
            $this->_viewerWidth     = $this->_controller->config->get("webrotate360_viewerWidth");
            $this->_viewerHeight    = $this->_controller->config->get("webrotate360_viewerHeight");
            $this->_licensePath     = $this->_controller->config->get("webrotate360_licensePath");
            $this->_baseWidth       = $this->_controller->config->get("webrotate360_baseWidth");
            $this->_viewerSkin      = $this->_controller->config->get("webrotate360_skinCSS");
            $this->_viewerInPopup   = $this->_controller->config->get("webrotate360_viewerInPopup");
            $this->_graphicsPath    = $this->_scriptsPath . "/html/img/" . $this->_viewerSkin;
            $this->_popupGallery    = $this->_controller->config->get("webrotate360_prettyPhotoSkin");
            $this->_popupEnabled    = ($this->_popupGallery !== "disabled");

            if (!empty($this->_viewerWidth))
            {
                $this->_viewerWidth = str_ireplace("px", "", $this->_viewerWidth);
                if ((!$this->_viewerInPopup) && (strpos($this->_viewerWidth, "%") === FALSE))
                    $this->_viewerWidth .= "px";
            }

            if (!empty($this->_viewerHeight))
            {
                $this->_viewerHeight = str_ireplace("px", "", $this->_viewerHeight);
                if ((!$this->_viewerInPopup) && (strpos($this->_viewerHeight, "%") === FALSE))
                    $this->_viewerHeight .= "px";
            }

            if (!empty($this->_baseWidth))
                $this->_baseWidth = preg_replace("/[^0-9]/", "", $this->_baseWidth);

            if (empty($this->_baseWidth))
                $this->_baseWidth = 0;

            if (empty($this->_licensePath))
                $this->_licensePath = ($this->_viewerInPopup) ? "html/license.lic" : $this->_scriptsPath . "/html/license.lic";

            if (empty($this->_confFileURL))
                $this->_confFileURL = $this->_masterConfigURL;

            if (empty($this->_viewerSkin))
                $this->_viewerSkin = "basic.css";

            if ($this->_popupGallery === "default")
                $this->_popupGallery = "pp_default";
        }
        catch (Exception $exp)
        {
            return (false);
        }

        return (true);
    }

    public function parseHeadersAndReturnOutput($output)
    {
        if (empty($this->_headersArray))
            return ($output);

        $successAppend = false;
        $headers = "\r\n" . implode("\r\n", $this->_headersArray) . "\r\n";
        if (strpos($output, "</head>"))
        {
            $output = preg_replace('/\<\/head\>/is', $headers . "</head>", $output, 1, $replacedCount);
            if ($replacedCount > 0)
                $successAppend = true;
        }
        else
        {
            $output = $output . $headers;
            $successAppend = true;
        }

        if ($successAppend)
            define("webrotate360_headers", true);

        return ($output);
    }

    public function processHeaders()
    {
        try
        {
            if (($this->_popupEnabled == false) && ($this->_viewEnabled == false))
                return (false);

            $this->_headersArray[] = '<script type="text/javascript" src="' . $this->_scriptsPath . '/wr360hook.js"></script>';
            $this->_headersArray[] = '<link type="text/css" href="' . $this->_scriptsPath . '/wr360overrides.css" rel="stylesheet"/>';

            if ($this->_popupEnabled == true)
            {
                $this->_headersArray[] = '<link type="text/css" href="' . $this->_scriptsPath . '/prettyphoto/css/prettyphoto.css" rel="stylesheet"/>';
                $this->_headersArray[] = '<script type="text/javascript" src="' . $this->_scriptsPath . '/prettyphoto/js/jquery.prettyPhoto.js"></script>';
                $this->_headersArray[] = '<script type="text/javascript">jQuery(document).ready(function(){WR360InitGallery("'. $this->_popupGallery .'");});</script>';

                define("webrotate360_popupgallery", true);
            }

            if ($this->_viewEnabled == false)
                return (true);

            $this->_headersArray[] = '<link type="text/css" href="' . $this->_scriptsPath . '/html/css/' . $this->_viewerSkin . '.css" rel="stylesheet"/>';
            $this->_headersArray[] = '<script type="text/javascript" src="' . $this->_scriptsPath . '/html/js/imagerotator.js"></script>';

            if ($this->_viewerInPopup)
            {
                define("webrotate360_viewer_popup", true);

                $popupRefFmt = '%s?config=%s&root=%s&height=%s&lic=%s&grphpath=%s&iframe=true&width=%s&height=%s';

                $popupRefHrf = sprintf(
                    $popupRefFmt,
                    $this->_scriptsPath . "/viewloader_" .$this->_viewerSkin . ".html",
                    urlencode($this->_confFileURL),
                    urlencode($this->_rootPath),
                    $this->_viewerHeight,
                    urlencode($this->_licensePath),
                    urlencode("html/img/" . $this->_viewerSkin),
                    str_ireplace("%", "", $this->_viewerWidth),
                    $this->_viewerHeight);

                $srcThumbPath = $this->_scriptsPath . "/360thumb.png";

                $this->_headersArray[] = <<<HTML
                <script type="text/javascript">
                jQuery(document).ready(
                    function(){
                        WR360InitPopupViewer("$popupRefHrf", "$srcThumbPath", "$this->_pagePlaceholder");
                        WR360InitGallery("$this->_popupGallery");
                    });
                </script>
HTML;
            }
            else
            {
                define("webrotate360_viewer_embed", true);

                $this->_headersArray[] = <<<HTML
                    <style type="text/css">
                        $this->_pagePlaceholder{visibility: hidden;}
                    </style>
                    <script type="text/javascript">
                    jQuery(document).ready(
                        function(){
                            WR360InitEmbededViewer(
                                "$this->_licensePath",
                                "$this->_graphicsPath",
                                "$this->_confFileURL",
                                "$this->_pagePlaceholder",
                                "$this->_viewerWidth",
                                "$this->_viewerHeight",
                                "$this->_rootPath",
                                "$this->_baseWidth");
                        });
                    </script>
HTML;
            }
        }
        catch (Exception $exp)
        {
            return (false);
        }

        return (true);
    }
}

function addWR360Headers($controller, $output, $db)
{
    $hook = new WebRotate360HeaderHook($controller, $db);
    if (!$hook->isCanProceed())
        return ($output);

    if (!$hook->initProductRecord())
        return ($output);

    if (!$hook->initConfigSettings())
        return ($output);

    if (!$hook->processHeaders())
        return ($output);

    return ($hook->parseHeadersAndReturnOutput($output));
}

