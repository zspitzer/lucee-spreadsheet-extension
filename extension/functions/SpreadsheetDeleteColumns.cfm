<cfscript>
/**
* Deletes multiple columns from a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @range Column range to delete (e.g. "1-5" or "1,3,5")
*/
void function SpreadsheetDeleteColumns(
	required any spreadsheet,
  required string range
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.deleteColumns( arguments.spreadsheet, arguments.range )
}
</cfscript>