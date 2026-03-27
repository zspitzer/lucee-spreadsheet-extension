component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetAddFreezePane", ()=>{

			beforeEach( ()=>{
				var data = QueryNew( "Header1,Header2,Header3", "VarChar,VarChar,Varchar", [ [ "a", "b", "c" ], [ "d", "e", "f" ], [ "g", "h", "i" ] ] )
				variables.workbooks = { xls: s.workbookFromQuery( data ), xlsx: s.workbookFromQuery( data=data, xmlformat=true ) }
			})

			it( "Creates a freezepane split horizontally and/or vertically", ()=>{
				workbooks.Each( ( type, wb )=>{
					var sheet = s.getSheetHelper().getActiveSheet( wb )
					expect( sheet.getPaneInformation() ).toBeNull()
					SpreadsheetAddFreezePane( wb, 0, 1 )
					expect( sheet.getPaneInformation().isFreezePane() ).toBeTrue()
					expect( sheet.getPaneInformation().getVerticalSplitPosition() ).toBe( 0 )
					expect( sheet.getPaneInformation().getHorizontalSplitPosition() ).toBe( 1 )
					SpreadsheetAddFreezePane( wb, 1, 1 )
					expect( sheet.getPaneInformation().isFreezePane() ).toBeTrue()
					expect( sheet.getPaneInformation().getVerticalSplitPosition() ).toBe( 1 )
					expect( sheet.getPaneInformation().getHorizontalSplitPosition() ).toBe( 1 )
					SpreadsheetAddFreezePane( wb, 1, 0 )
					expect( sheet.getPaneInformation().isFreezePane() ).toBeTrue()
					expect( sheet.getPaneInformation().getVerticalSplitPosition() ).toBe( 1 )
					expect( sheet.getPaneInformation().getHorizontalSplitPosition() ).toBe( 0 )
				})
			})

			it( "Can optionally set the visible left column in the right pane and/or top row in the bottom pane", ()=>{
				workbooks.Each( ( type, wb )=>{
					var sheet = s.getSheetHelper().getActiveSheet( wb )
					SpreadsheetAddFreezePane( wb, 1, 1, 3 )
					expect( sheet.getPaneInformation().isFreezePane() ).toBeTrue()
					expect( sheet.getPaneInformation().getVerticalSplitLeftColumn() ).toBe( 3 )
					expect( sheet.getPaneInformation().getHorizontalSplitTopRow() ).toBe( 1 )
					SpreadsheetAddFreezePane( spreadsheet=wb, freezeColumn=1, freezeRow=1, row=3 )
					expect( sheet.getPaneInformation().isFreezePane() ).toBeTrue()
					expect( sheet.getPaneInformation().getVerticalSplitLeftColumn() ).toBe( 1 )
					expect( sheet.getPaneInformation().getHorizontalSplitTopRow() ).toBe( 3 )
					SpreadsheetAddFreezePane( wb, 1, 1, 3, 3 )
					expect( sheet.getPaneInformation().isFreezePane() ).toBeTrue()
					expect( sheet.getPaneInformation().getVerticalSplitLeftColumn() ).toBe( 3 )
					expect( sheet.getPaneInformation().getHorizontalSplitTopRow() ).toBe( 3 )
				})
			})

		})

	}

}
