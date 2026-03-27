component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetNew", ()=>{

			it( "Returns an HSSF workbook by default", ()=>{
				var workbook = SpreadsheetNew()
				expect( s.isBinaryFormat( workbook ) ).toBeTrue()
			})

			it( "Returns an XSSF workbook if xmlFormat is true", ()=>{
				var workbook = SpreadsheetNew( xmlFormat=true )
				expect( s.isXmlFormat( workbook ) ).toBeTrue()
			})

			it( "Creates a workbook with the specified sheet name", ()=>{
				var workbook = SpreadsheetNew( "test" )
				expect( s.getSheetHelper().getActiveSheetName( workbook ) ).toBe( "test" )
			})

		})

	}

}
