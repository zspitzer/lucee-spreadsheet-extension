<cfscript>
any function SpreadsheetGetCellComment(
	required any spreadsheet,
	numeric row,
	numeric column
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	return spreadsheetCFML.getCellComment( argumentCollection=arguments )
}
</cfscript>