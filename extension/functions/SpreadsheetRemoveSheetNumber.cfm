<cfscript>
void function SpreadsheetRemoveSheetNumber(
	required any spreadsheet,
  required numeric sheetNumber
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.removeSheetNumber( arguments.spreadsheet, arguments.sheetNumber )
}
</cfscript>