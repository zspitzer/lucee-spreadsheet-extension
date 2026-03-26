<cfscript>
any function SpreadsheetGetCellValue(
	required any spreadsheet,
	required numeric row,
	required numeric column
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	return spreadsheetCFML.getCellValue( argumentCollection=arguments )
}
</cfscript>