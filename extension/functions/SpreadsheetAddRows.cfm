<cfscript>
/* NB: formats argument not supported */
void function SpreadsheetAddRows(
	required any spreadsheet,
	required query data,
	numeric row,
	numeric column,
	boolean insert=true,
	boolean autoSizeColumns=true
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.addRows( argumentCollection=arguments )
}
</cfscript>