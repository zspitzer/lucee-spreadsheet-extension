<cfscript>
/**
* Adds a row of data to a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @data Comma-delimited list of values for the row
* @row Row number to insert at
* @column Starting column number
* @insert If true, inserts a new row; if false, replaces the existing row
* @delimiter Delimiter used in the data string
*/
void function SpreadsheetAddRow(
	required any spreadsheet,
	required string data,
	numeric row,
	numeric column,
	boolean insert=true,
  string delimiter=","
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.addRow( argumentCollection=arguments )
}
</cfscript>