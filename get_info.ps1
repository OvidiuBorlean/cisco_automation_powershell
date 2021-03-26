foreach($line in Get-Content .\hosts.db) {
    if($line -match $regex){
$c_username = "username"
$c_password = "password"
#echo $line
$hosts = Get-ChildItem -Path ./hosts.db -recurse |  Select-String -Pattern $line        
$result = $hosts.Line.Split(" ")
#echo $hosts
echo $result[0] + $result[1]
#echo $result[1]
$c_host = $result[0]
$c_intf = $result[1]
echo ---> $line >> output.txt
echo y | plink.exe $c_host@$c_host -pw $c_password "show proc cpu | inc util" >> output.txt
Start-Sleep -Seconds 2
echo ------------------------------------------------------------------- >> output.txt    



  }
}
