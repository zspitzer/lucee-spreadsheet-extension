component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetFormatRow", ()=>{

			beforeEach( ()=>{
				s.clearCellStyleCache()
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
				workbooks.Each( ( type, wb )=>{
					s.addRow( wb, [ "a1", "b1" ] )
				})
			})

			it( "can all cells in a row", ()=>{
				workbooks.Each( ( type, wb )=>{
					SpreadsheetFormatRow( wb, { italic: true }, 1 )
					expect( s.getCellFormat( wb, 1, 1 ).italic ).toBeTrue()
				})
			})

		})

	}

}
