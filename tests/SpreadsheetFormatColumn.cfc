component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetFormatColumn", ()=>{

			beforeEach( ()=>{
				s.clearCellStyleCache()
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
				workbooks.Each( ( type, wb )=>{
					s.addColumn( wb, [ "a1", "a2" ] )
				})
			})

			it( "can format all cells in a column", ()=>{
				workbooks.Each( ( type, wb )=>{
					SpreadsheetFormatColumn( wb, { italic: true }, 1 )
					expect( s.getCellFormat( wb, 1, 1 ).italic ).toBeTrue()
				})
			})

		})

	}

}
