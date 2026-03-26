<cfscript>
describe( "SpreadsheetAutoSizeColumn", ()=>{

	it( "Doesn't error when passing valid arguments", ()=>{
    var data = QueryNew( "First,Last", "VarChar,VarChar", [ [ "a", "abracadabraabracadabra" ] ] )
    var workbooks = { xls: s.workbookFromQuery( data ), xlsx: s.workbookFromQuery( data=data, xmlformat=true ) }
		workbooks.Each( ( type, wb )=>{
			SpreadsheetAutoSizeColumn( wb, 2 )
		})
	})

})
</cfscript>