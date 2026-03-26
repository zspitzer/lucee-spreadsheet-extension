<cfscript>
void function SpreadsheetSetCellFormula(
	required any spreadsheet,
	required string formula,
	required numeric row,
	required numeric column
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setCellFormula(
    arguments.spreadsheet,
    arguments.formula,
    arguments.row,
    arguments.column
  )
}
</cfscript>