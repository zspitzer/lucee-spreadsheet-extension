<cfscript>
void function SpreadsheetWrite( required any spreadsheet, required string filePath, boolean overwrite=false ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
  arguments.workbook = arguments.spreadsheet
  spreadsheetCFML.write( argumentCollection=arguments )
}
</cfscript>