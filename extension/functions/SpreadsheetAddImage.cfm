<cfscript>
void function SpreadsheetAddImage(
	required any spreadsheet,
	required any arg2,
  required string arg3,
  string arg4
){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
  // for some reason argumentCollection doesn't work here (required anchor gets lost)
  if( arguments.KeyExists( "arg4" ) ){
    spreadsheetCFML.addImage( workbook: arguments.spreadsheet, imageData: arguments.arg2, imageType: arguments.arg3, anchor: arguments.arg4 )
    return;
  }
  spreadsheetCFML.addImage( workbook: arguments.spreadsheet, filepath: arguments.arg2, anchor: arguments.arg3 )
}
</cfscript>