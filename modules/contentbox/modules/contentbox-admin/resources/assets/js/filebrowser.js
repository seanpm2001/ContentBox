/**
 *********************************************************************************
 * Copyright since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.coldbox.org | www.luismajano.com | www.ortussolutions.com
 *********************************************************************************
 * This callbacks js is used to place common editor, OS software callbacks so they
 * can be reused.  You can also modify it to add your own.
 */

/**
 * CKEditor Call Back
 * @param sPath
 * @param sURL
 * @param sType
 */
window.fbCKSelect = function( sPath, sURL, sType ){
	/**
	 * Get specific URL param
	 * @param  {string} paramName Param Nam
	 * @return {string}           The cleaned param name
	 */
	var getURLParam = function( paramName ){
		var reParam 	= new RegExp( "(?:[\?&]|&amp;)" + paramName + "=([^&]+)", "i" );
		var match 	= window.location.search.match( reParam );
		return ( match && match.length > 1 ) ? match[ 1 ] : "" ;
	};

	if ( !sPath.length || sType === "dir" ){
		alert( "Please select a file first." );
		return;
	}
	var funcNum = getURLParam( "CKEditorFuncNum" );
	window.opener.CKEDITOR.tools.callFunction( funcNum, sURL );
	window.close();
}
/**
 * Generic close callback
 */
window.fbGenericClose = function(){
	window.close();
}
/**
 * Testing select calback
 * @param path
 * @param rPath
 * @param type
 */
window.fbTestChoose = function( path, rPath, type ){
	alert( "Path: " + path + "\n URL: " + rPath + "\n Type: " + type );
}
/**
 * Cancel called
 * @return {[type]} [description]
 */
window.fbTestCancel = function(){
	alert( "Cancel Called" );
}

window.fbUpload = function(){
	$( "#uploadBar" ).slideToggle();
}

/** Verifies which view is active */
window.fbVerifyActiveView = function() {
	let identifier = "#" + $listType.val() + $listFolder.val();
	$( identifier ).removeClass( "btn-more" ).addClass( "btn-default" );
}
