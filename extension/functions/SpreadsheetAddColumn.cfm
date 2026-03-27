<cfscript>
/**
* Adds a column of data to a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @data Comma-delimited list of values for the column
* @startRow Starting row number
* @startColumn Column number to insert at
* @insert If true, inserts a new column; if false, replaces the existing column
* @delimiter Delimiter used in the data string
*/
void function SpreadsheetAddColumn(
	required any spreadsheet,
	required string data,
	numeric startRow,
	numeric startColumn,
	boolean insert=true,
	string delimiter=","
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.addColumn( argumentCollection=arguments )
}
</cfscript>