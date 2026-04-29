<cfscript>
describe( "SpreadsheetAddAutofilter", ()=>{

	beforeEach( ()=>{
		var data = QueryNew( "Header1,Header2,Header3", "VarChar,VarChar,VarChar", [ [ "a", "b", "c" ], [ "d", "e", "f" ] ] )
		variables.workbooks = { xls: s.workbookFromQuery( data ), xlsx: s.workbookFromQuery( data=data, xmlformat=true ) }
	})

	it( "Adds an autofilter spanning the header row by default", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetAddAutofilter( wb )
		})
		// XSSF exposes the autofilter via CTWorksheet; HSSF has no equivalent public getter
		expect( workbooks.xlsx.getSheetAt( 0 ).getCTWorksheet().isSetAutoFilter() ).toBeTrue()
	})

	it( "Accepts an explicit cell range", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetAddAutofilter( spreadsheet=wb, cellRange="A1:C2" )
		})
		expect( workbooks.xlsx.getSheetAt( 0 ).getCTWorksheet().isSetAutoFilter() ).toBeTrue()
	})

	it( "Accepts a row number to filter on", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetAddAutofilter( spreadsheet=wb, row=2 )
		})
		expect( workbooks.xlsx.getSheetAt( 0 ).getCTWorksheet().isSetAutoFilter() ).toBeTrue()
	})

})
</cfscript>
