cls
set testLabels=spreadsheet
set testFilter=%~2
set testAdditional=d:\work\lucee-extensions\lucee-spreadsheet-extension\tests

if "%~1"=="" (
	set LUCEE_SRC=-DluceeVersion="7.1/snapshot/light"
) else (
	set LUCEE_SRC=-DluceeJar="%~1"
)

call ant -buildfile "d:\work\script-runner" %LUCEE_SRC% -Dwebroot="d:\work\lucee7\test" -Dexecute="/bootstrap-tests.cfm" -DextensionDir="d:\work\lucee-extensions\lucee-spreadsheet-extension" -Dextensions="org.lucee:image-extension"

if "%~1"=="" (
	call ant -buildfile "d:\work\script-runner" -DluceeVersion="7.0/snapshot/light" -Dwebroot="d:\work\lucee7\test" -Dexecute="/bootstrap-tests.cfm" -DextensionDir="d:\work\lucee-extensions\lucee-spreadsheet-extension" -Dextensions="org.lucee:image-extension"
	call ant -buildfile "d:\work\script-runner" -DluceeVersion="6/snapshot/light" -Dwebroot="d:\work\lucee7\test" -Dexecute="/bootstrap-tests.cfm" -DextensionDir="d:\work\lucee-extensions\lucee-spreadsheet-extension" -Dextensions="org.lucee:image-extension"
)
