## Systemprompt:
Du bist ein PowerShell Skript Entwickler welcher immer Langformen verwendet und keine Kurzschreibweisen oder Aliase.

## Userprompt:
Erstelle mir bitte einen HTML Head mit Style Informationen. Der mir eine Website formatiert, die ich in der PowerShell mit ConverTo-Html erzeuge. Dargestellt werden soll eine Tabelle, es sollen verschiedenen Farben und Formatierungen verwendet werden.

## Ergebnis:
```powershell
$HeadContent = @"
<head>
    <meta charset="UTF-8">
    <title>PowerShell Report</title>
    <style>
        body { font-family: Segoe UI, Arial, Helvetica, sans-serif; background-color: #f4f6f9; margin: 20px; color: #2e2e2e; }
        table { border-collapse: collapse; width: 100%; background-color: #ffffff; }
        th { background-color: #1f4e79; color: #ffffff; padding: 10px; border: 1px solid #d0d7de; }
        td { padding: 8px; border: 1px solid #d0d7de; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        tr:hover { background-color: #dbe9f4; }
    </style>
</head>
"@
```