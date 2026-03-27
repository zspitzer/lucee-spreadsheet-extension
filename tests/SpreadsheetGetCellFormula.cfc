component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetGetCellFormula", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Gets the specified formula for the specified cell", ()=>{
				workbooks.Each( ( type, wb )=>{
					s.addColumn( wb, "1,1" )
				})
				variables.theFormula = "SUM(A1:A2)"
				workbooks.Each( ( type, wb )=>{
					s.setCellFormula( wb, theFormula, 3, 1 )
					expect( SpreadsheetGetCellFormula( wb, 3, 1 ) ).toBe( theFormula )
					expect( s.getCellValue( wb, 3, 1 ) ).toBe( 2 )
				})
			})

		})

	}

}
