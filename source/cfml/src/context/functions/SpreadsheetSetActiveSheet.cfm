<cfscript>
/**
* Sets the active sheet in a spreadsheet workbook by name.
* @spreadsheet The spreadsheet workbook object
* @sheetName Name of the sheet to make active
*/
void function SpreadsheetSetActiveSheet(
	required any spreadsheet,
  required string sheetName
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setActiveSheet( arguments.spreadsheet, arguments.sheetName )
}
</cfscript>