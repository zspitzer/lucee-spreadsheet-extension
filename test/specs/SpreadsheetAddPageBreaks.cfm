<cfscript>
describe( "SpreadsheetAddPageBreaks", ()=>{

	beforeEach( ()=>{
		var data = QueryNew( "Header1,Header2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ], [ "e", "f" ], [ "g", "h" ] ] )
		variables.workbooks = { xls: s.workbookFromQuery( data ), xlsx: s.workbookFromQuery( data=data, xmlformat=true ) }
	})

	it( "Adds row page breaks at the specified rows", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetAddPageBreaks( spreadsheet=wb, rowBreaks="2,3" )
			var sheet = s.getSheetHelper().getActiveSheet( wb )
			// POI stores breaks zero-indexed (after row N-1)
			expect( sheet.getRowBreaks() ).toBe( [ 1, 2 ] )
		})
	})

	it( "Adds column page breaks at the specified columns", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetAddPageBreaks( spreadsheet=wb, columnBreaks="1" )
			var sheet = s.getSheetHelper().getActiveSheet( wb )
			expect( sheet.getColumnBreaks() ).toBe( [ 0 ] )
		})
	})

	it( "Throws if neither rowBreaks nor columnBreaks is supplied", ()=>{
		workbooks.Each( ( type, wb )=>{
			expect( ()=>SpreadsheetAddPageBreaks( wb ) ).toThrow()
		})
	})

})
</cfscript>
