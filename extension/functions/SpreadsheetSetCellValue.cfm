<cfscript>
void function SpreadsheetSetCellValue(
	required any spreadsheet,
	required any value,
	required numeric row,
	required numeric column
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setCellValue( argumentCollection=arguments )
}
</cfscript>