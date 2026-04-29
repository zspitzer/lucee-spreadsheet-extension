<cfscript>
/**
* Adds multiple rows of data from a query to a spreadsheet workbook.
* NB: formats argument not supported
* @spreadsheet The spreadsheet workbook object
* @data A query object containing the data to add
* @row Starting row number
* @column Starting column number
* @insert If true, inserts new rows; if false, replaces existing rows
* @autoSizeColumns Whether to auto-size columns to fit content
*/
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