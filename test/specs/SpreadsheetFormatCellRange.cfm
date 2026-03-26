<cfscript>
describe( "SpreadsheetFormatCellRange", ()=>{
	
	beforeEach( ()=>{
		s.clearCellStyleCache()
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
		workbooks.Each( ( type, wb )=>{
			s.addRows( wb, [ [ "a1", "b1" ], [ "a2", "b2" ] ] )
		})
	})

	it( "can set formats on a cell range", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetFormatCellRange( wb, { italic: true }, 1, 1, 2, 2 ) //NB args order is different in spreadsheetCFML
			expect( s.getCellFormat( wb, 1, 1 ).italic ).toBeTrue()
		})
	})

})	
</cfscript>