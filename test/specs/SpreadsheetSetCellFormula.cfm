<cfscript>
describe( "SpreadsheetSetCellFormula", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
		workbooks.Each( ( type, wb )=>{
			s.addColumn( wb, "1,1" )
		})
		variables.theFormula = "SUM(A1:A2)"
	})

	it( "Sets the specified formula in the specified cell", ()=>{
		workbooks.Each( ( type, wb )=>{
			SpreadsheetSetCellFormula( wb, theFormula, 3, 1 )
			expect( s.getCellFormula( wb, 3, 1 ) ).toBe( theFormula )
			expect( s.getCellValue( wb, 3, 1 ) ).toBe( 2 )
		})
	})

})	
</cfscript>