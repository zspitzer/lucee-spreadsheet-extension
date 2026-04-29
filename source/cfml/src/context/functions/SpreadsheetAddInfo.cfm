<cfscript>
/**
* Adds document metadata properties to a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @properties A struct of metadata properties (e.g. author, title, subject)
*/
void function SpreadsheetAddInfo(
	required any spreadsheet,
	required struct properties
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.addInfo( arguments.spreadsheet, arguments.properties )
}
</cfscript>