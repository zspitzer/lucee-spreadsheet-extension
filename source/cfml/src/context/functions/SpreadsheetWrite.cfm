<cfscript>
/**
* Writes a spreadsheet workbook object to a file.
* @spreadsheet The spreadsheet workbook object
* @filePath Path to write the file to
* @overwrite Whether to overwrite an existing file
* @password Password used to encrypt the file. xlsx only.
*/
void function SpreadsheetWrite(
	required any spreadsheet,
	required string filePath,
	boolean overwrite=false,
	string password
){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
  arguments.workbook = arguments.spreadsheet
  spreadsheetCFML.write( argumentCollection=arguments )
}
</cfscript>
