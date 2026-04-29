<cfscript>
/**
* Writes a spreadsheet workbook object to a file.
* @spreadsheet The spreadsheet workbook object
* @filePath Path to write the file to
* @overwrite Whether to overwrite an existing file
*/
void function SpreadsheetWrite( required any spreadsheet, required string filePath, boolean overwrite=false ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
  arguments.workbook = arguments.spreadsheet
  spreadsheetCFML.write( argumentCollection=arguments )
}
</cfscript>