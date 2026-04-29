<cfscript>
/**
* Returns the value of a single cell in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @row Row number of the cell
* @column Column number of the cell
*/
any function SpreadsheetGetCellValue(
	required any spreadsheet,
	required numeric row,
	required numeric column
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	return spreadsheetCFML.getCellValue( argumentCollection=arguments )
}
</cfscript>