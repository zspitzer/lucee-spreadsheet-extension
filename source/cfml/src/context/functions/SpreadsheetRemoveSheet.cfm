<cfscript>
/**
* Removes a sheet from a spreadsheet workbook by name.
* @spreadsheet The spreadsheet workbook object
* @sheetName Name of the sheet to remove
*/
void function SpreadsheetRemoveSheet(
	required any spreadsheet,
  required string sheetName
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.removeSheet( arguments.spreadsheet, arguments.sheetName )
}
</cfscript>