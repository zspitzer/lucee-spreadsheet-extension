<cfscript>
/**
* Returns the formula of a single cell in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @row Row number of the cell
* @column Column number of the cell
*/
any function SpreadsheetGetCellFormula(
	required any spreadsheet,
	numeric row,
	numeric column
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	return spreadsheetCFML.getCellFormula( argumentCollection=arguments )
}
</cfscript>