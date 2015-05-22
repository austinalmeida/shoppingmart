<?php
/**
* @version     1.5.1
* @module      WebRotate 360 Product Viewer for OpenCart
* @author      WebRotate 360 LLC
* @copyright   Copyright (C) 2014 WebRotate 360 LLC. All rights reserved.
* @license     GNU General Public License version 2 or later (http://www.gnu.org/copyleft/gpl.html).
*/
?>

<?php
    error_reporting(E_ALL);
    ini_set('display_errors', '1');

    $style = '<style type="text/css">
        .wr360div { margin:20px 0; width:100%; border:1px solid #dfdfdf; }
        .wr360div table { width:100%; }
        .wr360div .wr360table th { vertical-align:middle; border-bottom:1px solid #dfdfdf; padding:15px 5px; font-weight:bold; background:#fff; text-align:left; padding:0 20px; }
        .wr360div .wr360table td { vertical-align:middle; border-bottom:1px solid #dfdfdf; padding:10px 5px; background:#fff; width:100%; }
        .wr360div .wr360table tr.back th, .wr360div .wr360table tr.back td { background:#f9f9f9; }
        .wr360div .wr360table tr.last th, .wr360div .wr360table tr.last td { border:none; }
        .wr360comment { font-size:11px;font-style:normal;font-weight:normal; }
    </style>';

    $header = str_replace('</head>',$style.'</head>', $header);
?>

<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" onclick="submitGrid(); $('#form-webrotate').submit();"  form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i>Edit WebRotate 360 Settings</h3>
            </div>
        <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-webrotate" class="form-horizontal">
            <div class="wr360div">
                <p style="padding: 15px 20px 23px 20px; background:#F9F9F9;margin:0;border-bottom: 1px solid #DFDFDF;">
                    If you haven't created 360 product views with WebRotate 360 Product Viewer before, please <a href="http://www.webrotate360.com/360-product-viewer.html" target="_blank">download</a> our free software (Windows or Mac OS X) and follow this simple <a href="https://www.youtube.com/watch?v=W3uFpXy1ne4" target="_blank">YouTube video</a> or check out this <a href="http://www.webrotate360.com/360_product_viewer_download/Readme.pdf" target="_blank">user guide</a> on how to create 360 spins on your computer which you can then upload to your OpenCart installation via FTP. Note that you only need to upload a single folder that is auto-created under 360_assets in the published folder of your SpotEditor project upon publish.
                    <br/><br/>To see a sample 360 view supplied with this module, just enter the following url under Config File URL in the table below next to your test product (remember to enable it in the table): /360assets/sampleshoe/config.xml.
                    Or use a full url including your domain name, e.g http://yoursite.com/360assets/sampleshoe/config.xml.
                    For questions and support, please visit <a href="http://www.360-product-views.com/forum/" target="_blank">our forum</a> or email our <a href="mailto:support@webrotate360.com">support</a>.
                </p>
                <table class="wr360table" cellspacing="0">
                    <tr>
                        <th width="20%"><label for="webrotate360_status">Module Enabled</label></th>
                        <td width="80%">
                            <select name="webrotate360_status">
                                <?php if ($webrotate360_status) { ?>
                                    <option value="1" selected="selected">Enabled</option>
                                    <option value="0">Disabled</option>
                                <?php } else { ?>
                                    <option value="1">Enabled</option>
                                    <option value="0" selected="selected">Disabled</option>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>
                    <tr class="back">
                        <th width="20%"><label for="divID">Page Placeholder (#id or .class) </label></th>
                        <td width="80%">
                            <input type="text" style="width:200px" name="webrotate360_divID" id="divID" value="<?php echo $webrotate360_divID; ?>">
                        <span class="wr360comment"><br/>Page placeholder is an HTML element on your product pages where WebRotate 360 Product Viewer will be embedded if enabled. #wr360embed is a default that is already integrated in the def_product vQmod fine-tuned for the default OpenCart v2.x product template. If not using def_product vQmod or if it doesn't work with your theme, you will need to identify an existing element on your product pages for 360 views and use its class name or id in this field. The viewer will replace any content residing under this element for those products where it's configured (using the table below).
                        If you still see the main product image instead of the 360 view on a configured product page, this setting is usually a culprit. Please contact us using the links above if any questions - we would be happy to assist.</span>
                        </td>
                    </tr>
                    <tr>
                        <th width="20%"><label for="viewerWidth">Viewer Width (px or %)</label></th>
                        <td width="80%">
                            <input type="text" style="width:200px" name="webrotate360_viewerWidth" id="viewerWidth" value="<?php echo $webrotate360_viewerWidth; ?>">
                            <span class="wr360comment"><br/>Viewer width in pixel. When Viewer In Popup is not checked below, can be a relative value (e.g. 100%) for responsive themes.</span>
                        </td>
                    </tr>
                    <tr class="back">
                        <th width="20%"><label for="viewerHeight">Viewer Height (px)</label></th>
                        <td width="80%">
                            <input type="text" style="width:200px" name="webrotate360_viewerHeight" id="viewerHeight" value="<?php echo $webrotate360_viewerHeight; ?>">
                            <span class="wr360comment"><br/>Viewer height in pixel.</span>
                        </td>
                    </tr>
                    <tr>
                        <th width="20%"><label for="viewerInPopup">Viewer In Popup</label></th>
                        <td>
                            <?php $checkedVal = $webrotate360_viewerInPopup;?>
                            <?php $checkedFlg = ($checkedVal) ? 'checked="checked"' : '' ?>
                            <input type="checkbox" id="viewerInPopup" name="webrotate360_viewerInPopup" <?php echo $checkedFlg; ?>>
                            <p class="description">If checked, the viewer doesn't embed itself inside the page placeholder. Instead, a small thumbnail graphic is inserted inside the placeholder which then activates the prettyPhoto lightbox popup with a 360 view on click. Popup Gallery below should not be set to disabled for this to work. If using def_product vQmod, checking this setting will add an extra clickable thumbnail into the product gallery.
                            Thumb graphic is 74x74 and is located under /catalog/controller/module/wr360 as 360thumb.png.</p>
                        </td>
                    </tr>
                    <tr class="back">
                        <th width="20%"><label for="baseWidth">Responsive Base Width (px)</label></th>
                        <td width="80%">
                            <input type="text" style="width:200px" name="webrotate360_baseWidth" id="baseWidth" value="<?php echo $webrotate360_baseWidth; ?>">
                            <span class="wr360comment"><br/>Optionally force viewer to scale its height relative to your original viewer width (base width). The setting usually applies when your viewer width is relative (%), i.e when your product page is responsive. It doesn't apply when Viewer In Popup is checked.</span>
                        </td>
                    </tr>
                    <tr>
                        <th width="20%"><label for="configFileURL">Master Config URL (PRO)</label></th>
                        <td width="80%">
                            <input type="text" style="width:400px" name="webrotate360_configFileURL" id="configFileURL" value="<?php echo $webrotate360_configFileURL; ?>">
                            <span class="wr360comment"><br/>Master Config allows setting a single XML configuration file for all products and only enter a Root Path URL pointing to a product asset folder for each product on your server (or CDN) in the following table. If not using Master Config, just enter Config File URL for each product in the table below.</span>
                        </td>
                    </tr>
                    <tr class="back">
                        <th width="20%"><label for="skinCSS">Viewer Skin</label></th>
                        <td width="80%">
                            <?php
                                $viewerSkins = array("basic", "thin", "round", "retina", "empty");
                            ?>
                            <select id="skinCSS" name="webrotate360_skinCSS" style="min-width:106px;">
                                <?php foreach($viewerSkins as $skin):?>
                                    <?php $selected = ($webrotate360_skinCSS == $skin) ? 'selected="selected"' : '' ?>
                                    <option value="<?php echo $skin?>" <?php echo $selected ?> ><?php echo $skin ?></option>
                                <?php endforeach?>
                            </select>
                            <span class="wr360comment"><br/>Viewer skin.</span>
                        </td>
                    </tr>
                    <tr>
                        <th width="20%"><label for="popupSkin">Popup Gallery</label></th>
                        <td width="80%">
                            <?php
                                $popupSkins = array("disabled", "default", "light_rounded", "dark_rounded", "dark_square", "light_square", "facebook");
                            ?>
                            <select id="popupSkin" name="webrotate360_prettyPhotoSkin">
                                <?php foreach($popupSkins as $skin):?>
                                    <?php $selected = ($webrotate360_prettyPhotoSkin == $skin) ? 'selected="selected"' : '' ?>
                                    <option value="<?php echo $skin?>" <?php echo $selected ?> ><?php echo $skin ?></option>
                                <?php endforeach?>
                            </select>
                            <span class="wr360comment"><br/>Choose one of the prettyPhoto skins to enable the popup gallery. If enabled, the popup will be used for all of your product images if def_product vQmod is used. Required when 360 view is configured to launch inside the popup (i.e when Viewer In Popup is checked).</span>
                        </td>
                    </tr>
                    <tr class="back last">
                        <th width="20%"><label for="graphicsPath">License Path</label></th>
                        <td width="80%">
                            <input type="text" style="width:400px" name="webrotate360_licensePath" id="graphicsPath" value="<?php echo $webrotate360_licensePath; ?>">
                            <span class="wr360comment"><br/>URL path to license.lic on this server (PRO and Enterprise). Click <a href="http://www.webrotate360.com/360-product-viewer-buy.html" target="_blank">HERE</a> for more details.</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="grid_custom_editing" style="margin:auto; width:100%"></div>
            <input type="hidden" id="submitProducts" name="submitProducts"/>
        </form>
    </div>
</div>


<script type="text/javascript" src="./controller/module/wr360/pqgrid/jquery-ui.min.js"></script>
<script type="text/javascript" src="./controller/module/wr360/pqgrid/pqgrid.min.js"></script>
<link rel="stylesheet" href="./controller/module/wr360/pqgrid/pqgrid.css" />
<link rel="stylesheet" href="./controller/module/wr360/pqgrid/jquery-ui.css" />

<style type="text/css">
	div.pq-grid-toolbar-search
    {
        text-align:left;
    }
    div.pq-grid-toolbar-search *
    {
        margin:1px 5px 1px 0px; 
        vertical-align:middle;       
    }
    div.pq-grid-toolbar-search .pq-separator
    {
       margin-left:10px;   
       margin-right:10px;   
    }
    div.pq-grid-toolbar-search select
    {
        height:18px;    
        position:relative;
    }
    div.pq-grid-toolbar-search input.pq-search-txt
    {
        width:180px;border:1px solid #b5b8c8;
        /*text-align:center; */
        height:16px;
        padding:0px 5px;
    }
    .pq-grid-header td
    {
        border:none;
    }
</style>

<script type="text/javascript"><!--
    var COL_PRODUCT_ID = 0;
    var COL_NAME = 1;
    var COL_WR360_ENABLED = 2;
    var COL_CONFIG_FILE_URL = 3;
    var COL_ROOT_PATH = 4;
    var COL_MODIFIED = 5;
    var GRID_ELEMENT_NAME = "div#grid_custom_editing";

    $(document).ready(function (e){
     
        var pqSearch = {
            txt: "",
            rowIndices: [],
            curIndx: null,
            colIndx: 0,
            sortIndx: null,
            sortDir:null,
            results: null,

            prevResult: function () {
                var colIndx = this.colIndx,
                    rowIndices = this.rowIndices;
                if (rowIndices.length == 0) {
                    this.curIndx = null;
                }
                else if (this.curIndx == null || this.curIndx == 0) {
                    this.curIndx = rowIndices.length - 1;
                }
                else {
                    this.curIndx--;
                }
                this.updateSelection(colIndx);
            },
			
            nextResult: function () {
                var rowIndices = this.rowIndices;
                if (rowIndices.length == 0) {
                    this.curIndx = null;
                }
                else if (this.curIndx == null) {
                    this.curIndx = 0;
                }
                else if (this.curIndx < rowIndices.length - 1) {
                    this.curIndx++;
                }
                else {
                    this.curIndx = 0;
                }
                this.updateSelection();
            },
			
            updateSelection: function () {
                var colIndx = this.colIndx,
                    curIndx = this.curIndx,
                    rowIndices = this.rowIndices;
                if (rowIndices.length > 0) {
                    this.results.html("Selected " + (curIndx + 1) + " of " + rowIndices.length + " match(es).");
                }
                else {
                    this.results.html("Nothing found.");
                }
                wr360grid.pqGrid("setSelection", null);
                wr360grid.pqGrid("setSelection", { rowIndx: rowIndices[curIndx], colIndx: colIndx });
            },
			
            search: function () {
                var txt = $("input.pq-search-txt").val().toUpperCase(),
                    colIndx = $("select#pq-crud-select-column").val(),
                    DM = wr360grid.pqGrid("option", "dataModel"),
                    sortIndx = DM.sortIndx,
                    sortDir = DM.sortDir;
                if (txt == this.txt && colIndx == this.colIndx && sortIndx == this.sortIndx && sortDir == this.sortDir) {
                    return;
                }
                this.rowIndices = [], this.curIndx = null;
                this.sortIndx = sortIndx;
                this.sortDir = sortDir;
                if (colIndx != this.colIndx) {
                    wr360grid.pqGrid("option", "customData", null);
                    wr360grid.pqGrid("refreshColumn", { colIndx: this.colIndx });
                    this.colIndx = colIndx;
                }

                if (txt != null && txt.length > 0) {
                    txt = txt.toUpperCase();

                    var data = DM.data;
                    for (var i = 0; i < data.length; i++) {
                        var row = data[i];
                        var cell = row[this.colIndx].toUpperCase();
                        if (cell.indexOf(txt) != -1) {
                            this.rowIndices.push(i);
                        }
                    }
                }
                wr360grid.pqGrid("option", "customData", { foundRowIndices: this.rowIndices, txt: txt, searchColIndx: colIndx });
                wr360grid.pqGrid("refreshColumn", { colIndx: colIndx });
                this.txt = txt;
            },
			
            render: function (ui) {
                var rowIndxPage = ui.rowIndxPage,
                rowIndx = ui.rowIndx,
                rowData=ui.rowData,
                dataIndx = ui.dataIndx,
                colIndx = ui.colIndx,
                val = rowData[dataIndx];

                if (ui.customData) {
                    var rowIndices = ui.customData.foundRowIndices,
                    searchColIndx = ui.customData.searchColIndx,
                    txt = ui.customData.txt,
                    txtUpper = txt.toUpperCase(),
                    valUpper = val.toUpperCase();
                    if ($.inArray(rowIndx, rowIndices) != -1 && colIndx == searchColIndx) {
                        var indx = valUpper.indexOf(txtUpper);
                        if (indx >= 0) {
                            var txt1 = val.substring(0, indx);
                            var txt2 = val.substring(indx, indx + txt.length);
                            var txt3 = val.substring(indx + txt.length);
                            return txt1 + "<span style='background:yellow;color:#333;'>" + txt2 + "</span>" + txt3;
                        }
                        else {
                            return val;
                        }
                    }
                }
                return val;
            }
        }

        var dropDownEditor = function (ui, arr) {
            var $cell = ui.$cell, data = ui.data, rowIndx = ui.rowIndxPage, colIndx = ui.colIndx;
            var dataCell = $.trim(data[rowIndx][colIndx]);
            var str = "";
            for (var i = 0; i < arr.length; i++) {
                if (dataCell == arr[i])
                    str += "<option selected>" + arr[i] + "</option>";
                else
                    str += "<option>" + arr[i] + "</option>";
            }
            var $sel = $("<select>" + str + "</select>")
            .appendTo($cell);
        }
		
        var saveDropdownCell = function (ui) {
            var editCellData = ui.$cell.children().val();
            return editCellData;
        }
		
        var saveEditCell = function (ui) {
            var text = ui.$cell.children().html();
            return trimAllTrailingBRs(text);
        }

        var colM = [
            { title: "ID", width: 10, editable:false, render: function (ui) {return pqSearch.render(ui);} },
            { title: "Name", width: 200, editable:false, render: function (ui) {return pqSearch.render(ui);} },
            { title: "Enabled", width: 70,
                editor: function (ui) {
                    var arr = ['Yes', 'No'];
                    dropDownEditor(ui, arr);
                },
                getEditCellData: saveDropdownCell,
                render: function (ui) {return pqSearch.render(ui);}
            },
            { title: "Config File URL", width: 300, render: function (ui) {return pqSearch.render(ui);}
                ,getEditCellData: saveEditCell
            },
            { title: "Root Path (PRO only)", width: 300, render: function (ui) {return pqSearch.render(ui);}
                ,getEditCellData: saveEditCell
            }
        ];

        var dataModel = {
            location: "local",
            sorting: "local",
            sortIndx: 0,
            sortDir: "up",
            paging: "local",
            rPPOptions: [10, 20, 50],
            curPage: 1,
            rPP: 20
        }

        var newObj = {
            width: "100%",
            height: 630,
            title: "<b>Configure product views for each product</b>",
            dataModel: dataModel,            
            colModel: colM,
            selectionModel: { type: 'cell' },     
            editModel: { saveKey: '13' },
            columnBorders: true,
            numberCell: false,
            scrollModel:{pace: 'fast', horizontal: false}
        };
        
        var wr360grid = $(GRID_ELEMENT_NAME);
        
        wr360grid.on("pqgridrender", function (evt, obj) {
            var $toolbar = $("<div class='pq-grid-toolbar pq-grid-toolbar-search'></div>").appendTo($(".pq-grid-top", this));

            $("<span>Search</span>").appendTo($toolbar);

            $("<input type='text' class='pq-search-txt'/>").appendTo($toolbar).keyup(function (evt) {
                pqSearch.search();
                if (evt.keyCode == 38) {
                    pqSearch.prevResult();
                }
                else {
                    pqSearch.nextResult();
                }
            });

            $("<select id='pq-crud-select-column'>\
                <option value='0'>ID</option>\
                <option value='1' selected>Name</option>\
                <option value='2'>Enabled</option>\
                <option value='3'>Config File URL</option>\
                <option value='4'>Root Path</option>\
                </select>").appendTo($toolbar).change(function () {
                    pqSearch.search();
                    pqSearch.nextResult();
                });
				
            $("<span class='pq-separator'></span>").appendTo($toolbar);

            $("<button title='Previous Result'></button>")
				.appendTo($toolbar)
				.button({ icons: { primary: "ui-icon-circle-triangle-w" }, text: false }).bind("click", function (evt) {
					pqSearch.prevResult();
					return false;
				});
					
            $("<button title='Next Result'></button>")
				.appendTo($toolbar)
				.button({ icons: { primary: "ui-icon-circle-triangle-e" }, text: false }).bind("click", function (evt) {
					pqSearch.nextResult();
					return false;
				});
					
            $("<span class='pq-separator'></span>").appendTo($toolbar);

            pqSearch.results = $("<span class='pq-search-results'>Nothing found.</span>").appendTo($toolbar);

        });
        
        wr360grid.on("pqgridsort", function (evt, obj) {
            pqSearch.search();
            pqSearch.nextResult();
        });
        
        wr360grid.on("pqgridrowselect pqgridcellselect", function (evt, obj) {
            if (evt.originalEvent && evt.originalEvent.type == "click") {
                if (pqSearch.rowIndices.length > 0) {
                    pqSearch.results.html(pqSearch.rowIndices.length + " match(es).");
                }
            }
        });
                
        wr360grid.on("pqgridquiteditmode", function (evt, ui) {
            // Exclude esc and tab:
            if (evt.keyCode != 27 && evt.keyCode != 9) {
                wr360grid.pqGrid("saveEditCell");
            }
        });
		
        wr360grid.on("pqgridcellsave", function (evt, ui) {
            var data = ui.data, rowIndxPage = ui.rowIndxPage, dataIndx = ui.dataIndx, val = data[rowIndxPage][dataIndx];
            var productID = data[rowIndxPage][0];
            var dataModel = $(GRID_ELEMENT_NAME).pqGrid( "option", "dataModel" )
            $.each(dataModel.data, function(_ind, _data) {
                if (_data[COL_PRODUCT_ID] == productID) {
                    _data[COL_MODIFIED] = "1";
                    return false;
                }
            });
        });
        
        wr360grid.mouseleave(function (e) {
            wr360grid.pqGrid("saveEditCell");
        });

        $.getJSON("./index.php?route=module/webrotate360/getproducts&token=<?php echo $token; ?>",
            function(data){
                var arrProducts = [];
                $.each(data, function (index, value) {
                    var product = [];
                    $.each(value, function (ind, val) {
                        product.push(val);
                    });
                    arrProducts.push(product);
                });
                dataModel.data = arrProducts;
                wr360grid.pqGrid(newObj);
            }
        );
    });

    function submitGrid() {
        var submitValue = "";
        var productAdded = false;
        var dataModel = $(GRID_ELEMENT_NAME).pqGrid( "option", "dataModel" ); 
        $.each(dataModel.data, function(_ind, _data) {
            if (_data[COL_MODIFIED] == "1") {
                submitValue += '{"product_id":"' + _data[COL_PRODUCT_ID] + '",';
                submitValue += '"root_path":"' + trimAllTrailingBRs(_data[COL_ROOT_PATH]) + '",';
                submitValue += '"config_file_url":"' + trimAllTrailingBRs(_data[COL_CONFIG_FILE_URL]) + '",';
                submitValue += '"wr360_enabled":"' + _data[COL_WR360_ENABLED] + '"},';
            }
        });
        submitValue = submitValue.replace(/.$/, "");
        submitValue = "[" + submitValue + "]";
        $("#submitProducts").val(submitValue);
    }
    
    function trimAllTrailingBRs(str) {
        while (str.match(/<br>$/))
            str = str.replace(/<br>$/, "");
        return str;
    }
//-->
</script>

<?php echo $footer; ?>