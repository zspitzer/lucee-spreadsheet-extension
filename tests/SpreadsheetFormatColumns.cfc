component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetFormatColumns", ()=>{

			beforeEach( ()=>{
				s.clearCellStyleCache()
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
				workbooks.Each( ( type, wb )=>{
					s.addRows( wb, [ [ "a1", "b1" ], [ "a2", "b2" ] ] )
				})
			})

			it( "can format the cells in a column range", ()=>{
				workbooks.Each( ( type, wb )=>{
					SpreadsheetFormatColumns( wb, { italic: true }, "1-2" )
					expect( s.getCellFormat( wb, 1, 1 ).italic ).toBeTrue()
				})
			})

		})

	}

}
