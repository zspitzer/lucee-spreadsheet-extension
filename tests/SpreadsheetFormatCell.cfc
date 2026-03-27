component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetFormatCell", ()=>{

			beforeEach( ()=>{
				s.clearCellStyleCache()
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
				workbooks.Each( ( type, wb )=>{
					s.addColumn( wb, [ "a1", "a2" ] )
				})
			})

			it( "can set formats on a cell", ()=>{
				var format = { bold: true }
				workbooks.Each( ( type, wb )=>{
					SpreadsheetFormatCell( wb, format, 1, 1 )
					expect( s.getCellFormat( wb, 1, 1 ).bold ).toBeTrue()
				})
			})

		})

	}

}
