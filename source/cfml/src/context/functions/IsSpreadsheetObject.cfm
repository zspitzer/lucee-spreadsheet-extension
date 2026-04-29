<cfscript>
/**
* Tests whether an object is a spreadsheet workbook.
* @testObject The object to test
*/
boolean function IsSpreadsheetObject( required any testObject ){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	return spreadsheetCFML.isSpreadsheetObject( arguments.testObject )
}
</cfscript>