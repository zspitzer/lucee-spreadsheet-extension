<cfscript>
/**
* Deletes multiple rows from a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @range Row range to delete (e.g. "1-5" or "1,3,5")
*/
void function SpreadsheetDeleteRows(
	required any spreadsheet,
  required string range
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.deleteRows( arguments.spreadsheet, arguments.range )
}
</cfscript>