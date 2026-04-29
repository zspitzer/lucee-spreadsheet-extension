<cfscript>
/**
* Returns information about a spreadsheet workbook (sheet names, active sheet, etc.).
* @spreadsheet The spreadsheet workbook object
*/
any function SpreadsheetInfo( required any spreadsheet ){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	return spreadsheetCFML.info( arguments.spreadsheet )
}
</cfscript>