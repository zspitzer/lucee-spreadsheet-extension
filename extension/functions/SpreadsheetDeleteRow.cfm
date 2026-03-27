<cfscript>
/**
* Deletes a row from a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @row Row number to delete
*/
void function SpreadsheetDeleteRow(
	required any spreadsheet,
  required numeric row
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.deleteRow( arguments.spreadsheet, arguments.row )
}
</cfscript>