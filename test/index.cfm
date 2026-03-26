<cfscript>
if( !ExtensionExists( "037A27FF-0B80-4CBA-B954BEBD790B460E" ) )
	Throw( message="The Spreadsheet Extension has not been installed" )
paths = [ "root.test.suite" ]
try{
	testRunner = New testbox.system.TestBox( paths )
	Echo( testRunner.run() )
}
catch( any exception ){
	Dump( exception )
}
</cfscript>