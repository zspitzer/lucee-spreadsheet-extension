component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetGetColumnCount", ()=>{

			beforeEach( ()=>{
				var data = QueryNew( "Header1,Header2,Header3", "VarChar,VarChar,VarChar", [ [ "a", "b", "c" ] ] )
				variables.workbooks = { xls: s.workbookFromQuery( data ), xlsx: s.workbookFromQuery( data=data, xmlformat=true ) }
			})

			it( "Returns the number of columns in the active sheet", ()=>{
				workbooks.Each( ( type, wb )=>{
					expect( SpreadsheetGetColumnCount( wb ) ).toBe( 3 )
				})
			})

			it( "Returns the column count for a named sheet", ()=>{
				workbooks.Each( ( type, wb )=>{
					s.createSheet( wb, "second" )
					s.setActiveSheet( wb, "second" )
					s.addRow( wb, "x,y" )
					s.setActiveSheetNumber( wb, 1 )
					expect( SpreadsheetGetColumnCount( wb, "second" ) ).toBe( 2 )
				})
			})

			it( "Returns zero for an empty sheet", ()=>{
				var emptyXls = s.newXls()
				var emptyXlsx = s.newXlsx()
				expect( SpreadsheetGetColumnCount( emptyXls ) ).toBe( 0 )
				expect( SpreadsheetGetColumnCount( emptyXlsx ) ).toBe( 0 )
			})

		})

	}

}
