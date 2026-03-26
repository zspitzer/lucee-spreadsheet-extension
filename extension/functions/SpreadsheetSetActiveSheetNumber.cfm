<cfscript>
void function SpreadsheetSetActiveSheetNumber(
	required any spreadsheet,
  required numeric sheetNumber
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setActiveSheetNumber( arguments.spreadsheet, arguments.sheetNumber )
}
</cfscript>